/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Customer;

import DAL.CartItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class UpdateCartItemStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        CartItemDAO cartItemDAO = new CartItemDAO();
        try {
           cartItemDAO.updateCartItemStatus(status);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCartItemStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session= request.getSession(false);
        session.setAttribute("statusallcart",status );
        response.sendRedirect("CartDetail");
    }
   
    

    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       int cartid = Integer.parseInt(request.getParameter("cartid"));
       String status = request.getParameter("status");
        CartItemDAO cartItemDAO = new CartItemDAO();
        try {
            cartItemDAO.updateCartItemStatus(cartid, status);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCartItemStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("CartDetail");
    }

    
}
