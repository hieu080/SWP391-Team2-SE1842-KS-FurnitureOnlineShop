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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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

    private ArrayList<Product> ProductDisplay(HttpServletRequest request, ArrayList<Product> productList) {
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

        for (Product product : productList) {
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
        }
        return productList;
    }
    
    public String formatCurrency(double number) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.getDefault());
        symbols.setGroupingSeparator(',');
        symbols.setMonetaryDecimalSeparator('.');
        DecimalFormat decimalFormat = new DecimalFormat("#,##0", symbols);
        return decimalFormat.format(number) + "₫";
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
                            priceHtml = "<span class=\"sale-price\" style=\"color: red\">" + formatCurrency(discountedPrice) + "</span><del>" + formatCurrency(product.getPrice()) + "</del>";
                        } else {
                            // Nếu có sale nhưng giá trị sale = 0
                            priceHtml = formatCurrency(product.getPrice());
                        }
                        break; // Thoát vòng lặp khi tìm thấy sale cho sản phẩm
                    }
                }

                // Nếu không có sale cho sản phẩm
                if (!hasSale) {
                    priceHtml = formatCurrency(product.getPrice());
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
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        ProductDAO productDAO = new ProductDAO();
//        ArrayList<Product> productList = productDAO.getProductList();
//        String search = request.getParameter("search");
//        productList = searchProduct(request, productList);
//        request.setAttribute("numberResult", productList.size());
//        
//        PaginationHelper paginationHelper = new PaginationHelper();
//        ServletContext context = getServletContext();
//        String itemsPerPage = "itemsPerProductListPage";
//        productList = paginationHelper.PaginationList(request, productList, context, itemsPerPage);
//
//        request.setAttribute("productList", productList);
//        
//        request.setAttribute("keySearch", search);
//        processRequest(request, response);
//        request.getRequestDispatcher("Views/ProductSearch.jsp").forward(request, response);
//    }

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        
        String search = request.getParameter("search");
        productList = searchProduct(request, productList);
        
        request.setAttribute("numberResult", productList.size());
        session.setAttribute("productList", productList);
        productList = ProductDisplay(request, productList);

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
            productList = ProductDisplay(request, productList);
            
            Gson gson = new GsonBuilder().create();
            String jsonProductList = gson.toJson(productList);

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
