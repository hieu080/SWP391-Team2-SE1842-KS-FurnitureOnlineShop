package Helper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.List;
import java.util.Collection;

public class FileUploadHelper {

    public FileUploadHelper() {
    }
    
    public String uploadFileAndReturnFileName(HttpServletRequest request, HttpServletResponse response,String name, String UPLOAD_DIRECTORY) throws ServletException, IOException {
        Part filePart = request.getPart(name);
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File not provided or empty.");
            return null;
        }

        String fileName = getFileName(filePart);

        // Tạo đường dẫn lưu file
        String applicationPath = request.getServletContext().getRealPath("");
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
        return fileName;
    }

    // Helper method to extract file name from the Part object
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
    
    public String[] uploadFilesAndReturnFileNames(HttpServletRequest request, HttpServletResponse response, String name, String UPLOAD_DIRECTORY) throws ServletException, IOException {
        // Lấy tất cả các phần tệp từ yêu cầu
        Collection<Part> fileParts = request.getParts();

        // Danh sách lưu trữ tên các tệp đã tải lên
        List<String> fileNames = new ArrayList<>();

        // Đường dẫn ứng dụng
        String applicationPath = request.getServletContext().getRealPath("");
        String destinationPath = applicationPath.replace("build\\", "");
        String uploadFilePath = destinationPath + UPLOAD_DIRECTORY;

        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Lặp qua từng phần tệp
        for (Part filePart : fileParts) {
            if (filePart.getName().equals(name) && filePart.getSize() > 0) {
                String fileName = getFileNameMultiple(filePart);

                // Đường dẫn tới tệp đích
                Path destinationFilePath = Paths.get(uploadFilePath + File.separator + fileName);

                // Lưu tệp vào thư mục
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, destinationFilePath, StandardCopyOption.REPLACE_EXISTING);
                }

                // Thêm tên tệp vào danh sách
                fileNames.add(fileName);
            }
        }

        // Chuyển đổi danh sách tên tệp thành mảng và trả về
        return fileNames.toArray(new String[0]);
    }

// Hàm để lấy tên tệp từ phần tệp (được giả định là bạn đã có hàm này)
    private String getFileNameMultiple(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }

}
