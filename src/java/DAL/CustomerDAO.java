/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Brand;
import Models.Category;
import Models.Feedback;
import Models.OrderDetail;
import Models.Page;
import Models.Product;
import Models.Room;
import Models.SaleOff;
import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class CustomerDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public ArrayList<Product> getProductList() {
        ArrayList<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            String query = "SELECT * FROM product";
            preparedStatement = connect.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setCategory_id(resultSet.getInt("category_id"));
                product.setBrand_id(resultSet.getInt("brand_id"));
                product.setRoom_id(resultSet.getInt("room_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setImage(resultSet.getString("image"));
                product.setPrice(resultSet.getDouble("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setStatus(resultSet.getString("status"));

                productList.add(product);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
        }

        return productList;
    }

    public ArrayList<Product> searchProductByName(String name) {
        ArrayList<Product> productList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            String query = "SELECT * FROM product WHERE name LIKE ?";
            preparedStatement = connect.prepareStatement(query);
            preparedStatement.setString(1, "%" + name + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setCategory_id(resultSet.getInt("category_id"));
                product.setBrand_id(resultSet.getInt("brand_id"));
                product.setRoom_id(resultSet.getInt("room_id"));
                product.setName(resultSet.getString("name"));
                product.setDescription(resultSet.getString("description"));
                product.setImage(resultSet.getString("image"));
                product.setPrice(resultSet.getDouble("price"));
                product.setQuantity(resultSet.getInt("quantity"));
                product.setStatus(resultSet.getString("status"));

                productList.add(product);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
        }
        return productList;
    }

    public ArrayList<Brand> getBrandList() {
        ArrayList<Brand> brandList = new ArrayList<>();
        String sql = "SELECT brandname FROM brand";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String brandname = rs.getString("brandname");
                Brand brand = new Brand(brandname);
                brandList.add(brand);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving brand list.", ex);
        }

        return brandList;
    }

    public ArrayList<Room> getRoomList() {
        ArrayList<Room> roomList = new ArrayList<>();
        String sql = "SELECT roomname FROM room";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String roomname = rs.getString("roomname");
                Room room = new Room(roomname);
                roomList.add(room);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
        }

        return roomList;
    }

    public ArrayList<Page> getPageList() {
        ArrayList<Page> pageList = new ArrayList<>();
        String sql = "SELECT * FROM page";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("name");
                String content = rs.getString("content");
                Page page = new Page(name, content);
                pageList.add(page);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
        }

        return pageList;
    }

    public ArrayList<Feedback> getFeedbackList() {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT * FROM feedback";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setCustomer_id(rs.getInt("customer_id"));
                feedback.setProduct_id(rs.getInt("product_id"));
                feedback.setVotescore(rs.getInt("votescore"));
                feedback.setFeedback(rs.getString("feedback"));
                feedback.setReplyfeedback_id(rs.getInt("replyfeedback_id"));
                feedback.setStatus(rs.getString("status"));

                feedbackList.add(feedback);

            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
        }
        return feedbackList;
    }

    public ArrayList<SaleOff> getSaleList() {
        ArrayList<SaleOff> saleoffList = new ArrayList<>();
        String sql = "SELECT * FROM saleoff";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                SaleOff sale = new SaleOff();
                sale.setId(rs.getInt("id"));
                sale.setProduct_id(rs.getInt("product_id"));
                sale.setSaleoffvalue(rs.getInt("saleoffvalue"));
                sale.setStatus(rs.getString("status"));

                saleoffList.add(sale);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
        }
        return saleoffList;
    }

    public ArrayList<OrderDetail> getOrderDetailList() {
        ArrayList<OrderDetail> OrderDetailList = new ArrayList<>();
        String sql = "SELECT * FROM orderdetail";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt("id"));
                orderDetail.setOrder_id(rs.getInt("order_id"));
                orderDetail.setProduct_id(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getDouble("price"));

                OrderDetailList.add(orderDetail);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving order list.", ex);
        }
        return OrderDetailList;
    }

    public ArrayList<Category> getCategoryList() {
        ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT * FROM category";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setCategory(rs.getString("category"));

                categoryList.add(category);
            }

        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving category list.", ex);
        }
        return categoryList;
    }

    private String parsePrice(String priceStr) {
        String x = "";
        if (priceStr != null && !priceStr.isEmpty()) {
            if (priceStr.equals("<500")) {
                x += " < 500000";
            } else if (priceStr.equals("500<x<1000")) {
                x += " BETWEEN 500000 AND 1000000";
            } else if (priceStr.equals("1000<x<2000")) {
                x += " BETWEEN 1000000 AND 2000000";
            } else if (priceStr.equals("2000<x<5000")) {
                x += " BETWEEN 2000000 AND 5000000";
            } else if (priceStr.equals(">5000")) {
                x += " > 5000000";
            }
        }
        return x;
    }

