/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

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

/**
 *
 * @author admin
 */
public class MyOrderInformationServlet extends HttpServlet {

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
            out.println("<title>Servlet MyOrderInformationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyOrderInformationServlet at " + request.getContextPath() + "</h1>");
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
        ArrayList<Address> address = addressDAO.getAddressList();

        request.setAttribute("address", address);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("userList", userList);
        request.setAttribute("colorList", colorList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("productList", productList);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("order", order);

        request.getRequestDispatcher("Views/MyOrderInformation.jsp").forward(request, response);
    }
    
    public static void main(String[] args) {
        UserDAO user = new UserDAO();
        ArrayList<User> userList = user.getUserList();
        for (User user1 : userList) {
            System.out.println(user1.toString());
        }
        System.out.println(userList.toString());
//        AddressDAO addressDAO = new AddressDAO();
//        ArrayList<Address> addresses = addressDAO.getAddressList();
//        for (Address addresse : addresses) {
//            System.out.println(addresses.toString());
//        }
        
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

        // Xử lý hủy đơn hàng
        if (id != null) {
            int order_id;
            try {
                order_id = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                return;
            }

            // Ví dụ: cập nhật trạng thái đơn hàng trong cơ sở dữ liệu thành "Cancelled"
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.updateOrderStatus(order_id, "Cancled");
            request.getRequestDispatcher("Views/MyOrderInformation.jsp").forward(request, response);
        }

        // Chuyển hướng người dùng đến trang xác nhận hoặc trang đơn hàng
        response.sendRedirect("orderConfirmation.jsp");
    }

    // Giả sử bạn có phương thức để cập nhật trạng thái đơn hàng trong cơ sở dữ liệu


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