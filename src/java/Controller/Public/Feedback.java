/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAL.FeedbackDAO;
import DAL.OrderDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.UserDAO;
import Helper.FileUploadHelper;
import Models.Category;
import Models.Product;
import Models.User;
import Models.Order;
import Models.OrderDetail;
import Models.ProductDetail;
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

        String orderIDStr = request.getParameter("order_id");
        int order_id = 0;
        try {
            order_id = Integer.parseInt(orderIDStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrder(order_id);
        request.setAttribute("order", order);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> listOrderDetails = orderDetailDAO.getOrderDetailsByOrderId(order_id);
        request.setAttribute("listOrderDetails", listOrderDetails);
        
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = new ArrayList<>();
        for (OrderDetail OrderDetail : listOrderDetails) {
            productDetailList.add(productDetailDAO.getProductDetail(OrderDetail.getProductdetail_id()));
        }
        
        ProductDetailDAO pddao = new ProductDetailDAO();
        int[] productId = new int[listOrderDetails.size()];
        for (int i : productId) {
            productId[i] = pddao.getProductIdByProductDetailId(listOrderDetails.get(i).getProductdetail_id());
        }
        
        request.setAttribute("productDetailList", productDetailList);
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = new ArrayList<>();
        
        for (int pid : productId) {
            productList.add(productDAO.getProductByID(pid));
        }
        
        request.setAttribute("listP", productList);
        request.getRequestDispatcher("/Views/Feedback.jsp").forward(request, response);

    }

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
            // Xử lý ngoại lệ nếu cần thiết
        }

        int order_id = 1; // Bạn có thể lấy giá trị order_id từ yêu cầu hoặc phiên làm việc

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.getOrderDetailsList();
        ArrayList<Integer> productFb = new ArrayList<>();
        for (OrderDetail orderDetail : orderDetailList) {
            int productdetail_id = orderDetail.getProductdetail_id();
            int product_id = productDetailDAO.getProductIdByProductDetailId(productdetail_id);
            productFb.add(product_id);
        }

        for (Integer integer : productFb) {
            feedbackDAO.sendFeedback(u.getId(), integer.intValue(), rate, feedback, "Active");
        }

        // Sử dụng hàm uploadFilesAndReturnFileNames từ lớp FileUploadHelper
        FileUploadHelper fileUploadHelper = new FileUploadHelper();
        String[] fileNames = fileUploadHelper.uploadFilesAndReturnFileNames(request, response, "fbimg", UPLOAD_DIRECTORY);

        // Kiểm tra nếu không có tệp nào được tải lên
        if (fileNames == null || fileNames.length == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Files not provided or empty.");
            return;
        }

        // Lưu tên các tệp vào cơ sở dữ liệu
        for (String fileName : fileNames) {
            for (Integer integer : productFb) {
                feedbackDAO.insertImageFb(integer.intValue(), fileName);
            }
        }

        response.sendRedirect("HomePage");
    }

}
