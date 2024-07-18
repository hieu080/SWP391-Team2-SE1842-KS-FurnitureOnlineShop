/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.FeedbackDAO;
import Models.Feedback;
import com.oracle.wls.shaded.org.apache.xalan.lib.Redirect;
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
 * @author admin
 */
public class FeedBackList extends HttpServlet {

    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final  int PageSize = 6;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String index_str = request.getParameter("index") == null ? "" : request.getParameter("index");
        String sort = request.getParameter("sort") == null ? "" : request.getParameter("sort");
        request.setAttribute("sort", sort);
        String status = request.getParameter("status") == null || request.getParameter("status").equals("all") ? "" : request.getParameter("status");
        request.setAttribute("status", status);
        String productname = request.getParameter("productname") == null ? "" : request.getParameter("productname");
        request.setAttribute("productname", productname);
        String rate_str = request.getParameter("rate");
        int rate;
        try {
            rate = Integer.parseInt(rate_str);
        } catch (Exception e) {
            rate = 0;
        }
        request.setAttribute("rate", rate);
        int index;
        try {
            index = Integer.parseInt(index_str);
        } catch (Exception ex) {
            index = 1;
        }
        String customername = request.getParameter("customername") == (null) ? "" : request.getParameter("customername");
        request.setAttribute("customername", customername);
        String description = request.getParameter("description") == (null) ? "" : request.getParameter("description");
        request.setAttribute("description", description);
        FeedbackDAO fd = new FeedbackDAO();
        List<Feedback> list = fd.searchFeedbacks(rate, status, customername, productname, description, (index-1)*PageSize, PageSize,sort);
        int total = fd.countFeedbacks(rate, status, customername, productname, description);
        int number_page = total%PageSize==0?total/PageSize:(int)(total/PageSize)+1;
        if (index > number_page) {
            index = number_page;
        }
        if (index < 0) {
            index = 1;
        }
        request.setAttribute("index", index);
       
        request.setAttribute("numberpage", number_page);
        request.setAttribute("fl", list);
        PrintWriter out = response.getWriter();
        out.print(list.size()+"\n");
        out.print(number_page+"\n");
        out.print(status+"\n");
        out.print(fd.counts+"\n");
        out.print(total+"\n");
        request.getRequestDispatcher("./Views/FeedBacksList.jsp").forward(request, response);
    }
    public static void main(String[] args) {
        List<Feedback> feedbacks= new FeedbackDAO().searchFeedbacks(0, "", "", "", "", 1, 5, null);
        for (Feedback feedback : feedbacks) {
            System.out.println(feedback.getId());
        }
    }
}
