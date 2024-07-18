/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Customer;

import Controller.Public.HomePage;
import DAL.BrandDAO;
import DAL.CartItemDAO;
import DAL.CategoryDAO;
import DAL.CategoryOfPostDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDetailDAO;
import DAL.PageDAO;
import DAL.PostDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import Models.Brand;
import Models.Category;
import Models.CategoryOfPost;
import Models.Color;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Post;
import Models.Product;
import Models.ProductDetail;
import Models.Room;
import Models.SaleOff;
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
public class MoreProduct extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        String brand = request.getParameter("brand");
        String category= request.getParameter("category");
         String brandname = request.getParameter("brandname");
        String categoryname= request.getParameter("categoryname");
        int brandi=0;
        int categoryi=0;
        try {
            brandi=Integer.parseInt(brand.trim());
            
        } catch (Exception e) {
        }
        try {
            categoryi=Integer.parseInt(category.trim());
        } catch (Exception e) {
        }
        ProductDAO productDAO= new ProductDAO();
         List<Product> products= new ArrayList<>();
        try {
            
            products= productDAO.getByBrandOrCategoryId(brandi,categoryi);
        } catch (SQLException ex) {
            Logger.getLogger(MoreProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session= request.getSession(false);
        session.setAttribute("moreproduct", products);
        session.setAttribute("brand", brandname);
        session.setAttribute("category", categoryname);
        response.sendRedirect("CartDetail");
    
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    public static void main(String[] args) {
        ProductDAO productDAO= new ProductDAO();
         List<Product> products= new ArrayList<>();
        try {
            products= productDAO.getByBrandOrCategoryId(0, 2);
        } catch (SQLException ex) {
            Logger.getLogger(MoreProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (Product product : products) {
            System.out.println(product.getName());
        }
    }
}
