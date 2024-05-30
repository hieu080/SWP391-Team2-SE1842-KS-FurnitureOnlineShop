/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class LogoutServlet extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidating session
        HttpSession session = request.getSession(false); // không tạo session mới nếu không tồn tại
        if (session != null) {
            session.invalidate(); // Hủy session hiện tại
        }

        // Redirect to login page or any other page after logout
        response.sendRedirect("HomePage"); // Chuyển hướng đến trang đăng nhập sau khi đăng xuất
    }
   

}
