/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class UserDAO extends DBContext{
    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    //user 
    public void signIn(User customer) {
        try (PreparedStatement statement = connect.prepareStatement(
                     "INSERT INTO `furniture`.`user`"
                     + "(`fullname`, `gender`, `phonenumber`, `address`, `email`, `password`, `role_id`, `status`)"
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
            statement.setString(1, customer.getFullname());
            statement.setString(2, customer.getGender());
            statement.setString(3, customer.getPhonenumber());
            statement.setString(4, customer.getAddress());
            statement.setString(5, customer.getEmail());
            statement.setString(6, customer.getPassword());
            statement.setInt(7, customer.getRole_id());
            statement.setString(8, customer.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error signing in", e);
        }
    }
    public User login(String email, String password) {
        String query = "SELECT * FROM User WHERE email = ? AND password = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
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
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error logging in", e);
        }
        return null;
    }
    
    public void resetPassword(String email, String password) {
        String mysql = "UPDATE `furniture`.`user` SET `password` = ? WHERE `email` = ?";
        try (PreparedStatement statement = connect.prepareStatement(mysql)) {
            statement.setString(1, password);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error resetting password", e);
        }
    }
    
    public Boolean checkAccount(String email) {
        String mysql = "SELECT `user`.`id` FROM `furniture`.`user` WHERE `user`.`email` = ?";
        try (PreparedStatement statement = connect.prepareStatement(mysql)) {
            statement.setString(1, email);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking account", e);
        }
        return false;
    }
    
    public void insertCustomer(String email) {
        String mysql = "INSERT INTO `furniture`.`user` "
                + "(fullname, gender, phonenumber, address, email, password, role_id, status) "
                + "SELECT fullname, gender, phonenumber, address, email, password , 1, 'active' "
                + "FROM `furniture`.`verifyaccount` "
                + "WHERE email = ?";
        try (PreparedStatement statement = connect.prepareStatement(mysql)) {
            statement.setString(1, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting customer", e);
        }
    }
}
