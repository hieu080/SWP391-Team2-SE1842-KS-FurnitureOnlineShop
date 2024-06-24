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
import Models.Feedback;
import Models.ImageFeedback;
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
public class FeedbackServlet extends HttpServlet {

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
        for (int i = 0; i < productId.length; i++) {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        FileUploadHelper fileUploadHelper = new FileUploadHelper();

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("customer");

        int feedbackId = feedbackDAO.getFeedbackWithMaxId();
        int orderId = tryParseInt(request.getParameter("orderId"), 0);

        int count = 0;
        while (true) {
            String productIdStr = request.getParameter("productId_" + count);
            if (productIdStr == null) {
                break;
            }

            int productId = tryParseInt(productIdStr, 0);
            String feedbackStr = request.getParameter("feedback_" + count);
            int rating = tryParseInt(request.getParameter("rating_" + count), 0);

            if (feedbackStr != null && !feedbackStr.isEmpty() && rating > 0) {
                Feedback feedback = new Feedback(u.getId(), productId, rating, feedbackStr);
                feedbackDAO.insertFeedback(feedback);

                int fileCount = tryParseInt(request.getParameter("fileCount_" + count), 0);
                String image = "imgfeedback_" + count;
                Part filePart = request.getPart(image);
                String[] fileNames = new String[fileCount];
                if (filePart != null && filePart.getSize() > 0) {
                    fileNames = fileUploadHelper.uploadFilesAndReturnFileNames(request, response, image, UPLOAD_DIRECTORY);
                }

                for (String fileName : fileNames) {
                    ImageFeedback imageFeedback = new ImageFeedback(feedbackId, fileName);
                    feedbackDAO.insertImageFb(feedbackId, fileName);
                }
                count++;
            }
        }
        ProductDAO pdao = new ProductDAO();
        pdao.updateScoreOfProduct();
        feedbackDAO.insertHistory(orderId, feedbackId);
        response.sendRedirect("HomePage");

    }

    private int tryParseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

}
