/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Marketing;

import DAL.SliderDAO;
import Models.Slider;
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
import java.util.List;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class SliderInsert extends HttpServlet {
   
   private static final String UPLOAD_DIRECTORY = "image";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/InsertSlider.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession(false);
        int author_id = ((User) session.getAttribute("customer")).getId();
        String title = request.getParameter("title");
//        if(!checkTitleDuplicate(title)){
//            request.setAttribute("error", "Titles cannot be duplicated!");
//            request.getRequestDispatcher("Views/InsertSlider.jsp").forward(request, response);
//            return;
//        }
        
        String backLink = request.getParameter("backLink");
        String status = request.getParameter("status");
        String notes = request.getParameter("notes");

        Part filePart = request.getPart("imageslider");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File not provided or empty.");
            return;
        }
        
        String fileName = getFileName(filePart);

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

        // Cập nhật thông tin slider
        SliderDAO sliderDAO= new SliderDAO();
        Slider slider = new Slider();
        slider.setAuthor_id(author_id);
        slider.setTitle(title);
        slider.setLink(backLink);
        slider.setStatus(status);
        slider.setNotes(notes);

        if (fileName != null && !fileName.isEmpty()) {
            slider.setImage(UPLOAD_DIRECTORY + "/" + fileName); // Cập nhật đường dẫn ảnh mới
        }

        sliderDAO.addSlider(slider);

        response.sendRedirect("SliderList");
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
    private boolean checkTitleDuplicate(String title){
        List<Slider> sliders= new SliderDAO().getAllSliders();
        for(Slider slider:sliders){
            if(slider.getTitle().equals(title))
                return false;
        }
        return true;
    }
    public static void main(String[] args) {
        SliderDAO sliderDAO= new SliderDAO();
        Slider slider = new Slider();
        slider.setAuthor_id(4);
        slider.setTitle("title3");
        slider.setImage("");
        slider.setLink("backLink3");
        slider.setStatus("show");
        slider.setNotes("note3");
        sliderDAO.addSlider(slider);
    }
}