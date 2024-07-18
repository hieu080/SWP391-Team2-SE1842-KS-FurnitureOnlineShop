package Controller.Marketing;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.AttachedImageDAO;
import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import Helper.FileUploadHelper;
import Models.AttachedImage;
import Models.Brand;
import Models.Category;
import Models.Color;
import Models.Product;
import Models.ProductDetail;
import Models.Room;
import Models.SaleOff;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
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
public class AddProductServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "image/product";

    private int tryParseInt(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private double tryParseDouble(String value, double defaultValue) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("Views/AddProductTest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("productName");
        int category_id = tryParseInt(request.getParameter("categoryId"), 0);
        int brand_id = tryParseInt(request.getParameter("brandId"), 0);
        int room_id = tryParseInt(request.getParameter("roomId"), 0);
        double price = tryParseDouble(request.getParameter("priceProduct"), 0);
        int quantity = tryParseInt(request.getParameter("quantityProduct"), 0);

        FileUploadHelper fileUpload = new FileUploadHelper();
        String image = "imageProduct";
        String fileName = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);

        String description = request.getParameter("descriptionProduct");

        if (price != 0 && quantity != 0) {
            Product product = new Product(category_id, brand_id, room_id, name, description, fileName, price, quantity);
            ProductDAO productDAO = new ProductDAO();
            productDAO.insertProduct(product);
        }
        processRequest(request, response);
        response.sendRedirect("ProductListMKTServlet");
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
