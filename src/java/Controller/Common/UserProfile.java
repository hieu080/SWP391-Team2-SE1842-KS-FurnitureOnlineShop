package Controller.Common;

import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UserProfile extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/avatar";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/UserProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession(false);
        User u = (User) session.getAttribute("customer");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Part filePart = request.getPart("fbimg");
        String fileName = getFileName(filePart);
        String oldimage = u.getAvatar();
        if (fileName.isEmpty() && fileName.equals("")) {
            if (phone != null && !phone.isEmpty() && phone.matches("[0-9]{10}")) {

                dao.update(fullname, gender, oldimage, phone, address, u.getId());

                u = dao.getUserById(u.getId());
                session.setAttribute("customer", u);
                response.sendRedirect("HomePage");
            } else {
                String msg = "Phone number is invalid";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("Views/UserProfile.jsp").forward(request, response);
            }
            return;
        }
        // Tạo đường dẫn lưu file
        String applicationPath = getServletContext().getRealPath("");
        String destinationPath = applicationPath.replace("build\\", "");

        String uploadFilePath = destinationPath + UPLOAD_DIRECTORY;

        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Đường dẫn tới tệp đích
        Path destinationFilePath = Paths.get(uploadFilePath + File.separator + fileName);

        // Lưu file vào thư mục
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, destinationFilePath, StandardCopyOption.REPLACE_EXISTING);
        }

        if (phone != null && !phone.isEmpty() && phone.matches("[0-9]{10}")) {
            if (fileName != null && !fileName.isEmpty()) {
                String img = UPLOAD_DIRECTORY + "/" + fileName;
                dao.update(fullname, gender, img, phone, address, u.getId());
            } else {
                dao.update(fullname, gender, oldimage, phone, address, u.getId());
            }

            u = dao.getUserById(u.getId());
            session.setAttribute("customer", u);
            response.sendRedirect("HomePage");
        } else {
            String msg = "Phone number is invalid";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("Views/UserProfile.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
