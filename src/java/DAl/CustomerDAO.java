/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAl;

import DAL.DBContext;
import Models.Brand;
import Models.Order;
import Models.OrderDetail;
import Models.Page;
import Models.Product;
import Models.Room;
import Models.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;
import java.util.Base64;

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

    public boolean changePass(String uid, String pass) {
        try {
            String sql = "UPDATE `furniture`.`User`\n"
                    + "SET `password` = '" + pass + "' WHERE `id` =" + uid;
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String update(String fullname, String gender, String avatar, String phonenumber, String address, int uid) {
        try {
//            String key = generateRandomString(15);
            String sql = "UPDATE `furniture`.`User` SET `fullname` = '" + fullname + "',"
                    + " `gender` = '" + gender + "', `phonenumber` = '" + phonenumber + "', `address` = '" + address + "',`avatar` = '" + avatar + "'"
                    + " WHERE (`id` = '" + uid + "');";
            System.out.println(sql);
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.executeUpdate();

            return sql;
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

    public User getUserById(int uid) {
        String sql = " SELECT fullname, gender, phonenumber, address, email, password FROM furniture.user where id = " + uid;
        try (PreparedStatement stm = connect.prepareStatement(sql); ResultSet rs = stm.executeQuery();){
            
            
            
            
            while (rs.next()) {
                User s = new User();
                s.setFullname(rs.getString("fullname"));
                s.setGender(rs.getString("gender"));
                s.setPhonenumber(rs.getString("phonenumber"));
                s.setAddress(rs.getString("address"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                return s;
            }
        } catch (SQLException e) {
        }
        return null;
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

//    public ArrayList<Room> getRoomList() {
//        ArrayList<Room> roomList = new ArrayList<>();
//        String sql = "SELECT roomname FROM room";
//
//        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
//
//            while (rs.next()) {
//                String roomname = rs.getString("roomname");
//                Room room = new Room(roomname);
//                roomList.add(room);
//            }
//
//        } catch (Exception ex) {
//            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
//        }
//
//        return roomList;
//    }

//    public ArrayList<Page> getPageList() {
//        ArrayList<Page> pageList = new ArrayList<>();
//        String sql = "SELECT * FROM page";
//
//        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
//
//            while (rs.next()) {
//                String name = rs.getString("name");
//                String content = rs.getString("content");
//                Page page = new Page(name, content);
//                pageList.add(page);
//            }
//
//        } catch (Exception ex) {
//            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving room list.", ex);
//        }
//
//        return pageList;
//    }

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
                       `password` = ? ,
                       
                       WHERE `email` = ?;""";
        try {
            PreparedStatement statement = connect.prepareStatement(mysql);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Boolean checkAccount(String email) {
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
                       WHERE `user`.`email` = ?;""";
            statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

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
        try {
            PreparedStatement statement = connect.prepareStatement(mysql);
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
        String mysql = "INSERT INTO `furniture`.`user`(fullname, gender, phonenumber, address, email, password)\n"
                + "SELECT fullname, gender, phonenumber, address, email, password\n"
                + "FROM `furniture`.`verifyaccount`\n"
                + "WHERE email = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(mysql);
            statement.setString(1, email);
            statement.executeUpdate();
        } catch (Exception e) {
        }
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

    public Order getOrder(int customer_id, int order_id) {
        Order od = new Order();
        String sql = "SELECT * FROM furniture.order WHERE id = ? AND customer_id = ?"; // Đổi "order" thành "orders" nếu bảng có tên là "orders".

        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, order_id); // Sử dụng setInt thay vì setString cho giá trị int.
            pstmt.setInt(2, customer_id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    od.setId(rs.getInt("id"));
                    od.setCustomer_id(rs.getInt("customer_id"));
                    od.setSale_id(rs.getInt("sale_id"));
                    od.setAddress_id(rs.getInt("address_id"));
                    od.setTotalcost(rs.getDouble("totalcost"));

                    // Chuyển đổi từ Timestamp sang LocalDateTime
                    java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                    if (timestamp != null) {
                        od.setOrderDate(timestamp.toLocalDateTime());
                    }

                    od.setStatus(rs.getString("status"));
                    return od;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving order.", ex);
        }
        return null;
    }

    public ArrayList<Order> getOrderList() {
        ArrayList<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM furniture.order"; // Sửa lại "order" thành "orders"

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Order od = new Order();
                od.setId(rs.getInt("id"));
                od.setCustomer_id(rs.getInt("customer_id"));
                od.setSale_id(rs.getInt("sale_id"));
                od.setAddress_id(rs.getInt("address_id"));
                od.setTotalcost(rs.getDouble("totalcost"));

                // Chuyển đổi từ Timestamp sang LocalDateTime
                java.sql.Timestamp timestamp = rs.getTimestamp("orderdate");
                if (timestamp != null) {
                    od.setOrderDate(timestamp.toLocalDateTime());
                }

                od.setStatus(rs.getString("status"));

                orderList.add(od);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, "Error retrieving order list.", ex);
        }
        return orderList;
    }

//    public ArrayList<Product> getProductList() {
//        ArrayList<Product> productList = new ArrayList<>();
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;
//
//        try {
//            String query = "SELECT * FROM product";
//            preparedStatement = connect.prepareStatement(query);
//            resultSet = preparedStatement.executeQuery();
//
//            while (resultSet.next()) {
//                Product product = new Product();
//                product.setId(resultSet.getInt("id"));
//                product.setCategory_id(resultSet.getInt("category_id"));
//                product.setBrand_id(resultSet.getInt("brand_id"));
//                product.setRoom_id(resultSet.getInt("room_id"));
//                product.setName(resultSet.getString("name"));
//                product.setDescription(resultSet.getString("description"));
//                product.setImage(resultSet.getString("image"));
//                product.setPrice(resultSet.getDouble("price"));
//                product.setQuantity(resultSet.getInt("quantity"));
//                product.setStatus(resultSet.getString("status"));
//
//                productList.add(product);
//            }
//        } catch (Exception e) {
//            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
//        }
//
//        return productList;
//    }
//    public static void main(String[] args) {
//        List<Brand> list = new ArrayList<>();
//        CustomerDAO dao = new CustomerDAO();
//        list = dao.getBrandList();
//        for (Brand product1 : list) {
//            System.out.println(product1.getBrandname());
//        }
//        System.out.println(dao.checkAccount("trangbtmhe170207@gmail.com"));
//        User us = new User("MT", "Nữ", "123456", "Hd", "trang121@gmail,com", "12456");
//        dao.signIn(us);
//        dao.insertVerifyCustomer("MTM", "nam", "0234567", "gu", "trangtrang@gmail.com", "12345");
//    }
//    

}
