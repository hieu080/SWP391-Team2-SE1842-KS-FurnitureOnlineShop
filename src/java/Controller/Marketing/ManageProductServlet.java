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
public class ManageProductServlet extends HttpServlet {

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
    protected void UpdateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int editProductId = tryParseInt(request.getParameter("editProductId"), 0);
        String productName = request.getParameter("productName");
        int categoryId = tryParseInt(request.getParameter("categoryID"), 0);
        int brandId = tryParseInt(request.getParameter("brandID"), 0);
        int roomId = tryParseInt(request.getParameter("roomID"), 0);
        double priceProduct = tryParseDouble(request.getParameter("priceProduct"), 0);
        int quantityProduct = tryParseInt(request.getParameter("quantityProduct"), 0);
        String statusProduct = request.getParameter("statusProduct");
        String desciptionProduct = request.getParameter("desciptionProduct");

        String image = "imageProduct";
        FileUploadHelper fileUpload = new FileUploadHelper();
        String imageProduct;
        Part filePart = request.getPart(image);
        if (filePart != null && filePart.getSize() > 0) {
            imageProduct = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        } else {
            imageProduct = request.getParameter("oldImageProduct");
        }

        Product editProduct = new Product();
        editProduct.setId(editProductId);
        editProduct.setName(productName);
        editProduct.setCategory_id(categoryId);
        editProduct.setBrand_id(brandId);
        editProduct.setRoom_id(roomId);
        editProduct.setPrice(priceProduct);
        editProduct.setQuantity(quantityProduct);
        editProduct.setStatus(statusProduct);
        editProduct.setImage(imageProduct);
        editProduct.setDescription(desciptionProduct);

        ProductDAO productDAO = new ProductDAO();
        productDAO.updateProduct(editProduct);

        int count = 1;
        while (true) {
            String productDetailIDStr = request.getParameter("productDetailID_" + count);
            if (productDetailIDStr == null) {
                break;
            }
            int productDetailId = tryParseInt(productDetailIDStr, 0);
            int colorId = tryParseInt(request.getParameter("colorID_" + count), 0);
            int quantityProductDetail = tryParseInt(request.getParameter("quantityProductDetail_" + count), 0);
            String statusProductDetail = request.getParameter("statusProductDetail_" + count);

            ProductDetail editProductDetail = new ProductDetail();
            editProductDetail.setId(productDetailId);
            editProductDetail.setProduct_id(editProductId);
            editProductDetail.setColor_id(colorId);
            editProductDetail.setQuantity(quantityProductDetail);
            editProductDetail.setStatus(statusProductDetail);

            ProductDetailDAO productDetailDAO = new ProductDetailDAO();

            int start = (count - 1) * 4 + 1;
            int end = start + 3;

            for (int i = start; i <= end; i++) {
                int attachedImageId = tryParseInt(request.getParameter("attachedImageID_" + i), 0);

                image = "imageProductDetail_" + i;
                String imageAttachedImage;
                filePart = request.getPart(image);
                if (filePart != null && filePart.getSize() > 0) {
                    imageAttachedImage = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
                } else {
                    imageAttachedImage = request.getParameter("oldImageAttached_" + i);
                }

                AttachedImage editAttachedImage = new AttachedImage();
                editAttachedImage.setId(attachedImageId);
                editAttachedImage.setProductdetail_id(productDetailId);
                editAttachedImage.setImage(imageAttachedImage);
                AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
                attachedImageDAO.updateAttachedImage(editAttachedImage);
            }
            count++;
        }

    }

    protected void DeleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int deleteProductId = tryParseInt(request.getParameter("deleteProductId"), 0);
        ProductDAO productDAO = new ProductDAO();
        productDAO.deleteProduct(deleteProductId);

    }

    protected void InsertProduct(HttpServletRequest request, HttpServletResponse response)
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

        Product product = new Product(category_id, brand_id, room_id, name, description, fileName, price, quantity);
        ProductDAO productDAO = new ProductDAO();
        productDAO.insertProduct(product);
    }

    protected void InsertProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = tryParseInt(request.getParameter("productId"), 0);
        int color_id = tryParseInt(request.getParameter("colorId"), 0);
        int quantityProductDetail = tryParseInt(request.getParameter("quantityProductDetail"), 0);

        FileUploadHelper fileUpload = new FileUploadHelper();
        String image = "imageProductDetail1";
        String fileName1 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "imageProductDetail2";
        String fileName2 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "imageProductDetail3";
        String fileName3 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);
        image = "imageProductDetail4";
        String fileName4 = fileUpload.uploadFileAndReturnFileName(request, response, image, UPLOAD_DIRECTORY);

        ProductDetail productDetail = new ProductDetail(productId, color_id, quantityProductDetail);
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();
        productDetailDAO.addProductDetail(productDetail);

        productDetail = productDetailDAO.getProductDetailLastest();

        AttachedImage attachedImage1 = new AttachedImage(productDetail.getId(), fileName1);
        AttachedImage attachedImage2 = new AttachedImage(productDetail.getId(), fileName2);
        AttachedImage attachedImage3 = new AttachedImage(productDetail.getId(), fileName3);
        AttachedImage attachedImage4 = new AttachedImage(productDetail.getId(), fileName4);

        AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
        attachedImageDAO.addAttachedImage(attachedImage1);
        attachedImageDAO.addAttachedImage(attachedImage2);
        attachedImageDAO.addAttachedImage(attachedImage3);
        attachedImageDAO.addAttachedImage(attachedImage4);
    }

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

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();
        request.setAttribute("colorList", colorList);

        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = pddao.getAllProductDetails();
        request.setAttribute("productDetailList", productDetailList);

        AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
        ArrayList<AttachedImage> attachedImageList = attachedImageDAO.getAllAttachedImages();
        request.setAttribute("attachedImageList", attachedImageList);

        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();
        request.setAttribute("saleOffList", saleOffList);
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
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(productID);
        request.setAttribute("product", product);
        processRequest(request, response);
        request.getRequestDispatcher("Views/ManageProductMKT.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        switch (action) {
            case "addNewProduct":
                InsertProduct(request, response);
                session.removeAttribute("productList");
                response.sendRedirect("ProductListMKTServlet");
                break;
            case "addNewProductDetail":
                InsertProductDetail(request, response);
                session.removeAttribute("productList");
                response.sendRedirect("ProductListMKTServlet");
                break;
            case "editProduct":
                UpdateProduct(request, response);
                int productID = Integer.parseInt(request.getParameter("editProductId"));
                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.getProductByID(productID);
                request.setAttribute("product", product);
                processRequest(request, response);
                request.getRequestDispatcher("Views/ManageProductMKT.jsp").forward(request, response);
                break;
            case "deleteProduct":
                DeleteProduct(request, response);
                session.removeAttribute("productList");
//                response.sendRedirect("ProductListMKTServlet");
                break;
        }

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
