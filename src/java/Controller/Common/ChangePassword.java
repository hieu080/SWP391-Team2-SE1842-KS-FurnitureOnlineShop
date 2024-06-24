/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Common;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DUCHIEUPC.COM
 */
public class ChangePassword extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/ChangePassword.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        UserDAO userDAO = new UserDAO();
        User u = (User) session.getAttribute("customer");
        if (!oldpass.equals(u.getPassword())) {
            request.setAttribute("mess", "Mật khẩu cũ không đúng");
            request.getRequestDispatcher("Views/ChangePassword.jsp").forward(request, response);
        } else if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Mật khẩu mới không khớp");
            request.getRequestDispatcher("Views/ChangePassword.jsp").forward(request, response);
        } else if (newpass.equals(oldpass)) {
            request.setAttribute("mess", "Mật khẩu mới không được trùng với mật khẩu cũ");
            request.getRequestDispatcher("Views/ChangePassword.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            dao.changePass(String.valueOf(u.getId()), newpass);
            request.setAttribute("mess", "Thay đổi mật khẩu thành công");
            request.getRequestDispatcher("Views/ChangePassword.jsp").forward(request, response);
        }
    }

  

}