//public ArrayList<Product> filterProductList(String categoryStr, String priceStr, String colorStr, String sizeStr) {
//    ArrayList<Product> productList = new ArrayList<>();
//    
//    String sql = """
//                 SELECT 
//                     Product.id, Product.category_id, Product.brand_id, Product.room_id, Product.name, Product.description, Product.image, Product.price, Product.quantity, Product.status
//                 FROM 
//                     Product
//                 JOIN 
//                     Category ON Product.category_id = Category.id
//                 JOIN 
//                     Room ON Product.room_id = Room.id
//                 JOIN 
//                     ProductDetail ON Product.id = ProductDetail.product_id
//                 WHERE 
//                     Category.category = ?
//                 AND ProductDetail.color = ?
//                 AND ProductDetail.size LIKE ?
//                 """;
//    
//    String priceCondition = parsePrice(priceStr);
//    if (!priceCondition.isEmpty()) {
//        sql += " AND Product.price " + priceCondition;
//    }
//
//    try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
//
//        pstmt.setString(1, categoryStr);
//        pstmt.setString(2, colorStr);
//        pstmt.setString(3, "%" + sizeStr + "%");
//
//        try (ResultSet rs = pstmt.executeQuery()) {
//            while (rs.next()) {
//                Product product = new Product();
//                product.setId(rs.getInt("id"));
//                product.setCategory_id(rs.getInt("category_id"));
//                product.setBrand_id(rs.getInt("brand_id"));
//                product.setRoom_id(rs.getInt("room_id"));
//                product.setName(rs.getString("name"));
//                product.setDescription(rs.getString("description"));
//                product.setImage(rs.getString("image"));
//                product.setPrice(rs.getDouble("price"));
//                product.setQuantity(rs.getInt("quantity"));
//                product.setStatus(rs.getString("status"));
//
//                productList.add(product);
//            }
//        }
//    } catch (Exception ex) {
//        Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving product list.", ex);
//    }
//    return productList;
//}
    public ArrayList<Product> filterProductList(String categoryStr, String priceStr, String colorStr, String sizeStr) {
        ArrayList<Product> productList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
                 SELECT 
                     Product.id, Product.category_id, Product.brand_id, Product.room_id, Product.name, Product.description, Product.image, Product.price, Product.quantity, Product.status
                 FROM 
                     Product
                 JOIN 
                     Category ON Product.category_id = Category.id
                 JOIN 
                     Room ON Product.room_id = Room.id
                 JOIN 
                     ProductDetail ON Product.id = ProductDetail.product_id
                 WHERE 1=1
                 """);

        List<Object> parameters = new ArrayList<>();

        if (categoryStr != null && !categoryStr.isEmpty()) {
            sql.append(" AND Category.category = ?");
            parameters.add(categoryStr);
        }
        if (colorStr != null && !colorStr.isEmpty()) {
            sql.append(" AND ProductDetail.color = ?");
            parameters.add(colorStr);
        }
        if (sizeStr != null && !sizeStr.isEmpty()) {
            sql.append(" AND ProductDetail.size LIKE ?");
            parameters.add("%" + sizeStr + "%");
        }
        String priceCondition = parsePrice(priceStr);
        if (!priceCondition.isEmpty()) {
            sql.append(" AND Product.price ").append(priceCondition);
        }

        try (PreparedStatement pstmt = connect.prepareStatement(sql.toString())) {
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setCategory_id(rs.getInt("category_id"));
                    product.setBrand_id(rs.getInt("brand_id"));
                    product.setRoom_id(rs.getInt("room_id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setImage(rs.getString("image"));
                    product.setPrice(rs.getDouble("price"));
                    product.setQuantity(rs.getInt("quantity"));
                    product.setStatus(rs.getString("status"));

                    productList.add(product);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving product list.", ex);
        }
        return productList;
    }

    public void signIn(User customer) {
        PreparedStatement statement = null;
        try {
            String mysql = "INSERT INTO `furniture`.`user`\n"
                    + "(`fullname`,\n"
                    + "`gender`,\n"
                    + "`phonenumber`,\n"
                    + "`address`,\n"
                    + "`email`,\n"
                    + "`password`,\n"
                    + "`role_id`,\n"
                    + "`status`)\n"
                    + "VALUES\n"
                    + "(?,?,?,?,?,?,?,?);";
            statement = connect.prepareStatement(mysql);
            statement.setString(1, customer.getFullname());
            statement.setString(2, customer.getGender());
            statement.setString(3, customer.getPhonenumber());
            statement.setString(4, customer.getAddress());
            statement.setString(5, customer.getEmail());
            statement.setString(6, customer.getPassword());
            statement.setInt(7, customer.getRole_id());
            statement.setString(8, customer.getStatus());
            statement.executeUpdate();

        } catch (Exception e) {
        }
    }

    public User login(String email, String password) {
        User user = new User();
        PreparedStatement statement = null;
        try {
            String mysql = """
                       SELECT `user`.`id`,
                           `user`.`fullname`,
                           `user`.`gender`,
                           `user`.`avatar`,
                           `user`.`phonenumber`,
                           `user`.`address`,
                           `user`.`email`,
                           `user`.`password`,
                           `user`.`role_id`,
                           `user`.`status`
                       FROM `furniture`.`user`
                       where `user`.`email` = ? AND `user`.`password`=?;""";
            statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setGender(rs.getString("gender"));
                user.setAvatar(rs.getString("avatar"));
                user.setPhonenumber(rs.getString("phonenumber"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole_id(rs.getInt("role_id"));
                user.setStatus(rs.getString("status"));
                return user;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void resetPassword(String email, String password) {
        String mysql = """
                       UPDATE `furniture`.`user`
                       SET
                       `password` = ? 
                       
                       WHERE `email` = ?;""";
        PreparedStatement statement = null;
        try {
            statement = connect.prepareStatement(mysql);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

//    public Boolean checkAccount(String email) {
//        PreparedStatement statement = null;
//        ResultSet rs = null;
//
//        try {
//
//            String mysql = """
//                       SELECT `user`.`id`,
//                           `user`.`fullname`,
//                           `user`.`gender`,
//                           `user`.`avatar`,
//                           `user`.`phonenumber`,
//                           `user`.`address`,
//                           `user`.`email`,
//                           `user`.`password`,
//                           `user`.`role_id`,
//                           `user`.`status`
//                       FROM `furniture`.`user`
//                       WHERE `user`.`email` = ?;""";
//
//            statement = connect.prepareStatement(mysql);
//            statement.setString(1, email);
//            rs = statement.executeQuery();
//            if (rs.next()) {
//                return true;
//            }
//        } catch (SQLException e) {
//
//        }
//        return false;
//    }
//    
    public Boolean checkAccount(String email) {
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            String mysql = """
            SELECT `user`.`id`
            FROM `furniture`.`user`
            WHERE `user`.`email` = ?;""";

            statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            rs = statement.executeQuery();

            // Kiểm tra xem có bản ghi nào trùng với email không
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertVerifyCustomer(String fullname, String gender, String phonenumber, String address, String email, String password) {
        String mysql = """
                       INSERT INTO `furniture`.`verifyaccount`
                       (`fullname`,
                       `gender`,
                       `phonenumber`,
                       `address`,
                       `email`,
                       `password`,
                       `time`)
                       VALUES
                       (?,?,?,?,?,?,current_timestamp);""";
        PreparedStatement statement = null;

        try {
            statement = connect.prepareStatement(mysql);
            statement.setString(1, fullname);
            statement.setString(2, gender);
            statement.setString(3, phonenumber);
            statement.setString(4, address);
            statement.setString(5, email);
            statement.setString(6, password);

            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCustomer(String email) {
        String mysql = "INSERT INTO `furniture`.`user`(fullname, gender, phonenumber, address, email, password, role_id, status)\n"
                + "                SELECT fullname, gender, phonenumber, address, email, password , 1, 'active'\n"
                + "                FROM `furniture`.`verifyaccount`\n"
                + "                WHERE email = ?";
        PreparedStatement statement = null;

        try {
            statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

//    public boolean checkVerifyEmail(String email) {
//        PreparedStatement statement = null;
//        String mysql = "SELECT * FROM furniture.verifyaccount"
//                + "WHERE email = 'trangtrang12102003@gmail.com'";
//        try {
//            statement = connect.prepareStatement(mysql);
//            statement.setString(1, email);
//            ResultSet rs = statement.executeQuery();
//            if(rs.next()){
//                return true;
//            }
//        } catch (Exception e) {
//        }
//        return false;
//    }
    public boolean checkVerifyEmail(String email) {
        PreparedStatement statement = null;
        String mysql = "SELECT COUNT(*) FROM furniture.verifyaccount WHERE email = ?";
        try {
            statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để kiểm tra lỗi
        } finally {
            // Đóng statement ở đây nếu cần thiết
        }
        return false;
    }

//    public void resetPass(String email, String pass) {
//        PreparedStatement statement = null;
//        String mysql = "UPDATE `furniture`.`user`\n"
//                + "SET\n"
//                + "\n"
//                + "`password` = ?\n"
//                + "\n"
//                + "WHERE `email` = ?;\n"
//                + "SELECT * FROM furniture.verifyaccount";
//        try {
//            statement = connect.prepareStatement(mysql);
//            statement.setString(1, pass);
//            statement.setString(2, email);
//            statement.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
    
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        ArrayList<Product> list = dao.filterProductList("Sofa", "<500", "White", "90");
        for (Product product : list) {
            System.out.println(product.toString());
        }
    }
}
