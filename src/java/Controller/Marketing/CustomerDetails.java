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
        UserDAO udao = new UserDAO();
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String add = request.getParameter("add");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        //validate
        String error = "";
        // Kiểm tra tên không được để trống
        if (fullname.length()<2 || fullname.length()>64) {
            error = "Tên từ 2-64 kí tự!";
        }
        
        if(!fullname.matches("^[\\p{L}\\s]+$")){
            error = "Tên từ 2-64 kí tự!";
        }

        // Kiểm tra độ dài của địa chỉ (từ 20 đến 320 ký tự)
        if (add.length() < 20 || add.length() > 320) {
            error = "Địa chỉ từ 20-320 kí tự!";
        }

        // Kiểm tra định dạng email

        // Kiểm tra sự hiện diện của ký tự '@'
        if (!email.contains("@")) {
            error = "Email không hợp lệ!";
        }

        // Kiểm tra sự hiện diện của local part và domain part
        String[] parts = email.split("@");
        if (parts.length != 2 || parts[0].isEmpty() || parts[1].isEmpty()) {
            error = "Email không hợp lệ!";
        }

        // Kiểm tra xem domain có chứa ít nhất một dấu chấm không
        if (!parts[1].contains(".")) {
            error = "Email không hợp lệ!";
        }

        // Kiểm tra xem domain không bắt đầu hoặc kết thúc bằng dấu gạch ngang
        if (parts[1].startsWith("-") || parts[1].endsWith("-")) {
            error = "Email không hợp lệ!";
        }

        // Kiểm tra xem domain không bắt đầu hoặc kết thúc bằng dấu chấm
        if (parts[1].startsWith(".") || parts[1].endsWith(".")) {
            error = "Email không hợp lệ!";
        }
        
        // Kiểm tra định dạng số điện thoại (bắt đầu bằng 0 và gồm chính xác 10 ký tự)
        String phoneRegex = "^0\\d{9}$";
        if (!phone.matches(phoneRegex)) {
            error = "Số điện thoại không hợp lệ!";
        }

        //lay ra nguoi update(mkt)
        HttpSession session = request.getSession();
        User updater = (User) session.getAttribute("customer");

        //lay ra thong tin trc khi update
        User old = udao.getUserbyID(id);

        //update customer
        boolean isSuccess = udao.updateCustomer(id, fullname, gender, phone, add, email);
        if (updater != null) {        
            if (isSuccess) {
                request.setAttribute("result", "success");

                //tao doi tuong customerchanges
                CustomerChanges cc = new CustomerChanges();
                //lay ra thong tin sau khi update 
                User current = udao.getUserbyID(id);

                //so sanh xem co thay doi gi khong
                if (old.getFullname().equals(current.getFullname())) {
                    cc.setFullname("unchanged");
                } else {
                    cc.setFullname(old.getFullname());
                }

                if (old.getAddress().equals(current.getAddress())) {
                    cc.setAddress("unchanged");
                } else {
                    cc.setAddress(old.getAddress());
                }

                if (old.getEmail().equals(current.getEmail())) {
                    cc.setEmail("unchanged");
                } else {
                    cc.setEmail(old.getEmail());
                }

                if (old.getGender().equals(current.getGender())) {
                    cc.setGender("unchanged");
                } else {
                    cc.setGender(old.getGender());
                }

                if (old.getPhonenumber().equals(current.getPhonenumber())) {
                    cc.setPhone("unchanged");
                } else {
                    cc.setPhone(old.getPhonenumber());
                }

                cc.setUpdatedby(updater.getId());
                cc.setCustomer_id(Integer.parseInt(id));

                udao.addToCustomerChanges(cc);

            } else {
                request.setAttribute("error", error);
                request.setAttribute("result", "failure");
            }
        }
        else{
            if(isSuccess){
                request.setAttribute("result", "success");
            }
            else{
                request.setAttribute("error", error);
                request.setAttribute("result", "failure");
            }
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
