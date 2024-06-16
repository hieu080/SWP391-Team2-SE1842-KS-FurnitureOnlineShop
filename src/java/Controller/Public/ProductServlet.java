/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.CategoryOfPostDAO;
import DAL.ColorDAO;
import DAL.FeedbackDAO;
import DAL.OrderDetailDAO;
import DAL.PageDAO;
import DAL.PostDAO;
import DAL.ProductDAO;
import DAL.ProductDetailDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import Helper.ComparatorHelper;
import Helper.ConfigReaderHelper;
import Helper.PaginationHelper;
import Models.Brand;
import Models.Category;
import Models.CategoryOfPost;
import Models.Color;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Post;
import Models.Product;
import Models.ProductDetail;
import Models.Room;
import Models.SaleOff;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author HELLO
 */
public class ProductServlet extends HttpServlet {

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

        PageDAO pageDAO = new PageDAO();
        ArrayList<Page> pageList = pageDAO.getPageList();
        request.setAttribute("pageList", pageList);

        CategoryOfPostDAO categoryOfPostDAO = new CategoryOfPostDAO();
        List<CategoryOfPost> categoryOfPost = categoryOfPostDAO.getCategoryOfPostList();
        request.setAttribute("categoryOfPostList", categoryOfPost);

        PostDAO postDAO = new PostDAO();
        ArrayList<Post> postList = postDAO.getPostList();
        request.setAttribute("postList", postList);

        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();
        request.setAttribute("saleOffList", saleOffList);

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ArrayList<Feedback> feedbackList = feedbackDAO.getFeedbackList();
        request.setAttribute("feedbackList", feedbackList);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ArrayList<OrderDetail> orderDetailList = orderDetailDAO.getOrderDetailsList();
        request.setAttribute("orderDetailList", orderDetailList);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryList();
        request.setAttribute("categoryList", categoryList);

        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorList();
        request.setAttribute("colorList", colorList);

        ProductDetailDAO pddao = new ProductDetailDAO();
        ArrayList<ProductDetail> productDetailList= pddao.getAllProductDetails();
        request.setAttribute("productDetailList", productDetailList);
        
        request.getRequestDispatcher("Views/ProductList.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        String clearfilter = request.getParameter("clearfilter");
        String reload = request.getParameter("reload");

        if ((clearfilter != null && !clearfilter.isEmpty()) || (reload != null && !reload.isEmpty())) {
            session.removeAttribute("productList");
        }

        ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");

        if (productList == null) {
            ProductDAO productDAO = new ProductDAO();
            productList = productDAO.getProductList();
        }

        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        if (sortby != null && !sortby.isEmpty()) {
            productList = comparatorHelper.sortProductList(productList, sortby);
            session.setAttribute("productList", productList);
        }

        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerProductListPage";
        String attribute = "productList";
        paginationHelper.Pagination(request, productList, context, itemsPerPage, attribute);
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
        String search = request.getParameter("search");
        String[] brandIDStr = request.getParameterValues("brand-filter");
        String[] roomSIDtr = request.getParameterValues("room-filter");
        String[] categoryIDStr = request.getParameterValues("category-filter");
        String[] priceIDStr = request.getParameterValues("price-filter");
        String[] colorIDStr = request.getParameterValues("color-filter");
        
        List<Integer> selectedBrandList = brandIDStr != null ? Arrays.stream(brandIDStr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<Integer> selectedRoomList = roomSIDtr != null ? Arrays.stream(roomSIDtr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<Integer> selectedCategoryList = categoryIDStr != null ? Arrays.stream(categoryIDStr).map(Integer::parseInt).collect(Collectors.toList()) : null;
        List<String> selectedPriceList = priceIDStr != null ? Arrays.asList(priceIDStr) : null;
        List<Integer> selectedColorList = colorIDStr != null ? Arrays.stream(colorIDStr).map(Integer::parseInt).collect(Collectors.toList()) : null;

        // Đặt các thuộc tính này vào request scope
        request.setAttribute("selectedBrandList", selectedBrandList);
        request.setAttribute("selectedRoomList", selectedRoomList);
        request.setAttribute("selectedCategoryList", selectedCategoryList);
        request.setAttribute("selectedPriceList", selectedPriceList);
        request.setAttribute("selectedColorList", selectedColorList);
        
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList;

        if (search != null && !search.isEmpty()) {
            productList = productDAO.searchProductByName(search);
        } else {
            productList = productDAO.filterProductList(brandIDStr, roomSIDtr, categoryIDStr, colorIDStr, priceIDStr);
        }

        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        request.setAttribute("productList", productList);
        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerProductListPage";
        String attribute = "productList";
        paginationHelper.Pagination(request, productList, context, itemsPerPage, attribute);
        processRequest(request, response);
        
    }
}
