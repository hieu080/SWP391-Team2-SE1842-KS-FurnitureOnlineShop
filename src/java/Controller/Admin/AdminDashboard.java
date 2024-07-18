/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.FeedbackDAO;
import DAL.OrderDAO;
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
public class AdminDashboard extends HttpServlet {

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
        OrderDAO odao = new OrderDAO();
        FeedbackDAO fdao = new FeedbackDAO();

        //lay ngay thang
        String startDateStr = request.getParameter("start");
        String endDateStr = request.getParameter("end");
        java.sql.Date startDate;
        java.sql.Date endDate;
        if (startDateStr == null || startDateStr.isEmpty() || endDateStr == null || endDateStr.isEmpty()) {
            startDate = Date.valueOf(LocalDate.now().minusDays(6));
            endDate = Date.valueOf(LocalDate.now());
        } else {
            startDate = Date.valueOf(startDateStr);
            endDate = Date.valueOf(endDateStr);
        }

        //lay so luong khach dang ki va mua hang
        int registerCounts = udao.newRegisteredCounts(startDate, endDate);
        int boughtCounts = udao.newBoughtCounts(startDate, endDate);

        //lay thong ke doanh thu theo product category
        Map<String, Double> revenueMap = odao.getRevenueByCategory(startDate, endDate);

        //lay thong ke so don hang theo tung status
        Map<String, Integer> statusCounts = odao.getOrderCountByStatus(startDate, endDate);

        //lấy thống kê sao trung bình của feedback theo product category
        Map<String, Double> starMap = fdao.getAvgStarByCategory(startDate, endDate);
        double avgall = fdao.avgStarOfAllFeedbacks(startDate, endDate);
        if (avgall != 0) {
            starMap.put("Tất cả", avgall);
        }
        
        //lấy thống kê số lượng đơn hàng thành công và tổng đơn theo từng ngày
        List<Map<String, Object>> orderCounts = odao.getSuccessAndAllOrderCounts(startDate, endDate);

        //set cac attribute
        request.setAttribute("orderCounts", orderCounts);
        request.setAttribute("starMap", starMap);
        request.setAttribute("revenueMap", revenueMap);
        request.setAttribute("statusCounts", statusCounts);
        request.setAttribute("registerCounts", registerCounts);
        request.setAttribute("boughtCounts", boughtCounts);
        request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
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
