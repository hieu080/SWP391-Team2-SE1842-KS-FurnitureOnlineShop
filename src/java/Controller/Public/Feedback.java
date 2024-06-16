/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAL.FeedbackDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.UserDAO;
import Models.Category;
import Models.Product;
import Models.User;
import Models.Order;
import Models.OrderDetail;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class Feedback extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/imagefeedback";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        // String orderIDStr = request.getParameter("order_id");
        int order_id = 1;
//        try{
//            order_id = Integer.parseInt(orderIDStr);
//        }catch(NumberFormatException e){
//            e.printStackTrace();
//        }
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrder(u.getId(), order_id);
        request.setAttribute("order", order);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> listOrderDetails = orderDetailDAO.getOrderDetailsByOrderId(order_id);
        request.setAttribute("listOrderDetails", listOrderDetails);

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        request.setAttribute("listP", productList);
        request.getRequestDispatcher("/Views/Feedback.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");
        String feedback = request.getParameter("feedback");
        String rateStr = request.getParameter("rating");
        int rate = 0;

        try {
            rate = Integer.parseInt(rateStr);
        } catch (Exception e) {
        }

        //String orderIDStr = request.getParameter("order_id");
        int order_id = 1;
//        try{
//            order_id = Integer.parseInt(orderIDStr);
//        }catch(NumberFormatException e){
//            e.printStackTrace();
//        }

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.getOrderDetailsList();
        ArrayList<Integer> productFb = new ArrayList<>();
        for (OrderDetail orderDetail : orderDetailList) {
            if (orderDetail.getOrder_id() == order_id) {
                productFb.add(orderDetail.getProductdetail_id());
            }
        }

        for (Integer integer : productFb) {
            feedbackDAO.sendFeedback(u.getId(), integer.intValue(), rate, feedback, "Active");
        }

        Part filePart = request.getPart("fbimg");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File not provided or empty.");
            return;
        }

        String fileName = getFileName(filePart);

        for (Integer integer : productFb) {
            feedbackDAO.insertImageFb(integer.intValue(), fileName);
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
        response.sendRedirect("HomePage");
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
