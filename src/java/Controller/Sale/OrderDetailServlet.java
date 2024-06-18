/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.AddressDAO;
import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import Models.Address;
import Models.Category;
import Models.Color;
import Models.Order;
import Models.OrderDetail;
import Models.Product;
import Models.ProductDetail;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int order_id;
        try {
            order_id = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getMyOrder(order_id);
        int[] order_IDs = new int[1];
        order_IDs[0] = order_id;

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.MyOrderDetails(order_IDs);

        ProductDetailDAO prDetailDAO = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = prDetailDAO.getAllProductDetails();
        ProductDAO prDAO = new ProductDAO();
        ArrayList<Product> productList = prDAO.getProductList();

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();

        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();

        AddressDAO addressDAO = new AddressDAO();
        List<Address> address = addressDAO.getAllAddresses();

        request.setAttribute("address", address);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("userList", userList);
        request.setAttribute("colorList", colorList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("productList", productList);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("order", order);

        request.getRequestDispatcher("Views/OrderDetail.jsp").forward(request, response);
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
        String id = request.getParameter("order_id");
        String action = request.getParameter("action");

        // Xử lý hành động dựa trên action
        if (id != null && action != null) {
            int order_id;
            try {
                order_id = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                return;
            }

            if (action.equals("cancel")) {
                // Xử lý hủy đơn hàng
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.updateOrderStatus(order_id, "Cancelled"); // Cập nhật trạng thái đơn hàng thành "Cancelled"

                // Chuyển hướng người dùng đến trang thông tin đơn hàng sau khi hủy
                response.sendRedirect("Views/MyOrderInformation.jsp");
            } else if (action.equals("confirm")) {
                // Xử lý xác nhận đơn hàng (ví dụ)
                OrderDAO orderDAO = new OrderDAO();
                orderDAO.updateOrderStatus(order_id, "Confirmed"); // Ví dụ: cập nhật trạng thái đơn hàng thành "Confirmed"

                // Chuyển hướng người dùng đến trang xác nhận
                response.sendRedirect("orderConfirmation.jsp");
            } else {
                // Xử lý trường hợp action không hợp lệ
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } else {
            // Xử lý trường hợp thiếu thông tin
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
