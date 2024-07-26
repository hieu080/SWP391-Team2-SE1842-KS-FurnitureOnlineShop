package  Controller.Common;
import DAL.UserDAO;
import Models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import com.google.gson.JsonObject;

public class ChangePassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        String oldpass = request.getParameter("oldpass");
        String hassPass = userDAO.hashPassword(oldpass);
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");

        User u = (User) session.getAttribute("customer");

        JsonObject jsonResponse = new JsonObject();

        if (!oldpass.equals(u.getPassword())) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Mật khẩu cũ không đúng");
        } else if (!newpass.equals(renewpass)) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Mật khẩu mới không khớp");
        } else if (newpass.equals(oldpass)) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Mật khẩu mới không được trùng với mật khẩu cũ");
        } else {
            userDAO.changePass(String.valueOf(u.getId()), newpass);
            session.removeAttribute("customer");
            jsonResponse.addProperty("status", "success");
            jsonResponse.addProperty("message", "Thay đổi mật khẩu thành công.Vui lòng đăng nhập lại!");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}
