/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.CustomerChanges;
import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HELLO
 */
public class UserDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());
    
//    public static void main(String[] args) {
//        UserDAO userDAO = new UserDAO();
//        ArrayList<User> userList = userDAO.getUserList();
//        for (User user : userList) {
//            System.out.println(user.getFullname());
//        }
//    }
    public ArrayList<User> getUserList() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM User";

        try (
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery()
        ) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setAvatar(rs.getString("avatar"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                u.setStatus(rs.getString("status"));

                userList.add(u);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving user list", ex);
        }

        return userList;
    }
    
    public boolean changePass(String uid, String pass) {
        try {
            String sql = "UPDATE `furniture`.`User` SET `password` = ? WHERE `id` = ?";
            try (PreparedStatement stm = connect.prepareStatement(sql)) {
                stm.setString(1, pass);
                stm.setString(2, uid);
                stm.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error changing password", e);
            return false;
        }
    }

    public boolean checkVerifyEmail(String email) {
        String mysql = "SELECT COUNT(*) FROM furniture.verifyaccount WHERE email = ?";
        try (PreparedStatement statement = connect.prepareStatement(mysql)) {
            statement.setString(1, email);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking verified email", e);
        }
        return false;
    }

    public void insertVerifyCustomer(String fullname, String gender, String phonenumber, String address, String email, String password) {
        String mysql = """
                       INSERT INTO `furniture`.`verifyaccount`
                       (`fullname`,
                       `gender`,
                       `phonenumber`,
                       `address`,
                       `email`,
                       `password`,
                       `time`)
                       VALUES
                       (?,?,?,?,?,?,current_timestamp);""";
        try (
                PreparedStatement statement = connect.prepareStatement(mysql)) {
            statement.setString(1, fullname);
            statement.setString(2, gender);
            statement.setString(3, phonenumber);
            statement.setString(4, address);
            statement.setString(5, email);
            statement.setString(6, password);

            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error inserting verify customer", e);
        }
    }

    public User getUserbyID(String id) {
        String sql = "SELECT * from User where id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setAvatar(rs.getString("avatar"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                u.setStatus(rs.getString("status"));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

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

    public User getUserByID(int id) {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
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
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public String update(String fullname, String gender, String avatar, String phonenumber, String address, int uid) {
        String sql = "UPDATE User SET fullname = ?, gender = ?, avatar = ?, phonenumber = ?, address = ? WHERE id = ?";
        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, fullname);
            stm.setString(2, gender);
            stm.setString(3, avatar);
            stm.setString(4, phonenumber);
            stm.setString(5, address);
            stm.setInt(6, uid);

            stm.executeUpdate();
            return "Update successful: " + sql;
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }

    public User getUserById(int uid) {
        try (PreparedStatement stm = connect.prepareStatement("SELECT * FROM user WHERE id = ?")) {
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<User> getMarketerList() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM User u, UserRole ur where "
                + "u.role_id=ur.id and ur.rolename='Marketing'";

        try (
                PreparedStatement statement = connect.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setAvatar(rs.getString("avatar"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                u.setStatus(rs.getString("status"));

                userList.add(u);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving user list", ex);
        }

        return userList;
    }

    //get list of customer user
    public ArrayList<User> getCustomerList() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM User u, UserRole ur where "
                + "u.role_id=ur.id and ur.rolename='Customer'";

        try (
                PreparedStatement statement = connect.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setAvatar(rs.getString("avatar"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                u.setStatus(rs.getString("status"));

                userList.add(u);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving user list", ex);
        }

        return userList;
    }

    //get list customer by status filter
    public ArrayList<User> getCustomerListbyStatus(String status) {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM User u, UserRole ur where "
                + "u.role_id=ur.id and ur.rolename='Customer' and u.status=?";

        try (
                PreparedStatement statement = connect.prepareStatement(sql);) {
            statement.setString(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setGender(rs.getString("gender"));
                u.setAvatar(rs.getString("avatar"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole_id(rs.getInt("role_id"));
                u.setStatus(rs.getString("status"));

                userList.add(u);
            }
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving user list", ex);
        }

        return userList;
    }

    ///tao tai khoan cho khach hang (marketing)
    public boolean createAcc(String fullname, String gender, String phone, String add, String email, String pass) {
        String sql = "INSERT INTO `furniture`.`user`\n"
                + "(`fullname`,\n"
                + "`gender`,\n"
                + "`phonenumber`,\n"
                + "`address`,\n"
                + "`email`,\n"
                + "`password`,\n"
                + "`role_id`,\n"
                + "`status`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "1,\n"
                + "'active')";
        if (checkAccount(email)) {
            return false;
        }
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, fullname);
            statement.setString(2, gender);
            statement.setString(3, phone);
            statement.setString(4, add);
            statement.setString(5, email);
            statement.setString(6, pass);

            statement.executeUpdate();

            return true;
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving user list", ex);
        }
        return false;
    }

    //update account cua khach hang(mkt)
    public boolean updateCustomer(String id, String name, String gender, String phone, String add, String email) {
        String sql = "UPDATE `furniture`.`user`\n"
                + "SET\n"
                + "`fullname` = ?,\n"
                + "`gender` = ?,\n"
                + "`phonenumber` = ?,\n"
                + "`address` = ?,\n"
                + "`email` = ?\n"
                + "WHERE `id` = ?";
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, gender);
            statement.setString(3, phone);
            statement.setString(4, add);
            statement.setString(5, email);
            statement.setString(6, id);

            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    /// lay danh sach status
    public List<String> getListStatus() {
        String sql = "select distinct status from user";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String s = "";
                s = rs.getString("status");
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    //lay ra danh sach customerchanges by customerid
    public List<CustomerChanges> getListCustomerChangesbyId(String id){
        String sql= "select * from customerchanges where customer_id=?";
        List<CustomerChanges> list = new ArrayList<>();
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CustomerChanges cc = new CustomerChanges();
                cc.setFullname(rs.getString("fullname"));
                cc.setEmail(rs.getString("email"));
                cc.setAddress(rs.getString("address"));
                cc.setPhone(rs.getString("phone"));
                cc.setGender(rs.getString("gender"));
                cc.setUpdatedby(rs.getInt("updatedby"));
                cc.setUpdateddate(rs.getString("updateddate"));
                list.add(cc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        
    }
    

    //cap nhat vao bang customerchanges sau khi update
    public void addToCustomerChanges(CustomerChanges cc) {
        String sql = "INSERT INTO `furniture`.`customerchanges`\n"
                + "(`email`,\n"
                + "`fullname`,\n"
                + "`gender`,\n"
                + "`phone`,\n"
                + "`address`,\n"
                + "`updatedby`,\n"
                + "`customer_id`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        
        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, cc.getEmail());
            statement.setString(2, cc.getFullname());
            statement.setString(3, cc.getGender());
            statement.setString(4, cc.getPhone());
            statement.setString(5, cc.getAddress());
            statement.setInt(6, cc.getUpdatedby());
            statement.setInt(7, cc.getCustomer_id());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String getUserNameByID(int id) {
        String query = "SELECT fullname FROM user WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserById1(int uid) {
        try (PreparedStatement stm = connect.prepareStatement("SELECT * FROM user WHERE id = ?")) {
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
