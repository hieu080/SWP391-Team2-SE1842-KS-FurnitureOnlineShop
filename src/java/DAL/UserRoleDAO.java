/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.UserRole;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HELLO
 */
public class UserRoleDAO extends DBContext{
    private int id;
    private String rolename;
    private String status;

    public UserRoleDAO() {
    }

    public UserRoleDAO(String rolename, String status) {
        this.rolename = rolename;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

   public UserRole getUserRoleByID(int id) {
        UserRole userRole = null;
        String query = "SELECT * FROM user_roles WHERE id = ?";
        try (PreparedStatement ps = connect.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userRole = new UserRole();
                    userRole.setId(rs.getInt("id"));
                    userRole.setRolename(rs.getString("rolename"));
                    userRole.setStatus(rs.getString("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userRole;
    }
    
    
}
