/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import Controller.WebSocket.OrderUpdateEndpoint;
import DAL.CartItemDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.PaymentMethodDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import Models.Order;
import Models.OrderDetail;
import Models.OrderSaleManager;
import Models.PaymentMethod;
import Models.Product;
import Models.ProductDetail;
import Models.User;
import Util.Config;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AddToOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        HttpSession session = request.getSession(false);
        User customer = (User) session.getAttribute("customer");
        String orderid = request.getParameter("orderid");
        String[] cartIds = request.getParameterValues("cartIds");
        String bankCode = request.getParameter("bankCode");
        int paymentId = 0;
        Order order = new Order();
        if (orderid != null && !orderid.isEmpty()) {
            try {
                order = orderDAO.getMyOrder(Integer.parseInt(orderid));
            } catch (Exception e) {
            }

        } else {

            int addressId = Integer.parseInt(request.getParameter("addressId"));
            paymentId = Integer.parseInt(request.getParameter("paymentId"));
            double totalcost = Double.parseDouble(request.getParameter("totalcost"));

            String[] productDetailIds = request.getParameterValues("cartDetailIds");
            String[] quantitys = request.getParameterValues("cartDetailQuantitys");
            String[] totalcosts = request.getParameterValues("cartDetailTotalcosts");
            order = new Order();
            order.setCustomer_id(customer.getId());
            order.setAddress_id(addressId);
            order.setPaymentMethod_id(paymentId);

            order.setTotalcost(totalcost);
            order.setStatus("Wait");

            int orderId = 0;
            try {
                orderId = orderDAO.createOrder(order);
            } catch (SQLException ex) {
                Logger.getLogger(AddToOrder.class.getName()).log(Level.SEVERE, null, ex);
            }
            order.setId(orderId);

            for (int i = 0; i < productDetailIds.length; i++) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder_id(orderId);
                orderDetail.setProductdetail_id(Integer.parseInt(productDetailIds[i]));
                orderDetail.setQuantity(Integer.parseInt(quantitys[i]));
                orderDetail.setPrice(Double.parseDouble(totalcosts[i]));

                orderDetailDAO.insertOrderDetail(orderDetail);
                ProductDetailDAO productDetailDAO = new ProductDetailDAO();
                ProductDetail productDetail = productDetailDAO.getProductDetail(Integer.parseInt(productDetailIds[i]));
                productDetail.setQuantity(productDetail.getQuantity() - Integer.parseInt(quantitys[i]));
                productDetailDAO.updateProductDetail(productDetail);
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductByID(productDetail.getProduct_id());
                product.setQuantity(product.getQuantity() - Integer.parseInt(quantitys[i]));
                productDAO.updateProduct(product);

            }
        }
        List<OrderSaleManager> orderSaleManagers = new OrderDAO().getFilteredOrders(null, null, null, null, null, null);
        // Thiết lập phân trang
        String pageStr="1";
        int page = 1; // Trang mặc định là 1
        int recordsPerPage = 25; // Số bản ghi trên mỗi trang (có thể thay đổi tùy vào yêu cầu)
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Xử lý lỗi chuyển đổi page
            }
        }
        int totalRecords = orderSaleManagers.size(); // Tổng số bản ghi
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage); // Tổng số trang

        // Tính chỉ mục bắt đầu và kết thúc của danh sách đơn hàng cho trang hiện tại
        int startIndex = (page - 1) * recordsPerPage;
        int endIndex = Math.min(startIndex + recordsPerPage, totalRecords);

        // Lấy danh sách đơn hàng cho trang hiện tại
        List<OrderSaleManager> ordersForPage = orderSaleManagers.subList(startIndex, endIndex);

        // Chuyển danh sách đơn hàng sang định dạng JSON
        JsonArray jsonArray = new JsonArray();
        for (OrderSaleManager orders : ordersForPage) {
            JsonObject jsonOrder = new JsonObject();
            jsonOrder.addProperty("customer", orders.getCustomer());
            jsonOrder.addProperty("id", orders.getId());
            jsonOrder.addProperty("totalcost", orders.getTotalcost());
            jsonOrder.addProperty("orderdate", orders.getOrderDate().toString());
            jsonOrder.addProperty("status", orders.getStatus());
            jsonOrder.addProperty("salename", orders.getSalename());

            jsonArray.add(jsonOrder);
        }

        // Tạo đối tượng JSON chứa thông tin về số trang và danh sách đơn hàng
        JsonObject jsonResult = new JsonObject();
        jsonResult.add("orders", jsonArray); // Danh sách đơn hàng cho trang hiện tại
        jsonResult.addProperty("totalPages", totalPages); // Tổng số trang

        OrderUpdateEndpoint.sendUpdate(jsonResult.toString());
        if (order.getPaymentMethod_id() == 1) {
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";

            String vnp_TxnRef = String.valueOf(order.getId());

            String vnp_IpAddr = Config.getIpAddress(request);

            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf((long) (order.getTotalcost() * 100)));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Order Furniture");
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = "vn";
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            String returnUrl = Config.vnp_ReturnUrl + "?sessionid=" + customer.getId();
            if (cartIds != null) {
                for (int i = 0; i < cartIds.length; i++) {
                    returnUrl += "&cartId=" + cartIds[i];
                }
            }
            vnp_Params.put("vnp_ReturnUrl", returnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(job));
        }
    }

    public static void main(String[] args) throws SQLException {
        Order order = new Order();
        order = new OrderDAO().getMyOrder(204);
        System.out.println(order.getId());
    }

}
