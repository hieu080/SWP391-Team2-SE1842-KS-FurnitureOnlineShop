/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Common;

import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.CategoryOfPostDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDetailDAO;
import DAL.PageDAO;
import DAL.PostDAO;
import DAL.ProductDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import DAL.SliderDAO;
import DAL.UserDAO;
import Helper.PaginationHelper;
import util.Email;
import Models.Brand;
import Models.Category;
import Models.CategoryOfPost;
import Models.Color;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Post;
import Models.Product;
import Models.Room;
import Models.SaleOff;
import Models.Slider;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class VerifyEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("productList", productList);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        if (userDAO.checkVerifyEmail(email) == false) {
            processRequest(request, response);
            request.setAttribute("showregister", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
        } else {
            userDAO.insertCustomer(email);
            processRequest(request, response);
            request.setAttribute("showlogin", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO userDAO = new UserDAO();
        if (userDAO.checkAccount(email) == false) {
            request.setAttribute("erroremail", "tai khoan email khong dung");
            processRequest(request, response);
            request.setAttribute("showemail", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        } else {
            Email sendEmail = new Email();
            sendEmail.sendResetEmail(email);
            request.setAttribute("sucessemail", "Email chính xác !Vui lòng check mail xác nhận");
            processRequest(request, response);
            request.setAttribute("showemail", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);

        }
    }

}
