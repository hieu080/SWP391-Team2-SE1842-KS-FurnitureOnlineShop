/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.CategoryOfPostDAO;
import DAL.ColorDAO;
import DAL.ProductDAO;
import DAL.RoomDAO;
import DAL.SaleOffDAO;
import DAL.UserRoleDAO;
import Helper.ConfigReaderHelper;
import Models.Brand;
import Models.Category;
import Models.CategoryOfPost;
import Models.Color;
import Models.Product;
import Models.Room;
import Models.SaleOff;
import Models.UserRole;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HELLO
 */
public class SettingServlet extends HttpServlet {

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
        ColorDAO colorDAO = new ColorDAO();
        ArrayList<Color> colorList = colorDAO.getColorListAll();
        request.setAttribute("colorList", colorList);

        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categoryList = categoryDAO.getCategoryListAll();
        request.setAttribute("categoryList", categoryList);

        SaleOffDAO saleOffDAO = new SaleOffDAO();
        ArrayList<SaleOff> saleOffList = saleOffDAO.getSaleOffListAll();
        request.setAttribute("saleOffList", saleOffList);

        CategoryOfPostDAO categoryOfPostDAO = new CategoryOfPostDAO();
        List<CategoryOfPost> categoryOfPost = categoryOfPostDAO.getCategoryOfPostListAll();
        request.setAttribute("categoryOfPostList", categoryOfPost);

        RoomDAO roomDAO = new RoomDAO();
        ArrayList<Room> roomList = roomDAO.getRoomListAll();
        request.setAttribute("roomList", roomList);

        BrandDAO brandDao = new BrandDAO();
        ArrayList<Brand> brandList = brandDao.getBrandListAll();
        request.setAttribute("brandList", brandList);

        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRoleList = userRoleDAO.getUserRoleListAll();
        request.setAttribute("userRoleList", userRoleList);

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productList = productDAO.getProductList();
        request.setAttribute("productList", productList);

        ServletContext context = request.getServletContext();
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");

        int itemsHomeProductsList = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerProductInHomePage");
        request.setAttribute("itemsHomeProductsList", itemsHomeProductsList);

        int itemsPerProductListPage = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerProductListPage");
        request.setAttribute("itemsPerProductListPage", itemsPerProductListPage);

        int itemsPerFeedbackListPage = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerFeedbackListPage");
        request.setAttribute("itemsPerFeedbackListPage", itemsPerFeedbackListPage);

        int itemsPerCustomerListPage = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerCustomerListPage");
        request.setAttribute("itemsPerCustomerListPage", itemsPerCustomerListPage);

        int itemsPerPostList = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerPostList");
        request.setAttribute("itemsPerPostList", itemsPerPostList);

        int itemsPerSliderPage = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerSliderPage");
        request.setAttribute("itemsPerSliderPage", itemsPerSliderPage);

        int itemsPerOrderList = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerOrderList");
        request.setAttribute("itemsPerOrderList", itemsPerOrderList);

