/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Models.Category;
import Models.Product;
import DAl.OrderDetailDao;
import Models.User;
import DAL.FeedbackDao;
import DAl.CustomerDAO;
import Models.Order;
import Models.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class Feedback extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "images/imagefeedback";
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerDAO dao = new CustomerDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        String orderIDStr = request.getParameter("order_id");
        int order_id = 0;
        try{
            order_id = Integer.parseInt(orderIDStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        Order listO = dao.getOrder(u.getId(), 1);
        request.setAttribute("listO", listO);
        ArrayList<OrderDetail> listD = dao.getOrderDetailList();
        request.setAttribute("listD", listD);
        ArrayList<Product> listP = dao.getProductList();
        request.setAttribute("listP", listP);
        request.getRequestDispatcher("/Views/Feedback.jsp").forward(request, response);
        
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDao fbdao = new FeedbackDao();
        CustomerDAO csdao = new CustomerDAO();
//        OrderDetailDao odd = new OrderDetailDao();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        String feedback = request.getParameter("feedback");
        int rate = Integer.parseInt(request.getParameter("rate"));
        
        String orderIDStr = request.getParameter("order_id");
        int order_id = 0;
        try{
            order_id = Integer.parseInt(orderIDStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        
        ArrayList<OrderDetail> listD = csdao.getOrderDetailList();
        ArrayList<Integer> productFb = new ArrayList<>();
        for (OrderDetail orderDetail : listD) {
            if(orderDetail.getOrder_id() == order_id){
                productFb.add(orderDetail.getProduct_id());
            }
        }
        
        for (Integer integer : productFb) {
            fbdao.sendfeedback(u.getId(), integer.intValue(), rate, feedback, "active");
        }
        
        Part filePart = request.getPart("fbimg");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File not provided or empty.");
            return;
        }

        String fileName = getFileName(filePart);
        
        for (Integer integer : productFb) {
            fbdao.insertImageFb(integer.intValue(), fileName);
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