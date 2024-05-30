/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Marketing;


import DAL.SliderDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.Slider;

/**
 *
 * @author ADMIN
 */
public class SliderDetailServlet extends HttpServlet {
   
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("sliderId"));
        SliderDAO sliderDAO = new SliderDAO();
        Slider slider= sliderDAO.getSliderById(id);
        request.setAttribute("slider", slider);
        request.getRequestDispatcher("Views/SliderDetail.jsp").forward(request, response);
    } 

      

    

}
