/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.FeedbackDAO;
import Models.Feedback;
import com.oracle.wls.shaded.org.apache.xalan.lib.Redirect;
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
public class FeedBackList extends HttpServlet {

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
            out.println("<title>Servlet FeedBackList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedBackList at " + request.getContextPath() + "</h1>");
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
    private final  int PageSize = 6;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String index_str = request.getParameter("index") == null ? "" : request.getParameter("index");
        String status = request.getParameter("status") == null || request.getParameter("status").equals("all") ? "" : request.getParameter("status");
        request.setAttribute("status", status);
        String productname = request.getParameter("productname") == null ? "" : request.getParameter("productname");
        request.setAttribute("productname", productname);
        String rate_str = request.getParameter("rate");
        int rate;
        try {
            rate = Integer.parseInt(rate_str);
        } catch (Exception e) {
            rate = 0;
        }
        request.setAttribute("rate", rate);
        int index;
        try {
            index = Integer.parseInt(index_str);
        } catch (Exception ex) {
            index = 1;
        }
        String customername = request.getParameter("customername") == (null) ? "" : request.getParameter("customername");
        request.setAttribute("customername", customername);
        String description = request.getParameter("description") == (null) ? "" : request.getParameter("description");
        request.setAttribute("description", description);
        FeedbackDAO fd = new FeedbackDAO();
        List<Feedback> list = fd.searchFeedbacks(rate, status, customername, productname, description, (index-1)*PageSize, PageSize);
        int total = fd.countFeedbacks(rate, status, customername, productname, description);
        int number_page = (int) Math.ceil((double) total / PageSize);
        if (index > number_page) {
            index = number_page;
        }
        if (index < 0) {
            index = 1;
        }
        request.setAttribute("index", index);
       
        request.setAttribute("numberpage", number_page);
        request.setAttribute("fl", list);
        PrintWriter out = response.getWriter();
        out.print(list.size());
        out.print(fd.s);
        out.print(number_page);
        out.print("sang:  "+index+":");
        out.print(total);
        request.getRequestDispatcher("./Views/FeedBacksList.jsp").forward(request, response);
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
