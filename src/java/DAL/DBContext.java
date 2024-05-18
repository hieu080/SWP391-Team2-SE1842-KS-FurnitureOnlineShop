package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connect;
    public DBContext() {
        try {
            String url = "jdbc:mysql://localhost:3306/furniture?useSSL=false";
            String username = "root";
            String password = "123456";
            
            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
