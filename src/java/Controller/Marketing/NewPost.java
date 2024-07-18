/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.CategoryOfPostDAO;
import DAL.PostDAO;
import DAL.UserDAO;
import Helper.FileUploadHelper;
import Models.CategoryOfPost;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)

public class NewPost extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/post";

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
        CategoryOfPostDAO categoryOfPostDAO = new CategoryOfPostDAO();
        PostDAO pdao = new PostDAO();
        UserDAO udao = new UserDAO();
        //list category
        List<CategoryOfPost> listCategory = categoryOfPostDAO.getListCategoryofPost();
        request.setAttribute("listCategory", listCategory);

        //lay ra list status
        List<String> listStatus = pdao.getListStatus();
        request.setAttribute("listStatus", listStatus);

        request.getRequestDispatcher("Views/NewPost.jsp").forward(request, response);
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
        processRequest(request, response);
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
        PostDAO pdao = new PostDAO();
        //lay file anh
        FileUploadHelper help = new FileUploadHelper();
        String filename = null; // Gán giá trị mặc định là null

        Part part = request.getPart("thumbnail");
        if (part != null && part.getSize() > 0) { // Kiểm tra part có tồn tại và có kích thước > 0
            filename = help.uploadFileAndReturnFileName(request, response, "thumbnail", UPLOAD_DIRECTORY);
        }

        //lay cac thong tin khac
        int category = Integer.parseInt(request.getParameter("category"));
        String title = request.getParameter("title");
        String subtitle = request.getParameter("subtitle");
        String status = request.getParameter("status");
        String content = request.getParameter("content");
       
        //lay ra tac gia bang sesstion
        HttpSession session = request.getSession();
        User author = (User) session.getAttribute("customer");
        //insert new post vao database
        boolean isSuccess = pdao.createPost(author.getId(),category, filename,title, subtitle, status, content);
        if (isSuccess) {
            request.setAttribute("result", "success");

        } else {
            request.setAttribute("result", "failure");
        }

        processRequest(request, response);
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
