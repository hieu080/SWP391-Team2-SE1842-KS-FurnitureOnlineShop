/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Brand;
import Models.Page;
import Models.Product;
import Models.Room;
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

        try (PreparedStatement pstmt = connect.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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

        try (PreparedStatement pstmt = connect.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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

        try (PreparedStatement pstmt = connect.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

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
    
    public static void main(String[] args) {
        ArrayList<Brand> list = new ArrayList<>();
        CustomerDAO dao = new CustomerDAO();
        list = dao.getBrandList();
        for (Brand product1 : list) {
            System.out.println(product1.getBrandname());
        }
    }
}
