/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import DAL.OrderDAO;
import DAL.UserDAO;
import Models.User;
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
public class SaleDashboard extends HttpServlet {

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

        //lay danh sach cac sale
        List<User> saleList = udao.getSaleList();

        //lay cac tieu chi loc (ngay thang, status, sale)
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

        String status = request.getParameter("status");
        if (status == null) {
            status = "Done";
        }

        String sale = request.getParameter("sale");

        //set ten sale va status cua label trong chart
        String saleLabel = "(chung)";
        if ( sale != null && !sale.isEmpty()) {
            saleLabel = "của " + udao.getUserbyID(sale).getFullname() + " (#" + sale + ")" ;
        }
        String statusLabel = "thành công";
        if(!status.equals("Done") ){
            statusLabel = "bị huỷ";
        }
        
        //lay danh sach orderstats de ve chart
        List<Map<String, Object>> orderStats = odao.getOrderStats(startDate, endDate, sale, status);
        //lấy danh sách revenuestats để vẽ chart
        List<Map<String, Object>> revenueStats = odao.getRevenueStats(startDate, endDate, sale);
        
        request.setAttribute("statusLabel", statusLabel);
        request.setAttribute("saleLabel", saleLabel);
        request.setAttribute("orderStats", orderStats);
        request.setAttribute("revenueStats", revenueStats);
        request.setAttribute("saleList", saleList);
        request.getRequestDispatcher("Views/SaleDashboard.jsp").forward(request, response);
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
