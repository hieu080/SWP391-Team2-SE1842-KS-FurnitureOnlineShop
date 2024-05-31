/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class ProductDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());

    public boolean insertProduct(Product product) {
        String sql = "INSERT INTO product (category_id, brand_id, room_id, name, description, image, price, quantity, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, product.getCategory_id());
            preparedStatement.setInt(2, product.getBrand_id());
            preparedStatement.setInt(3, product.getRoom_id());
            preparedStatement.setString(4, product.getName());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getImage());
            preparedStatement.setDouble(7, product.getPrice());
            preparedStatement.setInt(8, product.getQuantity());
            preparedStatement.setString(9, product.getStatus());

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inserting product", e);
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        String sql = "UPDATE product SET category_id = ?, brand_id = ?, room_id = ?, name = ?, description = ?, image = ?, price = ?, quantity = ?, status = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, product.getCategory_id());
            preparedStatement.setInt(2, product.getBrand_id());
            preparedStatement.setInt(3, product.getRoom_id());
            preparedStatement.setString(4, product.getName());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getImage());
            preparedStatement.setDouble(7, product.getPrice());
            preparedStatement.setInt(8, product.getQuantity());
            preparedStatement.setString(9, product.getStatus());
            preparedStatement.setInt(10, product.getId());

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating product", e);
            return false;
        }
    }

    public boolean deleteProduct(int productId) {
        String sql = "UPDATE product SET status = 'Inactive' WHERE id = ?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, productId);

            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting product", e);
            return false;
        }
    }

    public ArrayList<Product> getProductList() {
        ArrayList<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM product";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query); ResultSet resultSet = preparedStatement.executeQuery();) {

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
        String query = "SELECT * FROM product WHERE name LIKE ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            // Définir le paramètre avant d'exécuter la requête
            preparedStatement.setString(1, "%" + name + "%");

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
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
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
        }

        return productList;
    }

    public ArrayList<Product> filterProductList(String brandID, String roomID, String categoryID, String colorID, String priceStr) {
        ArrayList<Product> productList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
        SELECT 
            Product.id, Product.category_id, Product.brand_id, Product.room_id, Product.name, Product.description, Product.image, Product.price, Product.quantity, Product.status
        FROM 
            Product
        JOIN 
            ProductDetail ON Product.id = ProductDetail.product_id
        WHERE 1=1
        """);

        List<Object> parameters = new ArrayList<>();

        if (brandID != null && !brandID.isEmpty()) {
            sql.append(" AND Product.brand_id = ?");
            parameters.add(brandID);
        }
        if (roomID != null && !roomID.isEmpty()) {
            sql.append(" AND Product.room_id = ?");
            parameters.add(roomID);
        }
        if (categoryID != null && !categoryID.isEmpty()) {
            sql.append(" AND Product.category_id = ?");
            parameters.add(categoryID);
        }
        if (colorID != null && !colorID.isEmpty()) {
            sql.append(" AND ProductDetail.color_id = ?");
            parameters.add(colorID);
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
            LOGGER.log(Level.SEVERE, "Error retrieving product list.", ex);
        }
        return productList;
    }

    private String parsePrice(String priceStr) {
        String x = "";
        if (priceStr != null && !priceStr.isEmpty()) {
            switch (priceStr) {
                case "<500":
                    x = "< 500000";
                    break;
                case "500<x<1500":
                    x = "BETWEEN 500000 AND 1500000";
                    break;
                case "1500<x<5000":
                    x = "BETWEEN 1500000 AND 5000000";
                    break;
                case ">5000":
                    x = "> 5000000";
                    break;
            }
        }
        return x;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> list = productDAO.searchProductByName("IKEA");
        for (Product product : list) {
            System.out.println(product.getName());
        }
    }

}
