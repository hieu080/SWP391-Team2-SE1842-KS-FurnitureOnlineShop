/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Marketing;

import DAL.CategoryOfPostDAO;
import DAL.PostDAO;
import DAL.UserDAO;
import Models.CategoryOfPost;
import Models.Post;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author DELL
 */
public class PostsList extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryOfPostDAO cdao = new CategoryOfPostDAO();
        PostDAO pdao = new PostDAO();
        UserDAO udao = new UserDAO();
        
        //lay ra list catecory, list user la mkt(de so sanh voi id cua post)
        List<CategoryOfPost> listCategory = cdao.getListCategoryofPost();
        request.setAttribute("listCategory", listCategory);
        List<User> listMkt = udao.getMarketerList();
        request.setAttribute("listMkt", listMkt);
        
        //lay ra list status
        List<String> listStatus = pdao.getListStatus();
        request.setAttribute("listStatus",listStatus);
        
        //get list post theo filter
        String category = request.getParameter("category");
        String author = request.getParameter("author");
        String status = request.getParameter("status");
        List<Post> listPost = pdao.getPostListbyFilter(category,author,status);
        request.setAttribute("listPost", listPost);
        request.getRequestDispatcher("Views/PostsList.jsp").forward(request, response);
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
        String newstatus = request.getParameter("newstatus");
        String id = request.getParameter("id");
        PostDAO pdao = new PostDAO();
        pdao.updateStatus(newstatus, id);
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
