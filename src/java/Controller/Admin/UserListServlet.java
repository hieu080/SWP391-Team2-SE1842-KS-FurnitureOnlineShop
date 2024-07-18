/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.OrderDAO;
import DAL.UserDAO;
import DAL.UserRoleDAO;
import Helper.ComparatorHelper;
import Helper.ConfigReaderHelper;
import Helper.PaginationHelper;
import Models.Order;
import Models.User;
import Models.UserRole;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author admin
 */
public class UserListServlet extends HttpServlet {

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
        /* TODO output your page here. You may use following sample code. */
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();
        request.setAttribute("userList", userList);

        request.getRequestDispatcher("Views/UserList.jsp").forward(request, response);
    }

    private ArrayList<User> searchUser(HttpServletRequest request) {
        String search = request.getParameter("search");
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = new ArrayList<>();
        userList = userDAO.searchUserList(search);
        return userList;
    }

    private ArrayList<User> sortUserList(HttpServletRequest request) {
        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRoleList = userRoleDAO.getUserRoleList();

        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        userList = comparatorHelper.sortUserList(userList, sortby, userRoleList);
        return userList;
    }

    private ArrayList<User> filterUser(HttpServletRequest request) {
        String[] gender = request.getParameterValues("gender-filter");
        String[] role_id = request.getParameterValues("role_id-filter");
        String[] status = request.getParameterValues("status-filter");

        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();

        userList = userDAO.filterUserList(gender, role_id, status);
        return userList;
    }

    private String pagePagination(HttpServletRequest request, ArrayList<User> userList) {
        ServletContext context = request.getServletContext();
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        String itemsPerPage = "itemsPerCustomerListPage";
        int pageSize = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, itemsPerPage);

        PaginationHelper paginationHelper = new PaginationHelper(userList, pageSize);
        int numberOfPage = paginationHelper.getTotalPages();
        StringBuilder pagePaginationHtml = new StringBuilder();

        for (int i = 1; i <= numberOfPage; i++) {
            pagePaginationHtml.append("<input type=\"radio\" name=\"page\" id=\"page")
                    .append(i)
                    .append("\" value=\"")
                    .append(i)
                    .append("\" style=\"display: none;\">")
                    .append("<label for=\"page")
                    .append(i)
                    .append("\" style=\"width: 25px; border: groove;\" class=\"page-node\" aria-label=\"Trang ")
                    .append(i)
                    .append("\" onclick=\"handlePageClick(")
                    .append(i)
                    .append(")\">")
                    .append(i)
                    .append("</label>");
        }
        pagePaginationHtml.append("<span class=\"page-node\">&hellip;</span>");

        return pagePaginationHtml.toString();
    }

    private String listUser(HttpServletRequest request, ArrayList<User> userList) {
        StringBuilder htmlResponse = new StringBuilder();
        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRoleList = userRoleDAO.getUserRoleList();

        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerCustomerListPage";
        userList = paginationHelper.PaginationList(request, userList, context, itemsPerPage);

        for (User user : userList) {
            htmlResponse.append("<tr>")
                    .append("<td><div><p class=\"text-sm\">")
                    .append(user.getId())
                    .append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">")
                    .append(user.getFullname())
                    .append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">")
                    .append(user.getGender())
                    .append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">")
                    .append(user.getEmail())
                    .append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">")
                    .append(user.getPhonenumber())
                    .append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">");

            // Append role names
            for (UserRole userRole : userRoleList) {
                if (user.getRole_id() == userRole.getId()) {
                    htmlResponse.append(userRole.getRolename());
                }
            }

            htmlResponse.append("</p></div></td>")
                    .append("<td><div class=\"text-sm\"><p class=\"text-sm\">")
                    .append(user.getStatus())
                    .append("</p></div></td>")
                    .append("<td class=\"actions\"><p>")
                    .append("<a href=\"ManageUserServlet?userID=")
                    .append(user.getId())
                    .append("\" title=\"View\"><i class=\"fas fa-eye\"></i></a>")
                    .append("</p></td>")
                    .append("</tr>");
        }
        return htmlResponse.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String action = request.getParameter("action");
//        if ("logout".equals(action)) {
//            HttpSession session = request.getSession(false);
//            if (session != null) {
//                session.invalidate();
//            }
//            response.setContentType("text/plain");
//            response.setCharacterEncoding("UTF-8");
//            response.getWriter().write("Session đã bị xóa");
//            return;
//        }
//        HttpSession session = request.getSession();
//        String clearfilter = request.getParameter("clearfilter");
//        if ((clearfilter != null && !clearfilter.isEmpty())) {
//            session.removeAttribute("userList");
//        }
//
//        UserRoleDAO userRoleDAO = new UserRoleDAO();
//        ArrayList<UserRole> userRole = userRoleDAO.getUserRoleList();
//        request.setAttribute("userRole", userRole);
//
//        ArrayList<User> userList = (ArrayList<User>) session.getAttribute("userList");
//
//        if (userList == null) {
//            UserDAO userDAO = new UserDAO();
//            userList = userDAO.getUserList();
//        }
//
//        String sortby = request.getParameter("sortby");
//        ComparatorHelper comparatorHelper = new ComparatorHelper();
//        if (sortby != null && !sortby.isEmpty()) {
//            userList = comparatorHelper.sortUserList(userList, sortby, userRole);
//            session.setAttribute("userList", userList);
//        }
//
//        PaginationHelper paginationHelper = new PaginationHelper();
//        ServletContext context = getServletContext();
//        String itemsPerPage = "itemsPerUserListPage";
//        String attribute = "userList";
//        paginationHelper.Pagination(request, userList, context, itemsPerPage, attribute);
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        ArrayList<User> userList = userDAO.getUserList();
        session.setAttribute("userList", userList);

        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRole = userRoleDAO.getUserRoleList();
        request.setAttribute("userRole", userRole);

        String htmlResponse = listUser(request, userList);
        request.setAttribute("htmlResponse", htmlResponse);

        PrintWriter out = response.getWriter();
        out.print(htmlResponse);
        request.getRequestDispatcher("Views/UserList.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        ArrayList<User> userList = new ArrayList<>();
        if ("pagination".equals(action)) {
            userList = (ArrayList<User>) session.getAttribute("userList");

            String htmlResponse = listUser(request, userList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);
        } else if ("search".equals(action)) {
            userList = searchUser(request);

            UserRoleDAO userRoleDAO = new UserRoleDAO();
            ArrayList<UserRole> userRole = userRoleDAO.getUserRoleList();
            request.setAttribute("userRole", userRole);

            String htmlResponse = listUser(request, userList);
            request.setAttribute("htmlResponse", htmlResponse);
            request.getRequestDispatcher("Views/UserList.jsp").forward(request, response);
        } else if ("sort".equals(action)) {
            userList = sortUserList(request);

            String htmlResponse = listUser(request, userList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);
        } else if ("filter".equals(action)) {
            userList = filterUser(request);

            String htmlResponse = listUser(request, userList);
            String pagePagination = pagePagination(request, userList);

            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse + "|" + pagePagination);
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