        int itemsPerShoppingCartsListPage = configReaderHelper.getValueOfItemsPerPage(CONFIG_FILE_PATH, "itemsPerShoppingCartsListPage");
        request.setAttribute("itemsPerShoppingCartsListPage", itemsPerShoppingCartsListPage);
    }

    private void changeStatusUserRole(HttpServletRequest request) {
        int userRoleID = Integer.parseInt(request.getParameter("userRoleID"));
        String newStatus = request.getParameter("statusChange");
        new UserRoleDAO().changeStatus(userRoleID, newStatus);
    }

    private void changeStatusCategory(HttpServletRequest request) {
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String newStatus = request.getParameter("statusChange");
        new CategoryDAO().changeStatus(categoryID, newStatus);
    }

    private void changeStatusBrand(HttpServletRequest request) {
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String newStatus = request.getParameter("statusChange");
        new BrandDAO().changeStatus(brandID, newStatus);
    }

    private void changeStatusRoom(HttpServletRequest request) {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        String newStatus = request.getParameter("statusChange");
        new RoomDAO().changeStatus(roomID, newStatus);
    }

    private void changeStatusColor(HttpServletRequest request) {
        int colorID = Integer.parseInt(request.getParameter("colorID"));
        String newStatus = request.getParameter("statusChange");
        new ColorDAO().changeStatus(colorID, newStatus);
    }

    private void changeStatusSaleOff(HttpServletRequest request) {
        int saleOffID = Integer.parseInt(request.getParameter("saleOffID"));
        String newStatus = request.getParameter("statusChange");
        new SaleOffDAO().changeStatus(saleOffID, newStatus);
    }

    private void changeStatusCategoryOfPost(HttpServletRequest request) {
        int categoryOfPostID = Integer.parseInt(request.getParameter("categoryOfPostID"));
        String newStatus = request.getParameter("statusChange");
        new CategoryOfPostDAO().changeStatus(categoryOfPostID, newStatus);
    }

    private void changeItemsHomeProductsList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerHomeProductsList = Integer.parseInt(request.getParameter("itemsPerHomeProductsList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerProductInHomePage", itemsPerHomeProductsList);
    }

    private void changeItemsProductsList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerHomeProductsList = Integer.parseInt(request.getParameter("itemsPerProductsList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerProductListPage", itemsPerHomeProductsList);
    }

    private void changeItemsFeedbacksList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerFeedbackListPage = Integer.parseInt(request.getParameter("itemsPerFeedbacksList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerFeedbackListPage", itemsPerFeedbackListPage);
    }

    private void changeItemsCustomersList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerCustomerListPage = Integer.parseInt(request.getParameter("itemsPerCustomersList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerCustomerListPage", itemsPerCustomerListPage);
    }

    private void changeItemsPostsList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerPostList = Integer.parseInt(request.getParameter("itemsPerPostsList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerPostList", itemsPerPostList);
    }

    private void changeItemsSlidersList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerSliderPage = Integer.parseInt(request.getParameter("itemsPerSlidersList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerSliderPage", itemsPerSliderPage);
    }

    private void changeItemsOrdersList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerOrderList = Integer.parseInt(request.getParameter("itemsPerOrdersList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerOrderList", itemsPerOrderList);
    }

    private void changeItemsShoppingCartsList(HttpServletRequest request, ServletContext context) {
        ConfigReaderHelper configReaderHelper = new ConfigReaderHelper();
        String CONFIG_FILE_PATH = context.getRealPath("/");
        int itemsPerShoppingCartsListPage = Integer.parseInt(request.getParameter("itemsPerShoppingCartsList"));
        configReaderHelper.updateItemsPerPage(CONFIG_FILE_PATH, "itemsPerShoppingCartsListPage", itemsPerShoppingCartsListPage);
    }

    private void addNewUserRole(HttpServletRequest request) {
        String userRoleName = request.getParameter("userRoleName");
        UserRole u = new UserRole(userRoleName);
        new UserRoleDAO().addNewUserRole(u);
    }

    private void addNewCategory(HttpServletRequest request) {
        String categoryName = request.getParameter("categoryName");
        Category c = new Category(categoryName);
        new CategoryDAO().insertCategory(c);
    }

    private void addNewBrand(HttpServletRequest request) {
        String brandName = request.getParameter("brandName");
        Brand b = new Brand(brandName);
        new BrandDAO().insertBrand(b);
    }

    private void addNewRoom(HttpServletRequest request) {
        String roomName = request.getParameter("roomName");
        Room r = new Room(roomName);
        new RoomDAO().insertRoom(r);
    }

    private void addNewColor(HttpServletRequest request) {
        String colorName = request.getParameter("colorName");
        String colorCode = request.getParameter("colorCode");
        Color c = new Color(colorName, colorCode);
        new ColorDAO().insertColor(c);
    }

    private void addNewSaleOff(HttpServletRequest request) {
        int productID = Integer.parseInt(request.getParameter("productID"));
        int value = Integer.parseInt(request.getParameter("saleOfValue"));
        SaleOff s = new SaleOff(productID, value);
        new SaleOffDAO().insertSaleOff(s);
    }

    private void addNewCategoryOfPost(HttpServletRequest request) {
        String categoryOfPostName = request.getParameter("categoryOfPostName");
        CategoryOfPost cop = new CategoryOfPost(categoryOfPostName);
        new CategoryOfPostDAO().inserCOP(cop);
    }

    private void editCategory(HttpServletRequest request) {
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String categoryName = request.getParameter("categoryName");
        Category c = new Category();
        c.setCategory(categoryName);
        c.setId(categoryID);
        new CategoryDAO().updateCategory(c);
    }

    private void editBrand(HttpServletRequest request) {
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        String brandName = request.getParameter("brandName");
        Brand b = new Brand(brandName);
        b.setId(brandID);
        b.setBrandname(brandName);
        new BrandDAO().updateBrand(b);
    }

    private void editRoom(HttpServletRequest request) {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        String roomName = request.getParameter("roomName");
        Room r = new Room();
        r.setId(roomID);
        r.setRoomname(roomName);
        new RoomDAO().updateRoom(r);
    }

    private void editColor(HttpServletRequest request) {
        int colorID = Integer.parseInt(request.getParameter("colorID"));
        String colorName = request.getParameter("colorName");
        String colorCode = request.getParameter("colorCode");
        Color c = new Color();
        c.setId(colorID);
        c.setColorname(colorName);
        c.setColorcode(colorCode);
        new ColorDAO().updateColor(c);
    }

    private void editSaleOff(HttpServletRequest request) {
        int saleOffID = Integer.parseInt(request.getParameter("saleOffID"));
        int saleOffValue = Integer.parseInt(request.getParameter("saleOffValue"));
        SaleOff s = new SaleOff();
        s.setId(saleOffID);
        s.setSaleoffvalue(saleOffValue);
        new SaleOffDAO().updateSaleOff(s);
    }

    private void editCategoryOfPost(HttpServletRequest request) {
        int categoryOfPostID = Integer.parseInt(request.getParameter("categoryOfPostID"));
        String categoryOfPostName = request.getParameter("categoryOfPostName");
        CategoryOfPost cp = new CategoryOfPost();
        cp.setId(categoryOfPostID);
        cp.setCategory(categoryOfPostName);
        new CategoryOfPostDAO().updateCOP(cp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("Views/Setting.jsp").forward(request, response);
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
        ServletContext context = request.getServletContext();
        String action = request.getParameter("action");
        if (null != action) {
            switch (action) {
                case "changeStatusUserRole":
                    changeStatusUserRole(request);
                    break;
                case "changeStatusCategory":
                    changeStatusCategory(request);
                    break;
                case "changeStatusBrand":
                    changeStatusBrand(request);
                    break;
                case "changeStatusRoom":
                    changeStatusRoom(request);
                    break;
                case "changeStatusColor":
                    changeStatusColor(request);
                    break;
                case "changeStatusSaleOff":
                    changeStatusSaleOff(request);
                    break;
                case "changeStatusCategoryOfPost":
                    changeStatusCategoryOfPost(request);
                    break;
                case "changeItemsOfHomeProductsList":
                    changeItemsHomeProductsList(request, context);
                    break;
                case "changeItemsOfProductsList":
                    changeItemsProductsList(request, context);
                    break;
                case "changeItemsOfFeedbacksList":
                    changeItemsFeedbacksList(request, context);
                    break;
                case "changeItemsOfCustomersList":
                    changeItemsCustomersList(request, context);
                    break;
                case "changeItemsOfPostsList":
                    changeItemsPostsList(request, context);
                    break;
                case "changeItemsOfSlidersList":
                    changeItemsSlidersList(request, context);
                    break;
                case "changeItemsOfOrdersList":
                    changeItemsOrdersList(request, context);
                    break;
                case "changeItemsOfShoppingCartsList":
                    changeItemsShoppingCartsList(request, context);
                    break;
                case "addNewUserRole":
                    addNewUserRole(request);
                    break;
                case "addNewCategory":
                    addNewCategory(request);
                    break;
                case "addNewBrand":
                    addNewBrand(request);
                    break;
                case "addNewRoom":
                    addNewRoom(request);
                    break;
                case "addNewColor":
                    addNewColor(request);
                    break;
                case "addNewSaleOff":
                    addNewSaleOff(request);
                    break;
                case "addNewCategoryOfPost":
                    addNewCategoryOfPost(request);
                    break;
                case "editCategory":
                    editCategory(request);
                    break;
                case "editBrand":
                    editBrand(request);
                    break;
                case "editRoom":
                    editRoom(request);
                    break;
                case "editColor":
                    editColor(request);
                    break;
                case "editSaleOff":
                    editSaleOff(request);
                    break;
                case "editcategoryOfPost":
                    editCategoryOfPost(request);
                    break;
                default:
                    break;
            }
        }
        processRequest(request, response);
        request.getRequestDispatcher("Views/Setting.jsp").forward(request, response);
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
