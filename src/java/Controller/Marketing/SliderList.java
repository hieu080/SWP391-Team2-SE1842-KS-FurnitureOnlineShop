/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.SliderDAO;
import DAL.UserDAO;
import DAL.UserRoleDAO;
import Helper.PaginationHelper;
import Models.Slider;
import Models.User;
import Models.UserRole;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SliderList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String status = request.getParameter("status");
        String search = "";
        if (request.getParameter("search") != null) {
            search = request.getParameter("search").trim();
        } else {
            search = request.getParameter("search");
        }
        if (session != null) {
            User user = ((User) session.getAttribute("customer"));
            SliderDAO sliderDAO = new SliderDAO();
            List<Slider> sliders = new ArrayList<>();

            UserRole role = new UserRoleDAO().getUserRoleByID(user.getRole_id());

            if (role.getRolename().equals("Marketer")) {

                if (status != null && !"all".equals(status) && search != null && !search.isEmpty()) {
                    sliders = sliderDAO.getAllSlidersWithStatusAndSearch(status, search, user.getId());
                } else if (status != null && !"all".equals(status)) {
                    sliders = sliderDAO.getAllSlidersWith(status, user.getId());
                } else if (search != null && !search.isEmpty()) {
                    sliders = sliderDAO.getAllSlidersAuthorBy(search, user.getId());
                } else {
                    sliders = sliderDAO.getAllSlidersByAuthor(user.getId());
                }
            } else if (role.getRolename().equals("Admin")) {
                if (status != null && !"all".equals(status) && search != null && !search.isEmpty()) {
                    sliders = sliderDAO.getAllSlidersWithStatusAndSearch(status, search);
                } else if (status != null && !"all".equals(status)) {
                    sliders = sliderDAO.getAllSlidersWith(status);
                } else if (search != null && !search.isEmpty()) {
                    sliders = sliderDAO.getAllSlidersBy(search);
                } else {
                    sliders = sliderDAO.getAllSliders();
                }
            } else {
                request.getRequestDispatcher("error.jsp");
            }
            String sort = request.getParameter("sort");
            if (!sliders.isEmpty()) {
                if (sort != null&&!sort.equals("all")) {
                    if (sort.equals("id")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getId));
                    }
                    if (sort.equals("id_desc")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getId).reversed());
                    }
                    if (sort.equals("title")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getTitle));
                    }
                    if (sort.equals("title_desc")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getTitle).reversed());
                    }
                    if (sort.equals("backlink")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getLink));
                    }
                    if (sort.equals("backlink_desc")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getLink).reversed());
                    }
                    if (sort.equals("author_id")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getAuthor_id));
                    }
                    if (sort.equals("author_id_desc")) {
                        Collections.sort(sliders, Comparator.comparing(Slider::getAuthor_id).reversed());
                    }
                    
                }
                request.setAttribute("listslider", sliders);
                PaginationHelper paginationHelper = new PaginationHelper();
                String itemsPerPage = "itemsPerSliderPage";
                ServletContext context = getServletContext();
                String attribute = "listslider";
                paginationHelper.Pagination(request, sliders, context, itemsPerPage, attribute);
            } else {
                request.setAttribute("listempty", "List is empty!");
            }
            request.setAttribute("sort", sort);
            request.setAttribute("st", status);
            request.setAttribute("search", search);
            request.getRequestDispatcher("Views/SliderList.jsp").forward(request, response);
        } else {
            response.sendRedirect("HomePage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
