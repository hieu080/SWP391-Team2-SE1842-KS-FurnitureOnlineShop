/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Customer;

import DAL.CartItemDAO;
import Models.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
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
         HttpSession session = request.getSession(false);
        User customer = (User) session.getAttribute("customer");
       double sumtotalprice = 0;
        try {
            sumtotalprice = cartItemDAO.getTotalCost(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }

        Integer countCartItem = null;
        try {
            countCartItem = cartItemDAO.countCartItemsByCustomerId(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        int countCartItemSelected = 0;
        try {
            countCartItemSelected = cartItemDAO.countCartItemsBySelectedCustomerId(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("countcartitemselected", countCartItemSelected);
        jsonObject.addProperty("countcartitem", countCartItem);
        jsonObject.addProperty("sumtotalprice", formatCurrency(sumtotalprice));
        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    public String formatCurrency(double number) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator(',');
        symbols.setMonetaryDecimalSeparator('.');
        DecimalFormat decimalFormat = new DecimalFormat("#,##0", symbols);
        return decimalFormat.format(number) + "₫";
    }
}
