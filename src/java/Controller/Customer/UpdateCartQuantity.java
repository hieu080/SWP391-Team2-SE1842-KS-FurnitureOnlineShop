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
public class UpdateCartQuantity extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
       
        String cartid = request.getParameter("cartid");
        String quantity= request.getParameter("quantity");
        String totalcost = request.getParameter("totalPrice");
        CartItemDAO cartItemDAO = new CartItemDAO();
        try {
            cartItemDAO.updateCartItemQuantity(Integer.parseInt(cartid), Integer.parseInt(quantity),Double.parseDouble(totalcost));
        } catch (SQLException ex) {
            Logger.getLogger(UpdateCartQuantity.class.getName()).log(Level.SEVERE, null, ex);
            
        }
//        response.getWriter().print(totalcost);
        response.sendRedirect("CartDetail");
        
    }
    public static void main(String[] args) throws SQLException {
        CartItemDAO cartItemDAO = new CartItemDAO();
        cartItemDAO.updateCartItemQuantity(2,4,3.2);
        

    }

   
}
