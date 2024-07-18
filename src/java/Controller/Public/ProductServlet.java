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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

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

    private ArrayList<Product> sortProduct(HttpServletRequest request, ArrayList<Product> productList) {
        String sortby = request.getParameter("sortby");
        ComparatorHelper comparatorHelper = new ComparatorHelper();
        productList = comparatorHelper.sortProductList(productList, sortby);
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

        productList = productDAO.filterProductList(brandIDStr, roomSIDtr, categoryIDStr, colorIDStr, priceIDStr);
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        return productList;
    }

    private String listProduct(HttpServletRequest request, ArrayList<Product> productList) {
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
        productList = paginationHelper.PaginationList(request, productList, context, itemsPerPage);

        StringBuilder htmlResponse = new StringBuilder();

        if (productList.isEmpty()) {
            htmlResponse.append("<div class=\"no-products\">\n")
                    .append("    <p>Không tìm thấy sản phẩm phù hợp.</p>\n")
                    .append("</div>\n");
        } else {
            for (Product product : productList) {
                htmlResponse.append("<div class=\"col-md-3 col-sm-6 col-xs-6 pro-loop col-4\">\n")
                        .append("<div class=\"product-block product-resize site-animation single-product\">\n")
                        .append("<div class=\"product-img fade-box\">\n");

                boolean hasSale = false;
                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId() && saleOff.getSaleoffvalue() != 0) {
                        htmlResponse.append("<div class=\"product-sale\"><span>-")
                                .append(saleOff.getSaleoffvalue())
                                .append("%</span></div>\n");
                        hasSale = true;
                        break;
                    }
                }
                if (!hasSale) {
                    htmlResponse.append("<div></div>\n");
                }

                htmlResponse.append("<div class=\"tag-loop\">\n")
                        .append("<div class=\"icon icon_hot\">\n")
                        .append("<img loading=\"lazy\" decoding=\"async\"\n")
                        .append("    src=\"//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582\"\n")
                        .append("    alt=\"icon hot\"/>\n")
                        .append("</div>\n")
                        .append("</div>\n")
                        .append("<a href=\"ProductDetailServlet?productId=")
                        .append(product.getId())
                        .append("\"\n")
                        .append("title=\"")
                        .append(product.getName())
                        .append("\" class=\"image-resize\">\n")
                        .append("<picture class=\"loop-one-img \">\n")
                        .append("<img loading=\"lazy\" decoding=\"async\" width=\"480\"\n")
                        .append("    height=\"480\" class=\"img-loop\"\n")
                        .append("    alt=\"")
                        .append(product.getName())
                        .append("\"\n")
                        .append("    src=\"image/product/")
                        .append(product.getImage())
                        .append("\" />\n")
                        .append("</picture>\n")
                        .append("</a>\n")
                        .append("</div>\n") // Closing product-img fade-box div
                        .append("<div class=\"product-detail clearfix\">\n")
                        .append("<div class=\"box-pro-detail\">\n")
                        .append("<h3 class=\"pro-name\">\n")
                        .append("<a href=\"#\" title=\"")
                        .append(product.getName())
                        .append("\">\n")
                        .append(product.getName())
                        .append("\n")
                        .append("</a>\n")
                        .append("</h3>\n")
                        .append("<div class=\"box-pro-prices\">\n")
                        .append("<p class=\"pro-price highlight\">\n");

                hasSale = false;
                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId()) {
                        hasSale = true;
                        if (saleOff.getSaleoffvalue() == 0) {
                            htmlResponse.append("<span style=\"color: black\">")
                                    .append(product.getPrice())
                                    .append("₫</span>\n");
                        } else {
                            htmlResponse.append("<span>")
                                    .append(product.getPrice() - product.getPrice() * saleOff.getSaleoffvalue() / 100)
                                    .append("₫</span>\n")
                                    .append("<span class=\"pro-price-del\">\n")
                                    .append("<del class=\"compare-price\">")
                                    .append(product.getPrice())
                                    .append("₫</del>\n")
                                    .append("</span>\n");
                        }
                        break;
                    }
                }
                if (!hasSale) {
                    htmlResponse.append("<span style=\"color: black\">")
                            .append(product.getPrice())
                            .append("₫</span>\n");
                }

                htmlResponse.append("</p>\n")
                        .append("</div>\n") // Closing box-pro-prices div
                        .append("<div class=\"row\">\n")
                        .append("<div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review\">\n");

                int reviewCount = 0;
                for (Feedback feedback : feedbackList) {
                    if (feedback.getProduct_id() == product.getId()) {
                        reviewCount++;
                    }
                }

                htmlResponse.append("<div class=\"rating-container\" data-rating=\"")
                        .append(product.getStaravg())
                        .append("\" data-num-reviews=\"")
                        .append(reviewCount)
                        .append("\">\n")
                        .append("<div class=\"rating\"></div>\n")
                        .append("<span class=\"num-reviews\"></span>\n")
                        .append("</div>\n")
                        .append("<div>Số lượng: ")
                        .append(product.getQuantity())
                        .append("</div>\n")
                        .append("</div>\n") // Closing custom_review div
                        .append("<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty\">\n");

                int quantitySold = 0;
                for (OrderDetail orderDetail : orderDetailList) {
                    for (ProductDetail productDetail : productDetailList) {
                        if (orderDetail.getProductdetail_id() == productDetail.getId() && productDetail.getProduct_id() == product.getId()) {
                            quantitySold += orderDetail.getQuantity();
                        }
                    }
                }

                htmlResponse.append("<div class=\"cmpText\">Đã bán ")
                        .append(quantitySold)
                        .append("</div>\n")
                        .append("<span>\n");

                for (ProductDetail productDetail : productDetailList) {
                    if (product.getId() == productDetail.getProduct_id()) {
                        for (Color color : colorList) {
                            if (productDetail.getColor_id() == color.getId()) {
                                htmlResponse.append("<label class=\"color-checkbox\">\n")
                                        .append("<input type=\"checkbox\" name=\"color\" value=\"")
                                        .append(color.getId())
                                        .append("\" style=\"display: none;\">\n")
                                        .append("<span class=\"color-circle\" style=\"background-color:")
                                        .append(color.getColorcode())
                                        .append(";\"></span>\n")
                                        .append("</label>\n");
                            }
                        }
                    }
                }

                htmlResponse.append("</span>\n")
                        .append("</div>\n") // Closing custom_sold_qty div
                        .append("</div>\n") // Closing row div
                        .append("</div>\n") // Closing box-pro-detail div
                        .append("</div>\n") // Closing product-detail clearfix div
                        .append("</div>\n") // Closing product-block product-resize site-animation single-product div
                        .append("</div>\n");  // Closing col-md-3 col-sm-6 col-xs-6 pro-loop col-4 div
            }
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
                    .append("\">")
                    .append(i)
                    .append("</label>");
        }
        pagePaginationHtml.append("<span class=\"page-node\">&hellip;</span>");

        return pagePaginationHtml.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        String htmlResponse = listProduct(request, productList);
        request.setAttribute("htmlResponse", htmlResponse);
        processRequest(request, response);
        request.getRequestDispatcher("Views/ProductList.jsp").forward(request, response);
    }

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
        processRequest(request, response);
    }
}
