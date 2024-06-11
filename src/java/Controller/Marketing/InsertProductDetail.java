/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.AttachedImageDAO;
import DAL.ColorDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import Helper.FileUploadHelper;
import Models.AttachedImage;
import Models.Color;
import Models.Product;
import Models.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author HELLO
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class InsertProductDetail extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/product";

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
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        request.setAttribute("productList", productList);

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();
        request.setAttribute("colorList", colorList);

        request.getRequestDispatcher("Views/InsertProductDetail.jsp").forward(request, response);
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
        FileUploadHelper fileUpload = new FileUploadHelper();
        String productIDStr = request.getParameter("productID");
        String colorIDStr = request.getParameter("colorID");
        String quantityDetailStr = request.getParameter("quantityDetail");

        String image = "image1";
        String fileName1 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "image2";
        String fileName2 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "image3";
        String fileName3 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "image4";
        String fileName4 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);

        int productID = 0;
        int colorID = 0;
        int quantityDetail = 0;
        try {
            productID = Integer.parseInt(productIDStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            colorID = Integer.parseInt(colorIDStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            quantityDetail = Integer.parseInt(quantityDetailStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ProductDetail productDetail = new ProductDetail(productID, colorID, quantityDetail);
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        productDetailDAO.addProductDetail(productDetail);

        AttachedImage attachedImage1 = new AttachedImage(productID, fileName1);
        AttachedImage attachedImage2 = new AttachedImage(productID, fileName2);
        AttachedImage attachedImage3 = new AttachedImage(productID, fileName3);
        AttachedImage attachedImage4 = new AttachedImage(productID, fileName4);
        AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
        attachedImageDAO.addAttachedImage(attachedImage1);
        attachedImageDAO.addAttachedImage(attachedImage2);
        attachedImageDAO.addAttachedImage(attachedImage3);
        attachedImageDAO.addAttachedImage(attachedImage4);
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
