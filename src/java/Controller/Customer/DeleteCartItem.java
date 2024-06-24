/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Customer;

import DAL.CartItemDAO;
import Models.User;
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
public class DeleteCartItem extends HttpServlet {
   
   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        User customer= (User) session.getAttribute("customer");
        
         CartItemDAO cartItemDAO = new CartItemDAO();
        try {
            cartItemDAO.deleteAllCartItem(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("CartDetail");
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String cartid =request.getParameter("cartid");
        CartItemDAO cartItemDAO = new CartItemDAO();
        try {
            cartItemDAO.deleteCartItem(Integer.parseInt(cartid));
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCartItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("CartDetail");
    }

   
}
