/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import Controller.Public.HomePage;
import DAL.AddressDAO;
import DAL.BrandDAO;
import DAL.CartItemDAO;
import DAL.CategoryDAO;
import DAL.CategoryOfPostDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDetailDAO;
import DAL.PageDAO;
import DAL.PaymentMethodDAO;
import DAL.PostDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import Helper.PaginationHelper;
import Models.Address;
import Models.Brand;
import Models.CartItemWithDetail;
import Models.Category;
import Models.CategoryOfPost;
import Models.Color;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.PaymentMethod;
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
public class CartContact extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BrandDAO brandDao = new BrandDAO();
        ArrayList<Brand> brandList = brandDao.getBrandList();
        request.setAttribute("brandList", brandList);

        RoomDAO roomDAO = new RoomDAO();
        ArrayList<Room> roomList = roomDAO.getRoomList();
        request.setAttribute("roomList", roomList);

        PageDAO pageDAO = new PageDAO();
        ArrayList<Page> pageList = pageDAO.getPageList();
        request.setAttribute("pageList", pageList);

        CategoryOfPostDAO categoryOfPostDAO = new CategoryOfPostDAO();
        List<CategoryOfPost> categoryOfPost = categoryOfPostDAO.getCategoryOfPostList();
        request.setAttribute("categoryOfPostList", categoryOfPost);

        PostDAO postDAO = new PostDAO();
        ArrayList<Post> postList = postDAO.getPostList();
        request.setAttribute("postList", postList);

        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();
        request.setAttribute("saleOffList", saleOffList);

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ArrayList<Feedback> feedbackList = feedbackDAO.getFeedbackList();
        request.setAttribute("feedbackList", feedbackList);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.getOrderDetailsList();
        request.setAttribute("orderDetailList", orderDetailList);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();
        request.setAttribute("colorList", colorList);
        
        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList= pddao.getAllProductDetails();
        request.setAttribute("productDetailList", productDetailList);
        
        request.setAttribute("colorList", colorList);

        
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession(false);
        User customer =(User) session.getAttribute("customer");
        AddressDAO addressDAO = new AddressDAO();
        List<Address> addresses= addressDAO.getAddressByCustomerId(customer.getId());
        request.setAttribute("addresslist", addresses);
        CartItemDAO cartItemDAO = new CartItemDAO();
        
        List<CartItemWithDetail> cartItemWithDetails = new ArrayList<>();
        try {
            cartItemWithDetails = cartItemDAO.getCartItemsDetailByStatus(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("listcartdetail", cartItemWithDetails);
        PaymentMethodDAO paymentMethodDAO= new PaymentMethodDAO();
        List<PaymentMethod> paymentMethods = null;
        try {
            paymentMethods = paymentMethodDAO.getAllPaymentMethods();
        } catch (SQLException ex) {
            Logger.getLogger(CartContact.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("paymentmethodList", paymentMethods);
        double sumtotalprice = 0;
        try {
            sumtotalprice = cartItemDAO.getTotalCost(customer.getId());
        } catch (SQLException ex) {
            Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("sumtotalprice", sumtotalprice);
        
        request.getRequestDispatcher("Views/CartContact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
