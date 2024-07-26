/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.FeedbackDAO;
import Helper.ConfigReaderHelper;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConfigReaderHelper config = new ConfigReaderHelper();
        
        int PageSize = config.getValueOfItemsPerPage(request.getServletContext().getRealPath("/"), "itemsPerFeedbackListPage");
        String index_str = request.getParameter("index") == null ? "" : request.getParameter("index");
        System.out.println(index_str);
        String sort = request.getParameter("sort") == null ? "" : request.getParameter("sort");
        request.setAttribute("sort", sort);
        String[] rateFilters = request.getParameterValues("rate-filter") == null ? new String[0] : request.getParameterValues("rate-filter");
        String[] statusfilter = request.getParameterValues("status-filter") == null ? new String[0] : request.getParameterValues("status-filter");
        String productname = request.getParameter("searchproduct") == null ? "" : request.getParameter("searchproduct");
        request.setAttribute("searchproduct", productname);
        int[] rate = new int[rateFilters.length];
        for (int i = 0; i < rateFilters.length; i++) {
            try {
                rate[i] = Integer.parseInt(rateFilters[i]);
            } catch (Exception e) {
                rate[i] = 0;
            }
        }
        request.setAttribute("rate", rate);

        int index;
        try {
            index = Integer.parseInt(index_str);
        } catch (Exception ex) {
            index = 1;
        }
        String customername = request.getParameter("searchcustomer") == (null) ? "" : request.getParameter("searchcustomer");
        request.setAttribute("searchcustomer", customername);
        String description = request.getParameter("searchfeedback") == (null) ? "" : request.getParameter("searchfeedback");
        request.setAttribute("searchfeedback", description);
        FeedbackDAO fd = new FeedbackDAO();
        List<Feedback> list = fd.searchFeedbacks(rate, statusfilter, customername, productname, description, (index - 1) * PageSize, PageSize, sort);
        int total = fd.countFeedbacks(rate, statusfilter, customername, productname, description);

        int number_page = total % PageSize == 0 ? total / PageSize : (int) (total / PageSize) + 1;
        if (index > number_page) {
            index = number_page;
        }
        if (index < 0) {
            index = 1;
        }
        if(index==0){
            index=1;
        }
        //productname.equals(index)
        request.setAttribute("statusfilter", statusfilter);
        request.setAttribute("index", index);
        request.setAttribute("numberpage", number_page);
        request.setAttribute("fl", list);
        PrintWriter out = response.getWriter();
        out.print(list.size() + "\n");
        out.print(number_page + "\n");
        //out.print(status+"\n");
        out.print(fd.counts + "\n");
        out.print(total + "\n");
        request.getRequestDispatcher("./Views/FeedBacksList.jsp").forward(request, response);
    }

    public boolean sayHello(int a, int arr[]) {
        for(int i = 0;i<arr.length;i++){
            if(a==arr[i]){
                return true;
            }
        }  
        return true;
    }
}
