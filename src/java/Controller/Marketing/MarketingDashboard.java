/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.FeedbackDAO;
import DAL.PostDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class MarketingDashboard extends HttpServlet {

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
        UserDAO udao = new UserDAO();
        PostDAO pdao = new PostDAO();
        ProductDAO prodao = new ProductDAO();
        FeedbackDAO fdao = new FeedbackDAO();

        String startDateStr = request.getParameter("start");
        String endDateStr = request.getParameter("end");
        java.sql.Date startDate;
        java.sql.Date endDate;
        if (startDateStr == null || startDateStr.isEmpty()) {
            startDate = Date.valueOf(LocalDate.now().minusDays(6));
            endDate = Date.valueOf(LocalDate.now());
        } else {
            startDate = Date.valueOf(startDateStr);
            endDate = Date.valueOf(endDateStr);
        }
        
        //lấy tổng khách, tổng post, tổng product, tổng feedback
        int postall = pdao.getPostCounts(Date.valueOf("2024-07-01"), Date.valueOf(LocalDate.now()));
        int customerall=udao.getCustomerCounts(Date.valueOf("2024-07-01"), Date.valueOf(LocalDate.now()));
        int productall=prodao.getProductCounts(Date.valueOf("2024-07-01"), Date.valueOf(LocalDate.now()));
        int feedbackall=fdao.getFeedbackCounts(Date.valueOf("2024-07-01"), Date.valueOf(LocalDate.now()));
        
        int customer=udao.getCustomerCounts(startDate, endDate);
        int post=pdao.getPostCounts(startDate, endDate);
        int product=prodao.getProductCounts(startDate, endDate);
        int feedback=fdao.getFeedbackCounts(startDate, endDate);
        //lấy danh sách số khách theo ngày
        List<Map<String, Object>> customerCounts = udao.getCustomerCountsByDate(startDate, endDate);
        
        //lấy danh sách sản phẩm bán chạy
        Map<String,Integer> topsell = prodao.getTopSellingProducts(startDate, endDate);
        
        //set các attribute để hiển thị
        request.setAttribute("topsell", topsell);
        request.setAttribute("product", product);
        request.setAttribute("productall", productall);
        request.setAttribute("feedback", feedback);
        request.setAttribute("feedbackall", feedbackall);
        request.setAttribute("post", post);
        request.setAttribute("postall", postall);
        request.setAttribute("customer", customer);
        request.setAttribute("customerall", customerall);
        request.setAttribute("customerCounts", customerCounts);
        request.getRequestDispatcher("Views/MktDashboard.jsp").forward(request, response);
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