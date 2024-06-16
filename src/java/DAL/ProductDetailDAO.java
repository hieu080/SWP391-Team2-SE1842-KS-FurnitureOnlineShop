/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.ProductDetail;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

/**
 *
 * @author HELLO
 */
public class ProductDetailDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(ProductDetailDAO.class.getName());

    // Create
    public void addProductDetail(ProductDetail productDetail) {
        String query = "INSERT INTO ProductDetail (product_id, color_id, quantity, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, productDetail.getProduct_id());
            stmt.setInt(2, productDetail.getColor_id());
            stmt.setInt(3, productDetail.getQuantity());
            stmt.setString(4, productDetail.getStatus());
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding product detail", e);
        }
    }

    // Read
    public ProductDetail getProductDetail(int id) {
        String query = "SELECT * FROM ProductDetail WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ProductDetail productDetail = new ProductDetail(rs.getInt("product_id"), rs.getInt("color_id"), rs.getInt("quantity"));
                    productDetail.setId(rs.getInt("id"));
                    productDetail.setStatus(rs.getString("status"));
                    return productDetail;
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product detail", e);
        }
        return null;
    }

    //Read product detail lastest insert
    public ProductDetail getProductDetailLastest() {
        String query = "SELECT * FROM ProductDetail ORDER BY id DESC LIMIT 1";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ProductDetail productDetail = new ProductDetail(rs.getInt("product_id"), rs.getInt("color_id"), rs.getInt("quantity"));
                    productDetail.setId(rs.getInt("id"));
                    productDetail.setStatus(rs.getString("status"));
                    return productDetail;
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product detail", e);
        }
        return null;
    }

    // Update
    public boolean updateProductDetail(ProductDetail productDetail) {
        String query = "UPDATE ProductDetail SET product_id = ?, color_id = ?, quantity = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, productDetail.getProduct_id());
            stmt.setInt(2, productDetail.getColor_id());
            stmt.setInt(3, productDetail.getQuantity());
            stmt.setString(4, productDetail.getStatus());
            stmt.setInt(5, productDetail.getId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có ít nhất một dòng được cập nhật
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating product detail", e);
            return false; // Trả về false nếu có lỗi xảy ra
        }
    }

    // Delete
    public void deleteProductDetail(int id) {
        String query = "UPDATE ProductDetail SET status = 'Inactive' WHERE id = ?";
        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error setting product detail to inactive", e);
        }
    }

    // List All
    public ArrayList<ProductDetail> getAllProductDetails() {
        ArrayList<ProductDetail> productDetails = new ArrayList<>();
        String query = "SELECT * FROM ProductDetail";
        try (PreparedStatement stmt = connect.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                ProductDetail productDetail = new ProductDetail(rs.getInt("product_id"), rs.getInt("color_id"), rs.getInt("quantity"));
                productDetail.setId(rs.getInt("id"));
                productDetail.setStatus(rs.getString("status"));
                productDetails.add(productDetail);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product details", e);
        }
        return productDetails;
    }

    //List by productId
    public ArrayList<ProductDetail> getProductDetailsByProductId(int id) {
        ArrayList<ProductDetail> productDetails = new ArrayList<>();
        String query = "SELECT * FROM ProductDetail WHERE product_id = ?";

        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            // Thiết lập giá trị cho tham số truy vấn
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductDetail productDetail = new ProductDetail(
                            rs.getInt("product_id"),
                            rs.getInt("color_id"),
                            rs.getInt("quantity")
                    );
                    productDetail.setId(rs.getInt("id"));
                    productDetail.setStatus(rs.getString("status"));
                    productDetails.add(productDetail);
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product details", e);
        }

        return productDetails;
    }

    public static void main(String[] args) {
        ProductDetail productDetail = new ProductDetail();
        productDetail.setId(1);
        productDetail.setProduct_id(1);
        productDetail.setColor_id(2);
        productDetail.setQuantity(15);
        productDetail.setStatus("Active");

        ProductDetailDAO pddao = new ProductDetailDAO();
        pddao.updateProductDetail(productDetail);
    }
}
