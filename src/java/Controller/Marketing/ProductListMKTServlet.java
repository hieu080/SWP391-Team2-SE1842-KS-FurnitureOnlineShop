/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import DAL.AttachedImageDAO;
import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDetailDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import Helper.ComparatorHelper;
import Helper.ConfigReaderHelper;
import Helper.PaginationHelper;
import Models.AttachedImage;
import Models.Brand;
import Models.Category;
import Models.Color;
import Models.Feedback;
import Models.OrderDetail;
import Models.Product;
import Models.ProductDetail;
import Models.Room;
import Models.SaleOff;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author HELLO
 */
public class ProductListMKTServlet extends HttpServlet {

    private ArrayList<Product> sortProduct(HttpServletRequest request, ArrayList<Product> productList) {
        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        productList = comparatorHelper.sortProductList(productList, sortby);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
    }

    private ArrayList<Product> searchProduct(HttpServletRequest request, ArrayList<Product> productList) {
        ProductDAO productDAO = new ProductDAO();
        String search = request.getParameter("search");
        productList = productDAO.searchProductByName(search);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
    }

    private ArrayList<Product> filterProduct(HttpServletRequest request) {
        ProductDAO productDAO = new ProductDAO();
        String[] brandIDStr = request.getParameterValues("brand-filter");
        String[] roomSIDtr = request.getParameterValues("room-filter");
        String[] categoryIDStr = request.getParameterValues("category-filter");
        String[] priceIDStr = request.getParameterValues("price-filter");
        String[] statusIDStr = request.getParameterValues("status-filter");

        ArrayList<Product> productList = productDAO.filterProductListMKT(brandIDStr, roomSIDtr, categoryIDStr, statusIDStr, priceIDStr);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
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

    private ArrayList<Product> ProductDisplay(HttpServletRequest request, ArrayList<Product> productList) {
        BrandDAO brandDao = new BrandDAO();
        ArrayList<Brand> brandList = brandDao.getBrandList();

        RoomDAO roomDAO = new RoomDAO();
        ArrayList<Room> roomList = roomDAO.getRoomList();

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();

        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ArrayList<Feedback> feedbackList = feedbackDAO.getFeedbackList();

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.getOrderDetailsList();

        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = pddao.getAllProductDetails();

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();

        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerProductListPage";
        
        ArrayList<Product> copyProductList = new ArrayList<>();
        
        for (Product product : productList) {
            boolean checkBrand = false;
            boolean checkRoom = false;
            boolean checkCategory = false;
            boolean checkColor = false;
            for (Brand brand : brandList) {
                if (product.getBrand_id() == brand.getId()) {
                    checkBrand = true;
                    break;
                }
            }
            for (Room room : roomList) {
                if (product.getRoom_id() == room.getId()) {
                    checkRoom = true;
                    break;
                }
            }
            for (Category category : categoryList) {
                if (product.getCategory_id() == category.getId()) {
                    checkCategory = true;
                    break;
                }
            }
            for (Color color : colorList) {
                for (ProductDetail productDetail : productDetailList) {
                    if(productDetail.getProduct_id() == product.getId() && productDetail.getColor_id() == color.getId()){
                        checkColor = true;
                        break;
                    }
                }
            }

            if (checkBrand == true && checkRoom == true && checkCategory == true && checkColor == true) {
                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId() && saleOff.getSaleoffvalue() != 0) {
                        product.setSaleOff(saleOff.getSaleoffvalue());
                        product.setSalePrice(product.getPrice() - (product.getPrice() * product.getSaleOff() / 100));
                        break;
                    }
                }

                int reviewCount = 0;
                for (Feedback feedback : feedbackList) {
                    if (feedback.getProduct_id() == product.getId()) {
                        reviewCount++;
                    }
                }
                product.setNumberFeedback(reviewCount);

                int quantitySold = 0;
                for (OrderDetail orderDetail : orderDetailList) {
                    for (ProductDetail productDetail : productDetailList) {
                        if (orderDetail.getProductdetail_id() == productDetail.getId() && productDetail.getProduct_id() == product.getId()) {
                            quantitySold += orderDetail.getQuantity();
                        }
                    }
                }
                product.setQuantitySold(quantitySold);
                ArrayList<Color> newColorList = new ArrayList<>();
                for (ProductDetail productDetail : productDetailList) {
                    if (product.getId() == productDetail.getProduct_id()) {
                        for (Color color : colorList) {
                            if (productDetail.getColor_id() == color.getId()) {
                                newColorList.add(color);
                            }
                        }
                    }
                }
                product.setColorList(newColorList);
                copyProductList.add(product);
            }
        }
        copyProductList = paginationHelper.PaginationList(request, copyProductList, context, itemsPerPage);
        return copyProductList;
    }

    private int[] pagePagination(HttpServletRequest request, ArrayList<Product> productList) {
        ServletContext context = request.getServletContext();
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        String itemsPerPage = "itemsPerProductListPage";
        int pageSize = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, itemsPerPage);

        PaginationHelper paginationHelper = new PaginationHelper(productList, pageSize);
        int numberOfPage = paginationHelper.getTotalPages();

        int[] pages = new int[numberOfPage];
        for (int i = 0; i < numberOfPage; i++) {
            pages[i] = i + 1;
        }
        return pages;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductListByMarketing();
        
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        
        if ("search".equals(action)) {
            productList = searchProduct(request, productList);
        }
        session.setAttribute("productList", productList);
        productList = ProductDisplay(request, productList);
        request.setAttribute("productList", productList);

        processRequest(request, response);
        request.getRequestDispatcher("Views/ProductListMKT.jsp").forward(request, response);
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
        ProductDAO productDAO = new ProductDAO();
        HttpSession session = request.getSession();
        ArrayList<Product> productList = productDAO.getProductListByMarketing();
        if ("sort".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");
            productList = sortProduct(request, productList);
            productList = ProductDisplay(request, productList);
            Gson gson = new GsonBuilder().create();
            String jsonProductList = gson.toJson(productList);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonProductList);
        } else if ("filter".equals(action)) {
            productList = filterProduct(request);
            session.setAttribute("productList", productList);
            productList = ProductDisplay(request, productList);
            Gson gson = new GsonBuilder().create();
            String jsonProductList = gson.toJson(productList);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonProductList);

        } else if ("pagination".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");
            productList = ProductDisplay(request, productList);

            Gson gson = new GsonBuilder().create();
            String jsonProductList = gson.toJson(productList);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonProductList);
        } else if ("reloadPagination".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");
            int[] page = pagePagination(request, productList);
            Gson gson = new GsonBuilder().create();
            String jsonProductList = gson.toJson(page);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonProductList);
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
