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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

public ArrayList<Product> filterProductList(String categoryStr, String priceStr, String colorStr, String sizeStr) {
    ArrayList<Product> productList = new ArrayList<>();
    
    String sql = """
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
                 WHERE 
                     Category.category = ?
                 AND ProductDetail.color = ?
                 AND ProductDetail.size LIKE ?
                 """;
    
    String priceCondition = parsePrice(priceStr);
    if (!priceCondition.isEmpty()) {
        sql += " AND Product.price " + priceCondition;
    }

    try (PreparedStatement pstmt = connect.prepareStatement(sql)) {

        pstmt.setString(1, categoryStr);
        pstmt.setString(2, colorStr);
        pstmt.setString(3, "%" + sizeStr + "%");

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


    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        ArrayList<Product> list = dao.filterProductList("Sofa", "<500", "White", "90");
        for (Product product : list) {
            System.out.println(product.toString());
        }
    }
}
