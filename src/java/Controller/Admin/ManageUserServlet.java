/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.AttachedImageDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import DAL.UserRoleDAO;
import DAL.VerifyAccountDAO;
import Helper.ComparatorHelper;
import Helper.FileUploadHelper;
import Helper.PaginationHelper;
import Models.AttachedImage;
import Models.Product;
import Models.ProductDetail;
import Models.User;
import Models.UserRole;
import Util.Email;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import org.apache.tomcat.util.digester.ArrayStack;

/**
 *
 * @author admin
 */
public class ManageUserServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/product";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private int tryParseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private double tryParseDouble(String value, double defaultValue) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    protected void UpdateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int editUserId = tryParseInt(request.getParameter("editUserId"), 0);

        int roleID = tryParseInt(request.getParameter("roleID"), 0);
        String statusUser = request.getParameter("statusUser");
        UserDAO userDAO = new UserDAO();
        userDAO.UpdateUser(roleID, statusUser, editUserId);
    }

    protected void SignUpUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = email;

        int roleID = tryParseInt(request.getParameter("roleID"), 0);
        String status = request.getParameter("status");
        UserDAO userDAO = new UserDAO();
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        if (userDAO.checkAccount(email)) {
            response.getWriter().print("Tài khoản đã tồn tại.");
            //request.setAttribute("mess", "Tài khoản đã tồn tại.");
        } else {
            Email sendEmail = new Email();
            sendEmail.sendSignUpEmail(email);
            User user = new User();
            user.setFullname(fullname);
            user.setGender(gender);
            user.setPhonenumber(phone);
            user.setAddress(address);
            user.setEmail(email);
            user.setPassword(password);
            user.setRole_id(roleID);
            user.setStatus(status);
            VerifyAccountDAO verifyAccountDAO = new VerifyAccountDAO();
            verifyAccountDAO.signUpUser(user);
            response.getWriter().print("success");
            //request.setAttribute("mess", "Success");

        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRole = userRoleDAO.getUserRoleList();
        request.setAttribute("userRole", userRole);
        request.getRequestDispatcher("Views/UserDetail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userID = tryParseInt(request.getParameter("userID"), 0);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByID(userID);
        request.setAttribute("user", user);
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
        String action = request.getParameter("action");
        switch (action) {
            case "editUser":
                UpdateUser(request, response);
                int userID = tryParseInt(request.getParameter("editUserId"), 0);
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserByID(userID);
                request.setAttribute("user", user);
                processRequest(request, response);
                break;
            case "addNewUser":
                SignUpUser(request, response);
                break;
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
