/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author DELL
 */
public class CustomersList extends HttpServlet {

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
        //lay danh sach status de filter
        List<String> listStatus = udao.getListStatus();
        request.setAttribute("listStatus", listStatus);

        //lay danh sach khach hang
        List<User> listCus = null;
        String status = request.getParameter("status");
        if (status != null) {
            if (!status.equals("All")) {
                listCus = udao.getCustomerListbyStatus(status);
            }else{
                listCus = udao.getCustomerList();
            }
        } else {
            listCus = udao.getCustomerList();
        }
        request.setAttribute("listCus", listCus);

        request.getRequestDispatcher("Views/CustomersList.jsp").forward(request, response);
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
        UserDAO udao = new UserDAO();
        //lay ra cac thong tin da nhap de tao tai khoan
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String add = request.getParameter("address");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        if (udao.createAcc(fullname, gender, phone, add, email, pass)) {
            request.setAttribute("msg", "Tạo thành công");
        } else {
            request.setAttribute("msg", "Tạo thất bại");
        }

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
