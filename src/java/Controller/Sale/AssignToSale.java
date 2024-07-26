/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import Helper.ComparatorHelper;
import Helper.ConfigReaderHelper;
import Helper.PaginationHelper;
import Models.Category;
import Models.Color;
import Models.Order;
import Models.OrderDetail;
import Models.OrderSaleManager;
import Models.Product;
import Models.ProductDetail;
import Models.User;
import com.google.gson.Gson;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import com.google.gson.*;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

/**
 *
 * @author admin
 */
public class AssignToSale extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         request.getRequestDispatcher("Views/SaleManagerAssignToSale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        OrderDAO orderDAO = new OrderDAO();
        List<OrderSaleManager> orderSaleManagers = new ArrayList<>();
        String salename = request.getParameter("sale");
        String searchValue = request.getParameter("search");
        String sortBy = request.getParameter("sortby");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String[] statusFilters = request.getParameterValues("status-filter");
        String pageStr = request.getParameter("page");

        orderSaleManagers = orderDAO.getFilteredOrders(salename, searchValue, sortBy, fromDate, toDate, statusFilters);

        // Thiết lập phân trang
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
        for (OrderSaleManager order : ordersForPage) {
            JsonObject jsonOrder = new JsonObject();
            jsonOrder.addProperty("customer", order.getCustomer());
            jsonOrder.addProperty("id", order.getId());
            jsonOrder.addProperty("totalcost", formatCurrency(order.getTotalcost()));
            jsonOrder.addProperty("orderdate", order.getOrderDate().toString());
            jsonOrder.addProperty("status", order.getStatus());
            jsonOrder.addProperty("salename", order.getSalename());

            jsonArray.add(jsonOrder);
        }

        // Tạo đối tượng JSON chứa thông tin về số trang và danh sách đơn hàng
        JsonObject jsonResult = new JsonObject();
        jsonResult.add("orders", jsonArray); // Danh sách đơn hàng cho trang hiện tại
        jsonResult.addProperty("totalPages", totalPages); // Tổng số trang

        // Gửi kết quả về client dưới dạng JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult.toString());

    }
   
    public String formatCurrency(double number) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator(',');
        symbols.setMonetaryDecimalSeparator('.');
        DecimalFormat decimalFormat = new DecimalFormat("#,##0", symbols);
        return decimalFormat.format(number) + "₫";
    }


}
