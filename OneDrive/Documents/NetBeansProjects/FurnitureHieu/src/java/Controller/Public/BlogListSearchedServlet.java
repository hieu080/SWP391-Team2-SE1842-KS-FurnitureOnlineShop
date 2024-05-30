/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Public;

import DAl.CustomerDAO;
import DAl.MKTDAO;
import Models.Brand;
import Models.Category;
import Models.CategoryPost;
import Models.Page;
import Models.Post;
import Models.Room;
import Models.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class BlogListSearchedServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        MKTDAO mktdao= new MKTDAO();
        List<Slider> sliders = mktdao.getAllSlidersWith("show");
        request.setAttribute("listslider", sliders);
        
        ArrayList<Brand> brandList = customerDAO.getBrandList();
        request.setAttribute("brandList", brandList);
        
        ArrayList<Room> roomList = customerDAO.getRoomList();
        request.setAttribute("roomList", roomList);
        
        ArrayList<Page> pageList = customerDAO.getPageList();
        request.setAttribute("pageList", pageList);
        
        List<CategoryPost> categoryOfPost =  customerDAO.selectAllCategoryPosts();
        request.setAttribute("categoryOfPostList", categoryOfPost);
        
        
        List<Post> postList = customerDAO.getListPost();
        request.setAttribute("postList", postList);
        
         ArrayList<Category> categoryList = customerDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);
        
        //list category
        List<String> listCategory = dao.getListCategoryofPost();
        request.setAttribute("listCategory", listCategory);
        
        //list post
        List<Post> listPost = dao.getListPost();
        request.setAttribute("listPost", listPost);
        
        //list post got by search
        String keyword = request.getParameter("keyword");
        List<Post> listsearch = dao.getListPostbySearch(keyword);
        request.setAttribute("listsearch", listsearch);
        
        request.getRequestDispatcher("Views/blogListSearched.jsp").forward(request, response);
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
}
