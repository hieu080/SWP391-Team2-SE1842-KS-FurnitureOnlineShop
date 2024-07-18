/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Models.Brand;
import Models.CartItem;
import Models.CartItemWithDetail;
import Models.Category;
import Models.Color;
import Models.Product;
import Models.ProductDetail;
import Models.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

/**
 *
 * @author HELLO
 */
public class CartItemDAO extends DBContext {

    public List<CartItem> getCartItemsByCustomerId(int customerId) throws SQLException {
        String query = "SELECT * FROM CartItem WHERE customer_id = ?";
        try (java.sql.PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            List<CartItem> cartItems = new ArrayList<>();
            while (rs.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setId(rs.getInt("id"));
                cartItem.setCustomer_id(rs.getInt("customer_id"));
                cartItem.setProduct_id(rs.getInt("product_id"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setStatus(rs.getString("status"));
                cartItems.add(cartItem);
            }
            return cartItems;
        }
    }

    public List<CartItemWithDetail> getCartItemsDetail(int customerId) throws SQLException {
        String query = "SELECT \n"
                + "    user.id, user.fullname, user.gender, user.avatar, user.phonenumber, user.address, user.email, user.password, user.role_id, user.status,\n"
                + "    product.id AS product_id, product.category_id, product.brand_id, product.room_id, product.name, product.description, product.image, product.price, product.quantity, product.status AS product_status,\n"
                + "    productdetail.id AS productdetail_id, productdetail.product_id, productdetail.color_id,productdetail.quantity, productdetail.status AS productdetail_status,\n"
                + "    color.id AS color_id, color.colorname,\n"
                + "    brand.id AS brand_id, brand.brandname,\n"
                + "    category.id AS category_id, category.category,\n"
                + "    cartitem.id AS cartitem_id, cartitem.customer_id, cartitem.product_id, cartitem.quantity, cartitem.totalcost, cartitem.status AS cartitem_status\n"
                + "FROM user\n"
                + "JOIN cartitem ON user.id = cartitem.customer_id\n"
                + "JOIN productdetail ON cartitem.product_id = productdetail.id\n"
                + "JOIN product ON productdetail.product_id = product.id\n"
                + "JOIN color ON productdetail.color_id = color.id\n"
                + "JOIN brand ON product.brand_id = brand.id\n"
                + "JOIN category ON product.category_id = category.id\n"
                + "WHERE user.id= ?;";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            List<CartItemWithDetail> cartItems = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString(2));
                user.setGender(rs.getString(3));
                user.setAvatar(rs.getString(4));
                user.setPhonenumber(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setPassword(rs.getString(8));
                user.setRole_id(rs.getInt(9));
                user.setStatus(rs.getString(10));
                Product product = new Product();
                product.setId(rs.getInt(11));
                product.setCategory_id(rs.getInt(12));
                product.setBrand_id(rs.getInt(13));
                product.setRoom_id(rs.getInt(14));
                product.setName(rs.getString(15));
                product.setDescription(rs.getString(16));
                product.setImage(rs.getString(17));
                product.setPrice(rs.getDouble(18));
                product.setQuantity(rs.getInt(19));
                product.setStatus(rs.getString(20));
                ProductDetail productDetail = new ProductDetail();
                productDetail.setId(rs.getInt(21));
                productDetail.setProduct_id(rs.getInt(22));
                productDetail.setColor_id(rs.getInt(23));
                productDetail.setQuantity(rs.getInt(24));
                productDetail.setStatus(rs.getString(25));
                Color color = new Color();
                color.setId(rs.getInt(26));
                color.setColorname(rs.getString(27));
                Brand brand = new Brand();
                brand.setId(rs.getInt(28));
                brand.setBrandname(rs.getString(29));
                Category category = new Category();
                category.setId(rs.getInt(30));
                category.setCategory(rs.getString(31));
                CartItem cartItem = new CartItem();
                cartItem.setId(rs.getInt(32));
                cartItem.setCustomer_id(rs.getInt(33));
                cartItem.setProduct_id(rs.getInt(34));
                cartItem.setQuantity(rs.getInt(35));
                cartItem.setTotalcost(rs.getDouble(36));
                cartItem.setStatus(rs.getString(37));

                CartItemWithDetail cartItemWithDetail = new CartItemWithDetail(product, productDetail, color, user, cartItem, brand, category);
                cartItems.add(cartItemWithDetail);
            }
            return cartItems;
        }
    }
    public List<CartItemWithDetail> getCartItemsDetailByStatus(int customerId) throws SQLException {
        String query = "SELECT \n"
                + "    user.id, user.fullname, user.gender, user.avatar, user.phonenumber, user.address, user.email, user.password, user.role_id, user.status,\n"
                + "    product.id AS product_id, product.category_id, product.brand_id, product.room_id, product.name, product.description, product.image, product.price, product.quantity, product.status AS product_status,\n"
                + "    productdetail.id AS productdetail_id, productdetail.product_id, productdetail.color_id,productdetail.quantity, productdetail.status AS productdetail_status,\n"
                + "    color.id AS color_id, color.colorname,\n"
                + "    brand.id AS brand_id, brand.brandname,\n"
                + "    category.id AS category_id, category.category,\n"
                + "    cartitem.id AS cartitem_id, cartitem.customer_id, cartitem.product_id, cartitem.quantity, cartitem.totalcost, cartitem.status AS cartitem_status\n"
                + "FROM user\n"
                + "JOIN cartitem ON user.id = cartitem.customer_id\n"
                + "JOIN productdetail ON cartitem.product_id = productdetail.id\n"
                + "JOIN product ON productdetail.product_id = product.id\n"
                + "JOIN color ON productdetail.color_id = color.id\n"
                + "JOIN brand ON product.brand_id = brand.id\n"
                + "JOIN category ON product.category_id = category.id\n"
                + "WHERE user.id= ? AND cartitem.status=?;";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, customerId);
            ps.setString(2, "selected");
            ResultSet rs = ps.executeQuery();
            List<CartItemWithDetail> cartItems = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString(2));
                user.setGender(rs.getString(3));
                user.setAvatar(rs.getString(4));
                user.setPhonenumber(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setPassword(rs.getString(8));
                user.setRole_id(rs.getInt(9));
                user.setStatus(rs.getString(10));
                Product product = new Product();
                product.setId(rs.getInt(11));
                product.setCategory_id(rs.getInt(12));
                product.setBrand_id(rs.getInt(13));
                product.setRoom_id(rs.getInt(14));
                product.setName(rs.getString(15));
                product.setDescription(rs.getString(16));
                product.setImage(rs.getString(17));
                product.setPrice(rs.getDouble(18));
                product.setQuantity(rs.getInt(19));
                product.setStatus(rs.getString(20));
                ProductDetail productDetail = new ProductDetail();
                productDetail.setId(rs.getInt(21));
                productDetail.setProduct_id(rs.getInt(22));
                productDetail.setColor_id(rs.getInt(23));
                productDetail.setQuantity(rs.getInt(24));
                productDetail.setStatus(rs.getString(25));
                Color color = new Color();
                color.setId(rs.getInt(26));
                color.setColorname(rs.getString(27));
                Brand brand = new Brand();
                brand.setId(rs.getInt(28));
                brand.setBrandname(rs.getString(29));
                Category category = new Category();
                category.setId(rs.getInt(30));
                category.setCategory(rs.getString(31));
                CartItem cartItem = new CartItem();
                cartItem.setId(rs.getInt(32));
                cartItem.setCustomer_id(rs.getInt(33));
                cartItem.setProduct_id(rs.getInt(34));
                cartItem.setQuantity(rs.getInt(35));
                cartItem.setTotalcost(rs.getDouble(36));
                cartItem.setStatus(rs.getString(37));

                CartItemWithDetail cartItemWithDetail = new CartItemWithDetail(product, productDetail, color, user, cartItem, brand, category);
                cartItems.add(cartItemWithDetail);
            }
            return cartItems;
        }
    }

    public void updateCartItemQuantity(int cartItemId, int quantity, double totalcost) throws SQLException {
        String query = "UPDATE CartItem SET quantity = ? ,totalcost=? WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setDouble(2, totalcost);
            ps.setInt(3, cartItemId);
            ps.executeUpdate();
        }
    }

    public void updateCartItemQuantity(int cartItemId, int quantity) throws SQLException {
        String query = "UPDATE CartItem SET quantity = ?  WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, quantity);

            ps.setInt(2, cartItemId);
            ps.executeUpdate();
        }
    }

    public void updateCartItemStatus(int cartItemId, String status) throws SQLException {
        String query = "UPDATE CartItem SET status = ? WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, cartItemId);
            ps.executeUpdate();
        }
    }

    public void updateCartItemStatus( String status) throws SQLException {
        String query = "UPDATE CartItem SET status = ? ";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setString(1, status);
            
            ps.executeUpdate();
        }
    }

    public void deleteCartItem(int cartItemId) throws SQLException {
        String query = "DELETE FROM CartItem WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, cartItemId);
            ps.executeUpdate();
        }
    }

    public void addCartItem(CartItem cartItem) throws SQLException {
        String query = "INSERT INTO CartItem (customer_id, product_id, quantity,totalcost, status) VALUES (?, ?, ?, ?,?)";
        try (PreparedStatement ps = connect.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, cartItem.getCustomer_id());
            ps.setInt(2, cartItem.getProduct_id());
            ps.setInt(3, cartItem.getQuantity());
            ps.setDouble(4, cartItem.getTotalcost());
            ps.setString(5, cartItem.getStatus());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    cartItem.setId(rs.getInt(1));
                }
            }
        }
    }

    // Additional helper methods for fetching product details and calculating total cost
    public double getProductPrice(int productId) throws SQLException {
        String query = "SELECT price FROM Product WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("price");
            }
        }
        return 0.0;
    }

    public double calculateTotalCost(List<CartItem> cartItems) throws SQLException {
        double totalCost = 0.0;
        for (CartItem item : cartItems) {
            double price = getProductPrice(item.getProduct_id());
            totalCost += price * item.getQuantity();
        }
        return totalCost;
    }

    // New method to count the number of CartItem entries for a specific customer
    public int countCartItemsByCustomerId(int customerId) throws SQLException {
        String query = "SELECT COUNT(*) FROM CartItem WHERE customer_id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    // New method to count the number of CartItem entries for a specific customer
    public int countCartItemsBySelectedCustomerId(int customerId) throws SQLException {
        String query = "SELECT COUNT(*) FROM CartItem WHERE customer_id = ? AND status='selected'";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, customerId);
           
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // New method to get a CartItem by product ID and customer ID
    public CartItem getCartItemByProductIdAndCustomerId(int productId, int customerId) throws SQLException {
        String query = "SELECT * FROM CartItem WHERE product_id = ? AND customer_id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.setInt(2, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setId(rs.getInt("id"));
                cartItem.setCustomer_id(rs.getInt("customer_id"));
                cartItem.setProduct_id(rs.getInt("product_id"));
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setTotalcost(rs.getDouble("totalcost"));
                cartItem.setStatus(rs.getString("status"));
                return cartItem;
            }
        }
        return null;
    }

    public double getTotalCost(int customerid) throws SQLException {
        String sql = "SELECT SUM(totalcost) FROM CartItem WHERE status='selected' AND customer_id= ?";

        double totalCost = 0.0;
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, customerid);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalCost = resultSet.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return totalCost;
    }
    public double getTotalCostNoStatus(int customerid) throws SQLException {
        String sql = "SELECT SUM(totalcost) FROM CartItem where customer_id=? ";

        double totalCost = 0.0;
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setInt(1, customerid);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                totalCost = resultSet.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return totalCost;
    }

    public void deleteAllCartItem(int customerid) throws SQLException {
        String query = "DELETE FROM CartItem ";
        try (PreparedStatement ps = connect.prepareStatement(query)) {

            ps.executeUpdate();
        }
    }
}
