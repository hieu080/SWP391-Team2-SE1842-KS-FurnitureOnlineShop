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
import Models.Product;
import Models.ProductDetail;
import Models.User;
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
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDetailDAO prDetailDAO = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = prDetailDAO.getAllProductDetails();
        ProductDAO prDAO = new ProductDAO();
        ArrayList<Product> productList = prDAO.getProductList();

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        int[] historyFeedbackOrder = feedbackDAO.getHistory();

        request.setAttribute("userList", userList);
        request.setAttribute("categoryList", categoryList);

        request.setAttribute("colorList", colorList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("productList", productList);
        request.setAttribute("historyFeedbackOrder", historyFeedbackOrder);

        request.getRequestDispatcher("Views/OrderList.jsp").forward(request, response);
    }

    private ArrayList<Order> sortOrderList(HttpServletRequest request, ArrayList<Order> orderList) {
        String sortby = request.getParameter("sortby");
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        ComparatorHelper comparatorHelper = new ComparatorHelper();
        orderList = comparatorHelper.sortOrderList(orderList, sortby, userList);
        return orderList;
    }

    private ArrayList<Order> searchOrder(HttpServletRequest request, User customer) {
        String search = request.getParameter("search");
        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orderList = new ArrayList<>();
        try {
            int orderId = Integer.parseInt(search);
            orderList = orderDAO.searchOrderById(orderId, customer.getId());

        } catch (NumberFormatException e) {
            // If searchParam is not a number, search by user.fullname
            orderList = orderDAO.searchOrderByName(search, customer.getId());
        }
        return orderList;
    }

    private ArrayList<Order> filterOrder(HttpServletRequest request, User customer) {
        String[] statusIDStr = request.getParameterValues("status-filter");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orderList = orderDAO.filterOrderList(fromDate, toDate, statusIDStr, 2);
        return orderList;
    }

    private String listOrder(HttpServletRequest request, ArrayList<Order> orderList) {
        StringBuilder htmlResponse = new StringBuilder();

        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        ProductDetailDAO prDetailDAO = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = prDetailDAO.getAllProductDetails();

        ProductDAO prDAO = new ProductDAO();
        ArrayList<Product> productList = prDAO.getProductList();

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        int[] historyFeedbackOrder = feedbackDAO.getHistory();

        int[] order_IDs = new int[orderList.size()];
        for (int i = 0; i < orderList.size(); i++) {
            order_IDs[i] = orderList.get(i).getId();
        }

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.MyOrderDetails(order_IDs);

        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerOrderList";
        orderList = paginationHelper.PaginationList(request, orderList, context, itemsPerPage);

        if (orderList.isEmpty()) {
            htmlResponse.append("<div class=\"no-order\">\n")
                    .append("    <p>Không có đơn hàng nào.</p>\n")
                    .append("</div>\n");
        } else {
            for (Order order : orderList) {
                htmlResponse.append("<div class=\"order-card\" style=\"margin-bottom: 15px\">\n")
                        .append("    <h3>OrderID: #").append(order.getId()).append("</h3>\n")
                        .append("    <div style=\"display: flex; justify-content: flex-end\">\n")
                        .append("        <h6>Order Time: ").append(order.getOrderDate()).append("</h6>\n")
                        .append("    </div>\n")
                        .append("    <div class=\"table-responsive\">\n")
                        .append("        <table class=\"table\">\n")
                        .append("            <thead>\n")
                        .append("                <tr>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">CustomerName</th>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">Product</th>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">ProductName</th>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">Price</th>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">Quantity</th>\n")
                        .append("                    <th style=\"background-color: white; text-align: center\">Total</th>\n")
                        .append("                </tr>\n")
                        .append("            </thead>\n")
                        .append("            <tbody>\n");

                boolean firstProduct = true;
                int productCount = 0;

                for (User user : userList) {
                    if (order.getCustomer_id() == user.getId()) {
                        for (OrderDetail orderDetail : orderDetailList) {
                            if (orderDetail.getOrder_id() == order.getId()) {
                                for (ProductDetail productDetail : productDetailList) {
                                    if (productDetail.getId() == orderDetail.getProductdetail_id()) {
                                        for (Product product : productList) {
                                            if (product.getId() == productDetail.getProduct_id()) {
                                                htmlResponse.append("                <tr>\n");

                                                if (firstProduct) {
                                                    htmlResponse.append("                    <td style=\"text-align: center; background-color: white;\">")
                                                            .append(user.getFullname()).append("</td>\n")
                                                            .append("                    <td style=\"text-align: center; background-color: white;\"><img src=\"image/product/")
                                                            .append(product.getImage()).append("\" alt=\"Product\" style=\"width:100px\"></td>\n")
                                                            .append("                    <td style=\"text-align: center; background-color: white;\">")
                                                            .append(product.getName()).append("<br/>\n");

                                                    for (Color color : colorList) {
                                                        if (productDetail.getColor_id() == color.getId()) {
                                                            htmlResponse.append("                        <span class=\"small\">")
                                                                    .append(color.getColorname()).append("</span>\n");
                                                        }
                                                    }

                                                    for (Category category : categoryList) {
                                                        if (product.getCategory_id() == category.getId()) {
                                                            htmlResponse.append("                        <span class=\"small\">(Phân loại: ")
                                                                    .append(category.getCategory()).append(")</span>\n");
                                                        }
                                                    }

                                                    htmlResponse.append("                    </td>\n")
                                                            .append("                    <td style=\"text-align: center; background-color: white;\">")
                                                            .append(orderDetail.getPrice()).append("</td>\n")
                                                            .append("                    <td style=\"text-align: center; background-color: white;\">")
                                                            .append(orderDetail.getQuantity()).append("</td>\n")
                                                            .append("                    <td style=\"text-align: center; background-color: white;\">")
                                                            .append(order.getTotalcost()).append("</td>\n");

                                                    firstProduct = false;
                                                } else {
                                                    productCount++;
                                                }

                                                htmlResponse.append("                </tr>\n");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                if (productCount >= 1) {
                    htmlResponse.append("                <tr>\n")
                            .append("                    <td colspan=\"6\" style=\"text-decoration: none; color: black; background-color: white;\">\n")
                            .append("                        <a href=\"OrderDetailServlet?id=").append(order.getId()).append("\" style=\"text-decoration: none; color: black;\">")
                            .append("Số sản phẩm khác: ").append(productCount).append("</a>\n")
                            .append("                    </td>\n")
                            .append("                </tr>\n");
                }

                htmlResponse.append("                <tr>\n")
                        .append("                    <td colspan=\"6\" style=\"text-align: center; background-color: white;\">\n")
                        .append("                        <a href=\"OrderDetailServlet?id=").append(order.getId()).append("\" style=\"text-decoration: none; color: black;\">")
                        .append("Xem chi tiết đơn hàng</a>\n")
                        .append("                    </td>\n")
                        .append("                </tr>\n")
                        .append("            </tbody>\n")
                        .append("        </table>\n")
                        .append("        <div style=\"display: flex;justify-content: flex-end;\">\n")
                        .append("            <div></div>\n")
                        .append("            <div><b>Total: </b>").append(order.getTotalcost()).append("</div>\n")
                        .append("        </div>\n")
                        .append("        <div class=\"button-order\" style=\"display: flex; justify-content: flex-end; margin-top: 10px\">\n");

                String statusButton = "";
                switch (order.getStatus()) {
                    case "Order":
                        statusButton = "<button style=\"width: 80px; height: 30px\" class=\"btn btn-secondary\">Đã đặt hàng</button>";
                        break;
                    case "Cancled":
                        statusButton = "<button style=\"width: 80px; height: 30px\" class=\"btn btn-danger\">Đã hủy</button>";
                        break;
                    case "Confirmed":
                        statusButton = "<button style=\" height: 30px\" class=\"btn btn-info\">Đã xác nhận đơn hàng</button>";
                        break;
                    case "Done":
                        boolean hasFeedback = false;
                        for (int history : historyFeedbackOrder) {
                            if (order.getId() == history) {
                                hasFeedback = true;
                                break;
                            }
                        }
                        if (hasFeedback) {
                            statusButton = "<button class=\"btn btn-success\" style=\"height: 30px;\">Hoàn thành đơn hàng</button>";
                        } else {
                            statusButton = "<button class=\"btn btn-warning\" style=\"height: 30px;\">Hoàn thành đơn hàng</button>";
                        }
                        break;
                    default:
                        statusButton = "<button style=\"width: 80px; height: 30px\" class=\"btn btn-warning\">" + order.getStatus() + "</button>";
                        break;
                }

                htmlResponse.append(statusButton)
                        .append("        </div>\n")
                        .append("    </div>\n")
                        .append("</div>\n");
            }
        }
        return htmlResponse.toString();
    }

    private String pagePagination(HttpServletRequest request, ArrayList<Order> orderList) {
        ServletContext context = request.getServletContext();
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        String itemsPerPage = "itemsPerOrderList";
        int pageSize = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, itemsPerPage);

        PaginationHelper paginationHelper = new PaginationHelper(orderList, pageSize);
        int numberOfPage = paginationHelper.getTotalPages();
        StringBuilder pagePaginationHtml = new StringBuilder();

        for (int i = 1; i <= numberOfPage; i++) {
            pagePaginationHtml.append("<input type=\"radio\" name=\"page\" id=\"page")
                    .append(i)
                    .append("\" value=\"")
                    .append(i)
                    .append("\" style=\"display: none;\">")
                    .append("<label for=\"page")
                    .append(i)
                    .append("\" style=\"width: 25px; border: groove;\" class=\"page-node\" aria-label=\"Trang ")
                    .append(i)
                    .append("\" onclick=\"handlePageClick(")
                    .append(i)
                    .append(")\">")
                    .append(i)
                    .append("</label>");
        }
        pagePaginationHtml.append("<span class=\"page-node\">&hellip;</span>");

        return pagePaginationHtml.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        User customer = (User) session.getAttribute("customer");
        User customer = new User();
        customer.setId(2);

        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orderList = orderDAO.OrderListOfSale(customer.getId());

        session.setAttribute("orderList", orderList);

        String htmlResponse = listOrder(request, orderList);
        request.setAttribute("htmlResponse", htmlResponse);
        request.getRequestDispatcher("Views/OrderList.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
//        User customer = (User) session.getAttribute("customer");
        User customer = new User();
        customer.setId(2);

        ArrayList<Order> orderList = new ArrayList<>();
        if ("pagination".equals(action)) {
            orderList = (ArrayList<Order>) session.getAttribute("orderList");

            String htmlResponse = listOrder(request, orderList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);
        } else if ("search".equals(action)) {
            orderList = searchOrder(request, customer);

            String htmlResponse = listOrder(request, orderList);
            request.setAttribute("htmlResponse", htmlResponse);
            request.getRequestDispatcher("Views/OrderList.jsp").forward(request, response);
        } else if ("sort".equals(action)) {
            orderList = new OrderDAO().OrderListOfSale(customer.getId());
            orderList = sortOrderList(request, orderList);

            String htmlResponse = listOrder(request, orderList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);
        } else if ("filter".equals(action)) {
            orderList = filterOrder(request, customer);

            String htmlResponse = listOrder(request, orderList);
            String pagePagination = pagePagination(request, orderList);

            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse + "|" + pagePagination);
        }

    }

}
