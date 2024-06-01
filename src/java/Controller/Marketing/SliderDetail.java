/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Marketing;

import DAL.SliderDAO;
import Models.Slider;
import Models.SliderWithAuthor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SliderDetail extends HttpServlet {
   
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("sliderId"));
          SliderWithAuthor sliderWithAuthor= new SliderDAO().getSliderByIdWithAuthor(id);
        request.setAttribute("slider", sliderWithAuthor);
        request.getRequestDispatcher("Views/SliderDetail.jsp").forward(request, response);
    } 
    public static void main(String[] args) {
        int id = 1;
          SliderWithAuthor sliderWithAuthor= new SliderDAO().getSliderByIdWithAuthor(id);
          System.out.println(sliderWithAuthor.getSlider().getTitle());
    }
}