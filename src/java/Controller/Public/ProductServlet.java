/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Controller.Customer.CartDetail;
import DAL.BrandDAO;
import DAL.CartItemDAO;
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
import Models.CartItemWithDetail;
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
import Models.User;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.PrintWriter;

/**
 *
 * @author HELLO
 */
public class ProductServlet extends HttpServlet {

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
        ArrayList<ProductDetail> productDetailList = pddao.getAllProductDetails();
        request.setAttribute("productDetailList", productDetailList);

        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("customer");
            if (user != null) {

                CartItemDAO cartItemDAO = new CartItemDAO();
                try {
                    request.setAttribute("countcart", cartItemDAO.countCartItemsByCustomerId(user.getId()));
                } catch (SQLException ex) {
                    Logger.getLogger(HomePage.class.getName()).log(Level.SEVERE, null, ex);
                }
                List<CartItemWithDetail> cartItemWithDetails = new ArrayList<>();
                try {
                    cartItemWithDetails = cartItemDAO.getCartItemsDetail(user.getId());
                } catch (SQLException ex) {
                    Logger.getLogger(HomePage.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("listcartdetail", cartItemWithDetails);
                double sumtotalprice = 0;
                try {
                    sumtotalprice = cartItemDAO.getTotalCostNoStatus(user.getId());
                } catch (SQLException ex) {
                    Logger.getLogger(CartDetail.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("sumtotalprice", sumtotalprice);
            }
        }
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

    private ArrayList<Product> sortProduct(HttpServletRequest request, ArrayList<Product> productList) {
        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        productList = comparatorHelper.sortProductList(productList, sortby);
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
        String[] colorIDStr = request.getParameterValues("color-filter");

        ArrayList<Product> productList = productDAO.filterProductList(brandIDStr, roomSIDtr, categoryIDStr, colorIDStr, priceIDStr);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        if ("showCategory".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("id"));
            productList = productDAO.getProductListByCategoryID(categoryId);
        } else if ("showBrand".equals(action)) {
            int brandId = Integer.parseInt(request.getParameter("id"));
            productList = productDAO.getProductListByBrandID(brandId);
        } else if ("showRoom".equals(action)) {
            int roomId = Integer.parseInt(request.getParameter("id"));
            productList = productDAO.getProductListByRoomID(roomId);
        }
        session.setAttribute("productList", productList);
        productList = ProductDisplay(request, productList);

        request.setAttribute("productList", productList);
        processRequest(request, response);

        request.getRequestDispatcher("Views/ProductList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO productDAO = new ProductDAO();
        HttpSession session = request.getSession();
        ArrayList<Product> productList = new ArrayList<>();
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
}
