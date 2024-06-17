/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import Helper.ComparatorHelper;
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
        request.setAttribute("userList", userList);
        request.setAttribute("categoryList", categoryList);

        request.setAttribute("colorList", colorList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("productList", productList);

        request.getRequestDispatcher("Views/OrderList.jsp").forward(request, response);
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
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();
        request.setAttribute("userList", userList);

        HttpSession session = request.getSession();
        User customer = (User) session.getAttribute("customer");

        String clearfilter = request.getParameter("clearfilter");
        if ((clearfilter != null && !clearfilter.isEmpty())) {
            session.removeAttribute("orderList");
        }

        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderList");
        if (orderList == null) {
            orderList = orderDAO.OrderListOfSale(2);
        }

        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        if (sortby != null && !sortby.isEmpty()) {
            orderList = comparatorHelper.sortOrderList(orderList, sortby, userList);
            session.setAttribute("orderList", orderList);
        }
        
        int[] order_IDs = new int[orderList.size()];
        for (int i = 0; i < orderList.size(); i++) {
            order_IDs[i] = orderList.get(i).getId();
        }
        
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.MyOrderDetails(order_IDs);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("orderList", orderList);
        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerOrderList";
        String attribute = "orderList";
        paginationHelper.Pagination(request, orderList, context, itemsPerPage, attribute);
      
        processRequest(request, response);
        
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
        String search = request.getParameter("search");
        String[] statusIDStr = request.getParameterValues("status-filter");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        List<String> selectStatusList = statusIDStr != null ? Arrays.asList(statusIDStr) : null;
        HttpSession session = request.getSession();
        User customer = (User) session.getAttribute("customer");

        OrderDAO orderDAO = new OrderDAO();
        ArrayList<Order> orderList;
        if (search != null && !search.isEmpty()) {
            try {
                int orderId = Integer.parseInt(search);
                orderList = orderDAO.searchOrderById(search, 8);
                
            } catch (NumberFormatException e) {
                // If searchParam is not a number, search by user.fullname
                orderList = orderDAO.searchOrderByName(search, 8);
            }
        } else{
            orderList = orderDAO.filterOrderList(fromDate, toDate, statusIDStr, 8);
        }
        
         
        session.setAttribute("orderList", orderList);

        int[] order_IDs = new int[orderList.size()];

        for (int i = 0; i < orderList.size(); i++) {
            order_IDs[i] = orderList.get(i).getId();
        }
        ServletContext context = getServletContext();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.MyOrderDetails(order_IDs);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("orderList", orderList);
        request.setAttribute("selectStatusList", selectStatusList);
        processRequest(request, response);

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
