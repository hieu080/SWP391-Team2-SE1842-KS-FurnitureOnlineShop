/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Public;

import DAL.CategoryOfPostDAO;
import DAL.PostDAO;
import Helper.PaginationHelper;
import Models.CategoryOfPost;
import Models.Post;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author DELL
 */
public class BlogListSearchedServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PostDAO pdao = new PostDAO();
        CategoryOfPostDAO cdao = new CategoryOfPostDAO();
        
        //list category
        List<CategoryOfPost> listCategory = cdao.getListCategoryofPost();
        request.setAttribute("listCategory", listCategory);

        //list new post
        List<Post> listNewPost = pdao.getNewPostList();
        request.setAttribute("listNewPost", listNewPost);
        
        //list post got by search
        String keyword = request.getParameter("keyword");
        List<Post> listsearch = pdao.getListPostbySearch(keyword);
        request.setAttribute("listsearch", listsearch);
        
        //phan trang
        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerPostList";
        String attribute = "listsearch";
        paginationHelper.Pagination(request, listsearch, context, itemsPerPage, attribute);
        
        request.getRequestDispatcher("Views/BlogListSearched.jsp").forward(request, response);
        
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}