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
import java.util.ArrayList;
import java.util.List;
import util.Email;

/**
 *
 * @author admin
 */
public class RegisterServlet extends HttpServlet {

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePass = request.getParameter("pass");
        processRequest(request, response);
        UserDAO userDAO = new UserDAO();
        if (userDAO.checkAccount(email) == true) {
            request.setAttribute("error", "Tài khoản đã tồn tại.");
            request.setAttribute("showregister", "block");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
        } else {
            if (!password.equals(rePass)) {
                request.setAttribute("error", "Mật khẩu không trùng khớp.");
                request.setAttribute("showregister", "block");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
//                register.jsp
            } else {

                Email sendEmail = new Email();
                sendEmail.sendSignUpEmail(email);
                userDAO.insertVerifyCustomer(fullname, gender, phone, address, email, password);
                request.setAttribute("success", "Đã gửi email. Vui lòng kiểm tra tài khoản email của bạn! ");
                request.setAttribute("showregister", "block");
                request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
