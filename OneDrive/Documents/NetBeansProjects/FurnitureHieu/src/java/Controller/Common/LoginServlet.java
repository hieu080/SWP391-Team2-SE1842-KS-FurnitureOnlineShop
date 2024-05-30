/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAl.CustomerDAO;
import DAl.MKTDAO;
import Models.Brand;
import Models.Category;
import Models.CategoryPost;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Post;
import Models.Product;
import Models.Room;
import Models.SaleOff;
import Models.Slider;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO customerDAO = new CustomerDAO();
        MKTDAO mktdao = new MKTDAO();
        List<Slider> sliders = mktdao.getAllSlidersWith("show");
        request.setAttribute("listslider", sliders);

        ArrayList<Brand> brandList = customerDAO.getBrandList();
        request.setAttribute("brandList", brandList);

        ArrayList<Room> roomList = customerDAO.getRoomList();
        request.setAttribute("roomList", roomList);

        ArrayList<Page> pageList = customerDAO.getPageList();
        request.setAttribute("pageList", pageList);

        List<CategoryPost> categoryOfPost = customerDAO.selectAllCategoryPosts();
        request.setAttribute("categoryOfPostList", categoryOfPost);

        List<Post> postList = customerDAO.getListPost();
        request.setAttribute("postList", postList);

        ArrayList<SaleOff> saleList = customerDAO.getSaleList();
        request.setAttribute("saleList", saleList);

        ArrayList<Feedback> feedbackList = customerDAO.getFeedbackList();
        request.setAttribute("feedbackList", feedbackList);

        ArrayList<OrderDetail> orderDetailList = customerDAO.getOrderDetailList();
        request.setAttribute("orderDetailList", orderDetailList);

        ArrayList<Category> categoryList = customerDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);

        ArrayList<Product> productList = customerDAO.getProductListWithLimit();
        request.setAttribute("productList", productList);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        CustomerDAO dao = new CustomerDAO();
        User customer = dao.login(email, password);
        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);

            request.setAttribute("ok", "Dang nhap thanh cong");

            response.sendRedirect("HomePage");
        } else {
            processRequest(request, response);
            request.setAttribute("showlogin", "block");
            request.setAttribute("errorlogin", "Tài khoản hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("Views/HomePage.jsp").forward(request, response);
        }

    }

    public static void main(String[] args) {

        String email = "namnthe172795@fpt.edu.vn";
        String password = "Trang12102003@";
        CustomerDAO dao = new CustomerDAO();
        User customer = dao.login(email, password);

        if (customer != null) {
            System.out.println(customer.getId());
        } else {
            System.out.println("Login failed: Invalid email or password.");
        }

    }

}
