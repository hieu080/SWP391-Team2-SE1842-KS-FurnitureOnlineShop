
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;

/**
 *
 * @author ADMIN
 */
public class DBContext {
    protected Connection connect;
    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(DBContext.class.getName());
    
    public DBContext() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/furniturewebshop";
            String username = "root";
            String password = "";

            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            LOGGER.log(Level.SEVERE, "Can't not connect to database", ex);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Can't not connect to database", ex);
        }
        
    }     
}
