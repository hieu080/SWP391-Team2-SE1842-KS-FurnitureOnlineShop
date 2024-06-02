/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.ProductDAO;
import DAL.RoomDAO;
import Helper.FileUploadHelper;
import Models.Brand;
import Models.Category;
import Models.Color;
import Models.Product;
import Models.Room;
import java.io.IOException;
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
public class InsertProduct extends HttpServlet {

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
        BrandDAO brandDao = new BrandDAO();
        ArrayList<Brand> brandList = brandDao.getBrandList();
        request.setAttribute("brandList", brandList);

        RoomDAO roomDAO = new RoomDAO();
        ArrayList<Room> roomList = roomDAO.getRoomList();
        request.setAttribute("roomList", roomList);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);

        request.getRequestDispatcher("Views/InsertProduct.jsp").forward(request, response);
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
        String fileName = fileUpload.uploadFileAndReturnFileName(request, response, UPLOAD_DIRECTORY);

        String category_idStr = request.getParameter("category_id");
        String brand_idStr = request.getParameter("brand_id");
        String room_idStr = request.getParameter("room_id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        int category_id = 0;
        int brand_id = 0;
        int room_id = 0;
        int quantity = 0;
        double price = 0;
        try {
            category_id = Integer.parseInt(category_idStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            brand_id = Integer.parseInt(brand_idStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            room_id = Integer.parseInt(room_idStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            price = Double.parseDouble(priceStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Product product = new Product(category_id, brand_id, room_id, name, description, fileName, price, quantity);
        ProductDAO productDAO = new ProductDAO();
        String ms;
        if (productDAO.insertProduct(product) == true) {
            ms = "Insert successfully";
        } else {
            ms = "Fail";
        }
        request.setAttribute("ms", ms);
        processRequest(request, response);
    }

}
