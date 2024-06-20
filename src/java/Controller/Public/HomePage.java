/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Controller.Customer.CartDetail;
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
import DAL.SliderDAO;
import Helper.PaginationHelper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Models.Brand;
import Models.CartItemWithDetail;
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
import Models.Slider;
import Models.User;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class HomePage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliders = sliderDAO.getAllSlidersWith("show");
        request.setAttribute("listslider", sliders);
        
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
        List<CategoryOfPost> categoryOfPost =  categoryOfPostDAO.getCategoryOfPostList();
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
        
        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList= pddao.getAllProductDetails();
        request.setAttribute("productDetailList", productDetailList);

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();
        request.setAttribute("colorList", colorList);

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();

        PaginationHelper<Product> paginationHelper = new PaginationHelper<>(productList, 12);

        int[] pagenumber = paginationHelper.getPageNumbers();
        request.setAttribute("pagenumber", pagenumber);

        String pageStr = request.getParameter("page");
        int page = 0;

        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr) - 1;
            } catch (NumberFormatException e) {
                page = 0; // default to first page if there's an error in parsing
            }
        }

        ArrayList<Product> paginatedProductList = new ArrayList<>(paginationHelper.getPage(page));

        request.setAttribute("productList", paginatedProductList);
        
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("customer");

            CartItemDAO cartItemDAO = new CartItemDAO();
            try {
                request.setAttribute("countcart", cartItemDAO.countCartItemsByCustomerId(user.getId()));
            } catch (SQLException ex) {
                Logger.getLogger(HomePage.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<CartItemWithDetail> cartItemWithDetails = new ArrayList<>();
            try {
                cartItemWithDetails = cartItemDAO.getCartItemsDetail(user.getId());
            } catch (SQLException ex) {
                Logger.getLogger(HomePage.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("listcartdetail", cartItemWithDetails);
            double sumtotalprice = 0;
            try {
                sumtotalprice = cartItemDAO.getTotalCostNoStatus(user.getId());
            } catch (SQLException ex) {
                Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
            }
             request.setAttribute("sumtotalprice", sumtotalprice);
        }
        
        request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

    }

}
