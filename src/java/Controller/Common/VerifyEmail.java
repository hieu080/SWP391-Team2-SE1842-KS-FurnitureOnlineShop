/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Common;

import DAL.UserDAO;
import DAL.VerifyAccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Email;

/**
 *
 * @author admin
 */
public class VerifyEmail extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet VerifyEmail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyEmail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        VerifyAccountDAO verifyDAO = new VerifyAccountDAO();
        if (verifyDAO.checkVerifyEmail(email) == false) {
            processRequest(request, response);
            request.setAttribute("showregister", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            dao.insertCustomer(email);
            processRequest(request, response);
            request.setAttribute("showlogin", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        if (dao.checkAccount(email) == false) {
            request.setAttribute("erroremail", "tai khoan email khong dung");
            processRequest(request, response);
            request.setAttribute("showemail", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        } else {
            Email sendEmail = new Email();
            sendEmail.sendResetEmail(email);
            request.setAttribute("sucessemail", "Email chính xác !Vui lòng check mail xác nhận");
            processRequest(request, response);
            request.setAttribute("showemail", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
