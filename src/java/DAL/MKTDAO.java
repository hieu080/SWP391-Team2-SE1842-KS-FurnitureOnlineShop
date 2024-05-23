/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Product;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class MKTDAO extends DBContext{
    private static final Logger LOGGER = Logger.getLogger(MKTDAO.class.getName());
    public boolean addProduct(Product product) {
        PreparedStatement preparedStatement = null;

        try {
            String query = "INSERT INTO product (category_id, brand_id, name, description, image, price, quantity, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connect.prepareStatement(query);
            preparedStatement.setInt(1, product.getCategory_id());
            preparedStatement.setInt(2, product.getBrand_id());
            preparedStatement.setString(3, product.getName());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setDouble(6, product.getPrice());
            preparedStatement.setInt(7, product.getQuantity());
            preparedStatement.setString(8, product.getStatus());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding product", e);
            return false;
        }
    }
}
