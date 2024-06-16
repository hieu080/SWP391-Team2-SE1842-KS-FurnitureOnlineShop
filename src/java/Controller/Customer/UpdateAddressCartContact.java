/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Customer;

import DAL.AddressDAO;
import DAL.CartItemDAO;
import DAL.PaymentMethodDAO;
import Models.Address;
import Models.CartItemWithDetail;
import Models.PaymentMethod;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class UpdateAddressCartContact extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException {
        HttpSession session= request.getSession(false);
        User customer =(User) session.getAttribute("customer");
        CartItemDAO cartItemDAO = new CartItemDAO();
         List<CartItemWithDetail> cartItemWithDetails = new ArrayList<>();
        try {
            cartItemWithDetails = cartItemDAO.getCartItemsDetailByStatus(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("listcartdetail", cartItemWithDetails);
       
        PaymentMethodDAO paymentMethodDAO= new PaymentMethodDAO();
        List<PaymentMethod> paymentMethods= paymentMethodDAO.getAllPaymentMethods();
        request.setAttribute("paymentmethodList", paymentMethods);
        
        double sumtotalprice = 0;
        try {
            sumtotalprice = cartItemDAO.getTotalCost();
        } catch (SQLException ex) {
            Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("sumtotalprice", sumtotalprice);
        AddressDAO addressDAO = new AddressDAO();
        List<Address> addresses= addressDAO.getAddressByCustomerId(customer.getId());
        request.setAttribute("addresslist", addresses);
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session= request.getSession(false);
        User customer =(User) session.getAttribute("customer");
        int id =Integer.parseInt(request.getParameter("selectedAddressId"));
        AddressDAO addressDAO = new AddressDAO();
        Address address= addressDAO.getAddressById(id,customer.getId() );
        request.setAttribute("addressupdate", address);
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateAddressCartContact.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("Views/CartContact.jsp").forward(request, response);
    }
   
   

}
