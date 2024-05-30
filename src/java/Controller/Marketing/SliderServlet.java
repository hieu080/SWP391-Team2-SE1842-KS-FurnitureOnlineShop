/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.SliderDAO;
import DAL.UserDAO;
import DAL.UserRoleDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Models.Slider;
import Models.User;
import Models.UserRole;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author ADMIN
 */

public class SliderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        int author_id = Integer.parseInt(request.getParameter("author_id"));

        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliders = new ArrayList<>();

        User user = new UserDAO().getUserByID(author_id);
        UserRole role = new UserRoleDAO().getUserRoleByID(user.getRole_id());
        String search = "";
        if (request.getParameter("search") != null) {
            search = request.getParameter("search").trim();
        } else {
            search = request.getParameter("search");
        }
        if (role.getRolename().equals("Marketer")) {

            if (status != null && !"all".equals(status) && search != null && !search.isEmpty()) {
                sliders = sliderDAO.getAllSlidersWithStatusAndSearch(status, search, author_id);
            } else if (status != null && !"all".equals(status)) {
                sliders = sliderDAO.getAllSlidersWith(status, author_id);
            } else if (search != null && !search.isEmpty()) {
                sliders = sliderDAO.getAllSlidersAuthorBy(status, author_id);
            } else {
                sliders = sliderDAO.getAllSlidersByAuthor(author_id);
            }
        } else if (role.getRolename().equals("Admin")) {
            if (status != null && !"all".equals(status) && search != null && !search.isEmpty()) {
                sliders = sliderDAO.getAllSlidersWithStatusAndSearch(status, search);
            } else if (status != null && !"all".equals(status)) {
                sliders = sliderDAO.getAllSlidersWith(status);
            } else if (search != null && !search.isEmpty()) {
                sliders = sliderDAO.getAllSlidersBy(status);
            } else {
                sliders = sliderDAO.getAllSliders();
            }
        }

            if (!sliders.isEmpty()) {
                request.setAttribute("listslider", sliders);
            } else {
                request.setAttribute("listempty", "List is empty!");
            }

            request.setAttribute("st", status);
            request.setAttribute("search", search);
            request.getRequestDispatcher("Views/SliderList.jsp").forward(request, response);
        }

        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("sliderId"));
            String action = request.getParameter("action");
            SliderDAO sliderDAO = new SliderDAO();
            Slider slider = sliderDAO.getSliderById(id);
            slider.setStatus(action);
            sliderDAO.updateSlider(slider);
            String currentURL = request.getRequestURL().toString();

            // Lấy tất cả tham số query từ yêu cầu gửi đến
            String queryString = request.getQueryString();

            // Nếu có tham số query, nối chúng vào đường dẫn URL
            if (queryString != null && !queryString.isEmpty()) {
                currentURL += "?" + queryString;
            }

            // Chuyển hướng về trang hiện tại với tất cả các tham số query giữ nguyên
            response.sendRedirect(currentURL);
        }

    }
