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
import java.io.IOException;
import java.io.PrintWriter;
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
        request.getRequestDispatcher("Views/register.jsp").forward(request, response);
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
        CustomerDAO dao = new CustomerDAO();
        if (dao.checkAccount(email) == true) {
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
                dao.insertVerifyCustomer(fullname, gender, phone, address, email, password);
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
