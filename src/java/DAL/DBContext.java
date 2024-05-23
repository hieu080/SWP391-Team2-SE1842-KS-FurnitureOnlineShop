package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {
    protected Connection connect;
    public DBContext() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/furniture?useSSL=false";
            String username = "root";
            String password = "123456";

            // Tạo kết nối
            connect = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
//    
//    public void closeConnection() {
//        try {
//            if (connect != null && !connect.isClosed()) {
//                connect.close();
//                Logger.getLogger(DBContext.class.getName()).log(Level.INFO, "Closed connection.");
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Error closing connection.", ex);
//        }
//    }
}
