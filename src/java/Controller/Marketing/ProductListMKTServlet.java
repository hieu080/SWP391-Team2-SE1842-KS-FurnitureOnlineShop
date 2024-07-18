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
import Helper.FileUploadHelper;
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
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author HELLO
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)

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

    private ArrayList<Product> filterProduct(HttpServletRequest request, ArrayList<Product> productList) {
        ProductDAO productDAO = new ProductDAO();
        String[] brandIDStr = request.getParameterValues("brand-filter");
        String[] roomSIDtr = request.getParameterValues("room-filter");
        String[] categoryIDStr = request.getParameterValues("category-filter");
        String[] priceIDStr = request.getParameterValues("price-filter");
        String[] statusIDStr = request.getParameterValues("status-filter");

        List<Integer> selectedBrandList = brandIDStr != null ? Arrays.stream(brandIDStr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<Integer> selectedRoomList = roomSIDtr != null ? Arrays.stream(roomSIDtr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<Integer> selectedCategoryList = categoryIDStr != null ? Arrays.stream(categoryIDStr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<String> selectedPriceList = priceIDStr != null ? Arrays.asList(priceIDStr) : null;
        List<String> selectedStatusList = statusIDStr != null ? Arrays.asList(statusIDStr) : null;

        // Đặt các thuộc tính này vào request scope
        request.setAttribute("selectedBrandList", selectedBrandList);
        request.setAttribute("selectedRoomList", selectedRoomList);
        request.setAttribute("selectedCategoryList", selectedCategoryList);
        request.setAttribute("selectedPriceList", selectedPriceList);
        request.setAttribute("selectedColorList", selectedStatusList);

        productList = productDAO.filterProductListMKT(brandIDStr, roomSIDtr, categoryIDStr, statusIDStr, priceIDStr);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
    }

    private String listProduct(HttpServletRequest request, ArrayList<Product> productList) {
        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();

        BrandDAO brandDao = new BrandDAO();
        ArrayList<Brand> brandList = brandDao.getBrandList();

        RoomDAO roomDAO = new RoomDAO();
        ArrayList<Room> roomList = roomDAO.getRoomList();
        request.setAttribute("roomList", roomList);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();

        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList = pddao.getAllProductDetails();

        AttachedImageDAO attachedImageDAO = new AttachedImageDAO();
        ArrayList<AttachedImage> attachedImageList = attachedImageDAO.getAllAttachedImages();

        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerProductListPage";
        productList = paginationHelper.PaginationList(request, productList, context, itemsPerPage);

        StringBuilder htmlResponse = new StringBuilder();
        if (productList.isEmpty()) {
            htmlResponse.append("");
        } else {

        }
        for (Product product : productList) {
            htmlResponse.append("<tr>");
            htmlResponse.append("<td>");
            htmlResponse.append("<div>");
            htmlResponse.append("<p class=\"text-sm\">").append(product.getId()).append("</p>");
            htmlResponse.append("</div>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<div class=\"image\">");
            htmlResponse.append("<img src=\"image/product/").append(product.getImage()).append("\" alt=\"").append(product.getName()).append("\" />");
            htmlResponse.append("</div>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<div class=\"text-sm\">");
            htmlResponse.append("<p class=\"text-sm\">").append(product.getName()).append("</p>");
            htmlResponse.append("</div>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">");
            for (Category category : categoryList) {
                if (product.getCategory_id() == category.getId()) {
                    htmlResponse.append(category.getCategory());
                    break;
                }
            }
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">");
            for (Brand brand : brandList) {
                if (product.getBrand_id() == brand.getId()) {
                    htmlResponse.append(brand.getBrandname());
                    break;
                }
            }
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">");
            for (Room room : roomList) {
                if (product.getRoom_id() == room.getId()) {
                    htmlResponse.append(room.getRoomname());
                    break;
                }
            }
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">");
            double discountedPrice = product.getPrice();
            boolean hasSaleOff = false;

            for (SaleOff saleOff : saleOffList) {
                if (product.getId() == saleOff.getProduct_id() && saleOff.getSaleoffvalue() > 0) {
                    hasSaleOff = true;
                    discountedPrice = product.getPrice() - (saleOff.getSaleoffvalue() * product.getPrice() / 100);
                    htmlResponse.append("<span class=\"text-danger\">").append(discountedPrice).append(" VND</span>");
                    htmlResponse.append("<del>").append(product.getPrice()).append(" VND</del>");
                    break;
                }
            }

            if (!hasSaleOff) {
                htmlResponse.append("<span>").append(product.getPrice()).append(" VND</span>");
            }
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm text-danger\">");
            for (SaleOff saleOff : saleOffList) {
                if (product.getId() == saleOff.getProduct_id()) {
                    htmlResponse.append("<span class=\"text-sm\">-</span>");
                    htmlResponse.append("<span class=\"text-sm\">").append(saleOff.getSaleoffvalue()).append("</span>");
                    htmlResponse.append("<span class=\"text-sm\">%</span>");
                    break;
                }
            }
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">").append(product.getQuantity()).append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td>");
            htmlResponse.append("<p class=\"text-sm\">").append(product.getStatus()).append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("<td class=\"actions\">");
            htmlResponse.append("<p>");
            htmlResponse.append("<a href=\"ManageProductServlet?productID=").append(product.getId()).append("\" title=\"View\"\"><i class=\"fas fa-eye\"></i></a>");
            htmlResponse.append("</p>");
            htmlResponse.append("</td>");
            htmlResponse.append("</tr>");
        }

        return htmlResponse.toString();
    }

    private String pagePagination(HttpServletRequest request, ArrayList<Product> productList) {
        ServletContext context = request.getServletContext();
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        String itemsPerPage = "itemsPerProductListPage";
        int pageSize = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, itemsPerPage);

        PaginationHelper paginationHelper = new PaginationHelper(productList, pageSize);
        int numberOfPage = paginationHelper.getTotalPages();
        StringBuilder pagePaginationHtml = new StringBuilder();

        for (int i = 1; i <= numberOfPage; i++) {
            pagePaginationHtml.append("<input type=\"radio\" name=\"page\" id=\"page")
                    .append(i)
                    .append("\" value=\"")
                    .append(i)
                    .append("\" style=\"display: none;\">")
                    .append("<label for=\"page")
                    .append(i)
                    .append("\" style=\"width: 25px; border: groove;\" class=\"page-node\" aria-label=\"Trang ")
                    .append(i)
                    .append("\" onclick=\"submitFormWithPage(")
                    .append(i)
                    .append(")\">")
                    .append(i)
                    .append("</label>");
        }
        pagePaginationHtml.append("<span class=\"page-node\">&hellip;</span>");

        return pagePaginationHtml.toString();
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
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            productList = searchProduct(request, productList);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        request.setAttribute("productList", productList);
        
        String htmlResponse = listProduct(request, productList);
        request.setAttribute("htmlResponse", htmlResponse);

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
        ArrayList<Product> productList = productDAO.getProductList();

        if ("sort".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");

            productList = sortProduct(request, productList);
            String htmlResponse = listProduct(request, productList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);

        } else if ("filter".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");
            productList = filterProduct(request, productList);

            String htmlResponse = listProduct(request, productList);
            String pagePagination = pagePagination(request, productList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse + "|" + pagePagination);

        } else if ("pagination".equals(action)) {
            productList = (ArrayList<Product>) session.getAttribute("productList");

            String htmlResponse = listProduct(request, productList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(htmlResponse);
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
