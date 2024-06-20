/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
                product.setStaravg(resultSet.getDouble("staravg"));
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
                    product.setStaravg(resultSet.getDouble("staravg"));
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

    public ArrayList<Product> filterProductList(String[] brandIDs, String[] roomIDs, String[] categoryIDs, String[] colorIDs, String[] priceStrs) {
        ArrayList<Product> productList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
    SELECT DISTINCT
        Product.id, Product.category_id, Product.brand_id, Product.room_id, Product.name, Product.description, Product.staravg, Product.image, Product.price, Product.quantity, Product.status
    FROM 
        Product
    JOIN     
        ProductDetail ON Product.id = ProductDetail.product_id
    WHERE 1=1
    """);

        List<Object> parameters = new ArrayList<>();

        if (brandIDs != null && brandIDs.length > 0) {
            sql.append(" AND Product.brand_id IN (");
            appendPlaceholders(sql, brandIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(brandIDs));
        }
        if (roomIDs != null && roomIDs.length > 0) {
            sql.append(" AND Product.room_id IN (");
            appendPlaceholders(sql, roomIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(roomIDs));
        }
        if (categoryIDs != null && categoryIDs.length > 0) {
            sql.append(" AND Product.category_id IN (");
            appendPlaceholders(sql, categoryIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(categoryIDs));
        }
        if (colorIDs != null && colorIDs.length > 0) {
            sql.append(" AND ProductDetail.color_id IN (");
            appendPlaceholders(sql, colorIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(colorIDs));
        }
        String priceCondition = parsePrices(priceStrs);
        if (!priceCondition.isEmpty()) {
            sql.append(" AND (").append(priceCondition).append(")");
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
                    product.setStaravg(rs.getDouble("staravg"));
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

    public ArrayList<Product> filterProductListMKT(String[] brandIDs, String[] roomIDs, String[] categoryIDs, String[] statusStrs, String[] priceStrs) {
        ArrayList<Product> productList = new ArrayList<>();

        StringBuilder sql = new StringBuilder("""
    SELECT DISTINCT
        Product.id, Product.category_id, Product.brand_id, Product.room_id, Product.name, Product.description, Product.staravg, Product.image, Product.price, Product.quantity, Product.status
    FROM 
        Product
    JOIN 
        ProductDetail ON Product.id = ProductDetail.product_id
    WHERE 1=1
    """);

        List<Object> parameters = new ArrayList<>();

        if (brandIDs != null && brandIDs.length > 0) {
            sql.append(" AND Product.brand_id IN (");
            appendPlaceholders(sql, brandIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(brandIDs));
        }
        if (roomIDs != null && roomIDs.length > 0) {
            sql.append(" AND Product.room_id IN (");
            appendPlaceholders(sql, roomIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(roomIDs));
        }
        if (categoryIDs != null && categoryIDs.length > 0) {
            sql.append(" AND Product.category_id IN (");
            appendPlaceholders(sql, categoryIDs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(categoryIDs));
        }
        if (statusStrs != null && statusStrs.length > 0) {
            sql.append(" AND Product.status IN (");
            appendPlaceholders(sql, statusStrs.length);
            sql.append(")");
            parameters.addAll(Arrays.asList(statusStrs));
        }
        String priceCondition = parsePrices(priceStrs);
        if (!priceCondition.isEmpty()) {
            sql.append(" AND (").append(priceCondition).append(")");
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
                    product.setStaravg(rs.getDouble("staravg"));
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

    private void appendPlaceholders(StringBuilder sql, int count) {
        for (int i = 0; i < count; i++) {
            sql.append("?");
            if (i < count - 1) {
                sql.append(", ");
            }
        }
    }

    private String parsePrices(String[] priceStrs) {
        if (priceStrs == null || priceStrs.length == 0) {
            return "";
        }
        List<String> conditions = new ArrayList<>();
        for (String priceStr : priceStrs) {
            switch (priceStr) {
                case "<500":
                    conditions.add("Product.price < 500000");
                    break;
                case "500<x<1500":
                    conditions.add("Product.price BETWEEN 500000 AND 1500000");
                    break;
                case "1500<x<5000":
                    conditions.add("Product.price BETWEEN 1500000 AND 5000000");
                    break;
                case ">5000":
                    conditions.add("Product.price > 5000000");
                    break;
            }
        }
        return String.join(" OR ", conditions);
    }

    public Product getProductByID(int id) {
        Product product = null;
        String query = "SELECT * FROM product WHERE id = ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            // Đặt giá trị cho tham số trước khi thực thi truy vấn
            preparedStatement.setInt(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setCategory_id(resultSet.getInt("category_id"));
                    product.setBrand_id(resultSet.getInt("brand_id"));
                    product.setRoom_id(resultSet.getInt("room_id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setStaravg(resultSet.getDouble("staravg"));
                    product.setImage(resultSet.getString("image"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setStatus(resultSet.getString("status"));
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product by ID", e);
        }

        return product;
    }
    
    public String getProductName(int id){
        String query = "SELECT name FROM product WHERE id LIKE ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setInt(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    return resultSet.getString(1);
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product list", e);
        }
        return null;
    }
    // Phương thức để lấy danh sách sản phẩm theo id của brand hoặc category
    public List<Product> getByBrandOrCategoryId(int brandId, int categoryId) throws SQLException  {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product WHERE brand_id = ? OR category_id = ?";

        try (PreparedStatement stmt = connect.prepareStatement(query)) {
            stmt.setInt(1, brandId);
            stmt.setInt(2, categoryId);
            ResultSet rs = stmt.executeQuery();

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
                products.add(product);
            }
        }

        return products;
    }

    public static void main(String[] args) {
        Product neProduct = new Product();
        neProduct.setId(1);
        neProduct.setCategory_id(2);
        neProduct.setBrand_id(4);
        neProduct.setRoom_id(2);
        neProduct.setName("Giường Ngủ Gỗ Cao Su NEXO 301");
        neProduct.setDescription(" <b>Kích thước phủ bì:</b> 169cm X 222cm X 90cm<br/>     Chân giường cao 15cm <br/><b>Vật liệu chính:</b><br/>     - Đầu giường: Gỗ cao su tự nhiên, MDF Veneer tràm chuẩn CARB-P2 <br/>- Chân giường: Gỗ cao su tự nhiên <br/> - Thân giường: Gỗ cao su nhiên, MDF veneer tràm chuẩn CARB-P2<br/>- Tấm phản: Gỗ plywood chuẩn CARB-P2 (*)<br/><i>(*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ,<br/> đảm bảo gỗ không độc hại, an toàn cho sức khỏe</i> ");
        neProduct.setPrice(9999000.00);
        neProduct.setStaravg(5);
        neProduct.setQuantity(15);
        neProduct.setStatus("Active");
        neProduct.setImage("pro_1m6_noi_that_moho_giuong_ngu_go_nexo_6_62c16af1d98e4e91a23b258a8c448be6_master.jpg");
        ProductDAO productDAO = new ProductDAO();
        productDAO.updateProduct(neProduct);    
    }

}
