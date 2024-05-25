/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.CustomerDAO;
import Models.Brand;
import Models.Category;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Product;
import Models.Room;
import Models.Sale;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HELLO
 */
public class ProductServlet extends HttpServlet {

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
        CustomerDAO customerDAO = new CustomerDAO();
        ArrayList<Brand> brandList = customerDAO.getBrandList();
        request.setAttribute("brandList", brandList);
        ArrayList<Room> roomList = customerDAO.getRoomList();
        request.setAttribute("roomList", roomList);
        ArrayList<Page> pageList = customerDAO.getPageList();
        request.setAttribute("pageList", pageList);
        ArrayList<Sale> saleList = customerDAO.getSaleList();
        request.setAttribute("saleList", saleList);
        ArrayList<Feedback> feedbackList = customerDAO.getFeedbackList();
        request.setAttribute("feedbackList", feedbackList);
        ArrayList<OrderDetail> orderDetailList = customerDAO.getOrderDetailList();
        request.setAttribute("orderDetailList", orderDetailList);
        ArrayList<Category> categoryList = customerDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("Views/ProductList.jsp").forward(request, response);
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
        CustomerDAO customerDAO = new CustomerDAO();
        ArrayList<Product> productList = customerDAO.getProductList();
        request.setAttribute("productList", productList);
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
        CustomerDAO customerDAO = new CustomerDAO();
        ArrayList<Product> productList = customerDAO.searchProductByName(search);
        request.setAttribute("productList", productList);
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
