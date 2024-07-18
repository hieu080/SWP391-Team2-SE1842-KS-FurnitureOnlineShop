/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Marketing;

import DAL.UserDAO;
import Models.CustomerChanges;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author DELL
 */
public class CustomerDetails extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        String id = request.getParameter("id");
        //lich su chinh sua customerchanges
        List<CustomerChanges> list = udao.getListCustomerChangesbyId(id);
        request.setAttribute("listchanges", list);
        //lay list mkt de so sanh voi updatedby
        List<User> listMkt = udao.getMarketerList();
        request.setAttribute("listMkt", listMkt);
        //user details
        User cus = udao.getUserbyID(id);
        request.setAttribute("cus", cus);
        request.getRequestDispatcher("Views/CustomerDetails.jsp").forward(request, response);
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
        UserDAO udao = new UserDAO();
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String add = request.getParameter("add");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        //lay ra thong tin trc khi update
        User old = udao.getUserbyID(id);
        
        //update customer
        boolean isSuccess = udao.updateCustomer(id, fullname, gender, phone, add, email);
        if (isSuccess) {
            request.setAttribute("result", "success");
            //lay ra nguoi update(mkt)
            HttpSession session = request.getSession();
            User updater = (User) session.getAttribute("customer");
            //tao doi tuong customerchanges
            CustomerChanges cc = new CustomerChanges();
            //lay ra thong tin sau khi update 
            User current = udao.getUserbyID(id);
            
            //so sanh xem co thay doi gi khong
            if(old.getFullname().equals(current.getFullname())){
                cc.setFullname("unchanged");
            }else{
                cc.setFullname(old.getFullname());
            }
            
            if(old.getAddress().equals(current.getAddress())){
                cc.setAddress("unchanged");
            }else{
                cc.setAddress(old.getAddress());
            }
            
            if(old.getEmail().equals(current.getEmail())){
                cc.setEmail("unchanged");
            }else{
                cc.setEmail(old.getEmail());
            }
            
            if(old.getGender().equals(current.getGender())){
                cc.setGender("unchanged");
            }else{
                cc.setGender(old.getGender());
            }
            
            if(old.getPhonenumber().equals(current.getPhonenumber())){
                cc.setPhone("unchanged");
            }else{
                cc.setPhone(old.getPhonenumber());
            }
            
            cc.setUpdatedby(updater.getId());
            cc.setCustomer_id(Integer.parseInt(id));
            
            udao.addToCustomerChanges(cc);
            
        } else {
            request.setAttribute("result", "failure");
        }
        
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
