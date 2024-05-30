package Controller.Marketing;

import DAL.SliderDAO;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import Models.Slider;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@WebServlet("/UpdateSliderServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateSliderServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sliderIdStr = request.getParameter("sliderid");
        if (sliderIdStr == null || sliderIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid sliderId parameter");
            return;
        }

        int sliderId;
        try {
            sliderId = Integer.parseInt(sliderIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid sliderId parameter");
            return;
        }

        String title = request.getParameter("title");
         if(!checkTitleDuplicate(title)){
            request.setAttribute("error", "Titles cannot be duplicated!");
            request.getRequestDispatcher("Views/UpdateSlider.jsp").forward(request, response);
            return;
        }
        String backLink = request.getParameter("backLink");
        String status = request.getParameter("status");
        String notes = request.getParameter("notes");
        String oldImage = request.getParameter("sliderimage");

        Part filePart = request.getPart("imageslider");
        String fileName = getFileName(filePart);
        SliderDAO sliderDAO= new SliderDAO();
        Slider slider = sliderDAO.getSliderById(sliderId);
        slider.setTitle(title);
        slider.setLink(backLink);
        slider.setStatus(status);
        slider.setNotes(notes);
        if(fileName.isEmpty() && fileName.equals("")){
             slider.setImage(oldImage);
             response.sendRedirect("SliderServlet");
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

        // Cập nhật thông tin slider
        
        if (slider == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Slider not found");
            return;
        }

       

        if (fileName != null && !fileName.isEmpty()) {
            slider.setImage(UPLOAD_DIRECTORY + "/" + fileName);
        }

        sliderDAO.updateSlider(slider);

        response.sendRedirect("SliderServlet");
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
}
