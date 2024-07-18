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
import java.io.PrintWriter;
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

/**
 *
 * @author HELLO
 */
public class ProductSearchServlet extends HttpServlet {

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

    private ArrayList<Product> searchProduct(HttpServletRequest request, ArrayList<Product> productList) {
        ProductDAO productDAO = new ProductDAO();
        String search = request.getParameter("search");
        productList = productDAO.searchProductByName(search);
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
        String htmlResponse = "";
        if (productList.isEmpty()) {
            htmlResponse = "<div class=\"no-products\">\n"
                    + "            <p>Không tìm thấy sản phẩm phù hợp.</p>\n"
                    + "        </div>\n";
        } else {
            for (Product product : productList) {
                htmlResponse += "<div class=\"col-md-3 col-sm-6 col-xs-6 pro-loop col-4\">\n";
                htmlResponse += "<div class=\"product-block product-resize site-animation single-product\">\n";
                htmlResponse += "<div class=\"product-img fade-box\">\n";
                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId() && saleOff.getSaleoffvalue() != 0) {
                        htmlResponse += "<div class=\"product-sale\"><span>-" + saleOff.getSaleoffvalue() + "%</span></div>\n";
                    } else {
                        htmlResponse += "<div></div>\n";
                    }
                }
                htmlResponse += "<div class=\"tag-loop\">\n";
                htmlResponse += "<div class=\"icon icon_hot\">\n";
                htmlResponse += "<img loading=\"lazy\" decoding=\"async\"\n"
                        + "              src=\"//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582\"\n"
                        + "              alt=\"icon hot\"/>\n";
                htmlResponse += "</div>\n";
                htmlResponse += "</div>\n";
                htmlResponse += "<a href=\"ProductDetailServlet?productId=" + product.getId() + "\"\n";
                htmlResponse += "title=\"" + product.getName() + "\" class=\"image-resize\">\n";
                htmlResponse += "                            <picture class=\"loop-one-img \">\n"
                        + "                                <img loading=\"lazy\" decoding=\"async\" width=\"480\"\n"
                        + "                                     height=\"480\" class=\"img-loop\"\n"
                        + "                                     alt=\"" + product.getName() + "\"\n"
                        + "                                     src=\"image/product/" + product.getImage() + "\" />\n"
                        + "                            </picture>\n";
                htmlResponse += "</a>\n";
                htmlResponse += "</div>\n";  // Closing product-img fade-box div

                htmlResponse += "<div class=\"product-detail clearfix\">\n";
                htmlResponse += "<div class=\"box-pro-detail\">\n";
                htmlResponse += "<h3 class=\"pro-name\">\n";
                htmlResponse += "<a href=\"#\" title=\"" + product.getName() + "\">\n";
                htmlResponse += product.getName() + "\n";
                htmlResponse += "</a>\n";
                htmlResponse += "</h3>\n";
                htmlResponse += "<div class=\"box-pro-prices\">\n";
                htmlResponse += "<p class=\"pro-price highlight\">\n";
                boolean hasSale = false;
                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId()) {
                        hasSale = true;
                        if (saleOff.getSaleoffvalue() == 0) {
                            htmlResponse += "<span style=\"color: black\">" + product.getPrice() + "₫</span>\n";
                        } else {
                            htmlResponse += "<span>" + (product.getPrice() - product.getPrice() * saleOff.getSaleoffvalue() / 100) + "₫</span>\n";
                            htmlResponse += "<span class=\"pro-price-del\">\n";
                            htmlResponse += "<del class=\"compare-price\">" + product.getPrice() + "₫</del>\n";
                            htmlResponse += "</span>\n";
                        }
                    }
                }
                if (!hasSale) {
                    htmlResponse += "<span style=\"color: black\">" + product.getPrice() + "₫</span>\n";
                }
                htmlResponse += "</p>\n";
                htmlResponse += "</div>\n";  // Closing box-pro-prices div

                htmlResponse += "<div class=\"row\">\n";
                htmlResponse += "<div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review\">\n";
                int reviewCount = 0;
                for (Feedback feedback : feedbackList) {
                    if (feedback.getProduct_id() == product.getId()) {
                        reviewCount++;
                    }
                }
                htmlResponse += "<div class=\"rating-container\" data-rating=\"" + product.getStaravg() + "\" data-num-reviews=\"" + reviewCount + "\">\n";
                htmlResponse += "<div class=\"rating\"></div>\n";
                htmlResponse += "<span class=\"num-reviews\"></span>\n";
                htmlResponse += "</div>\n";
                htmlResponse += "<div>Số lượng: " + product.getQuantity() + "</div>\n";
                htmlResponse += "</div>\n";  // Closing custom_review div

                int quantitySold = 0;
                for (OrderDetail orderDetail : orderDetailList) {
                    for (ProductDetail productDetail : productDetailList) {
                        if (orderDetail.getProductdetail_id() == productDetail.getId() && productDetail.getProduct_id() == product.getId()) {
                            quantitySold += orderDetail.getQuantity();
                        }
                    }
                }
                htmlResponse += "<div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty\">\n";
                htmlResponse += "<div class=\"cmpText\">Đã bán " + quantitySold + "</div>\n";
                htmlResponse += "<span>\n";
                for (ProductDetail productDetail : productDetailList) {
                    if (product.getId() == productDetail.getProduct_id()) {
                        for (Color color : colorList) {
                            if (productDetail.getColor_id() == color.getId()) {
                                htmlResponse += "<label class=\"color-checkbox\">\n";
                                htmlResponse += "<input type=\"checkbox\" name=\"color\" value=\"" + color.getId() + "\" style=\"display: none;\">\n";
                                htmlResponse += "<span class=\"color-circle\" style=\"background-color:" + color.getColorcode() + ";\"></span>\n";
                                htmlResponse += "</label>\n";
                            }
                        }
                    }
                }
                htmlResponse += "</span>\n";
                htmlResponse += "</div>\n";  // Closing custom_sold_qty div
                htmlResponse += "</div>\n";  // Closing row div
                htmlResponse += "</div>\n";  // Closing box-pro-detail div
                htmlResponse += "</div>\n";  // Closing product-detail clearfix div
                htmlResponse += "</div>\n";  // Closing product-block product-resize site-animation single-product div
                htmlResponse += "</div>\n";  // Closing col-md-3 col-sm-6 col-xs-6 pro-loop col-4 div
            }
        }
        return htmlResponse;
    }

    private String listResult(HttpServletRequest request, ArrayList<Product> productList) {
        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffList();

        StringBuilder resultResponse = new StringBuilder();

        if (productList.isEmpty()) {
            resultResponse.append("<p class=\"dataEmpty\">\n")
                    .append("    Không có sản phẩm nào...\n")
                    .append("</p>");
        } else {
            int count = 0;
            for (Product product : productList) {
                boolean hasSale = false;
                String priceHtml = "";

                for (SaleOff saleOff : saleOffList) {
                    if (saleOff.getProduct_id() == product.getId()) {
                        hasSale = true;
                        if (saleOff.getSaleoffvalue() > 0) {
                            // Nếu có sale và giá trị sale lớn hơn 0
                            int discountedPrice = (int) (product.getPrice() - (product.getPrice() * saleOff.getSaleoffvalue() / 100));
                            priceHtml = "<span class=\"sale-price\">" + discountedPrice + "₫</span><del>" + product.getPrice() + "₫</del>";
                        } else {
                            // Nếu có sale nhưng giá trị sale = 0
                            priceHtml = product.getPrice() + "₫";
                        }
                        break; // Thoát vòng lặp khi tìm thấy sale cho sản phẩm
                    }
                }

                // Nếu không có sale cho sản phẩm
                if (!hasSale) {
                    priceHtml = product.getPrice() + "₫";
                }

                // Tạo HTML cho sản phẩm
                resultResponse.append("<div class=\"item-ult\">")
                        .append("<div class=\"thumbs\">")
                        .append("<a href=\"ProductDetailServlet?productId=").append(product.getId()).append("\" title=\"").append(product.getName()).append("\">")
                        .append("<img alt=\"").append(product.getName()).append("\" src=\"image/product/").append(product.getImage()).append("\">")
                        .append("</a>")
                        .append("</div>")
                        .append("<div class=\"title\">")
                        .append("<a title=\"").append(product.getName()).append("\" href=\"ProductDetailServlet?productId=").append(product.getId()).append("\">").append(product.getName()).append("</a>")
                        .append("<p class=\"f-initial\">").append(priceHtml).append("</p>")
                        .append("</div>")
                        .append("</div>");

                count++;
                if (count == 5) {
                    break;
                }
            }

            if (productList.size() > 5) {
                int remainingProducts = productList.size() - 5;
                resultResponse.append("<div class=\"resultsMore\" style=\"text-align: center\">Xem thêm ").append(remainingProducts).append(" sản phẩm</div>");
            }
        }

        return resultResponse.toString();
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
        String search = request.getParameter("search");
        productList = searchProduct(request, productList);
        request.setAttribute("numberResult", productList.size());
        
        PaginationHelper paginationHelper = new PaginationHelper();
        ServletContext context = getServletContext();
        String itemsPerPage = "itemsPerProductListPage";
        productList = paginationHelper.PaginationList(request, productList, context, itemsPerPage);

        request.setAttribute("productList", productList);
        
        request.setAttribute("keySearch", search);
        processRequest(request, response);
        request.getRequestDispatcher("Views/ProductSearch.jsp").forward(request, response);
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
        ArrayList<Product> productList = productDAO.getProductList();
        if ("search".equals(action)) {
            productList = searchProduct(request, productList);
            String resultResponse = listResult(request, productList);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print(resultResponse);
        } else if ("pagination".equals(action)) {
            HttpSession session = request.getSession();
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
