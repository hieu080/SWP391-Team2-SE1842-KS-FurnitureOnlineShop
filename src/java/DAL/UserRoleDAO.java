/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.UserRole;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HELLO
 */
public class UserRoleDAO extends DBContext {

    public UserRole getUserRoleByID(int id) {
        UserRole userRole = null;
        String query = "SELECT * FROM userrole WHERE id = ?";
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

    public ArrayList<UserRole> getUserRoleList() {
        ArrayList<UserRole> userRoleList = new ArrayList<>();
        String query = "SELECT * FROM userrole";
        try (PreparedStatement ps = connect.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UserRole userRole = new UserRole();
                userRole.setId(rs.getInt("id"));
                userRole.setRolename(rs.getString("rolename"));
                userRole.setStatus(rs.getString("status"));
                
                userRoleList.add(userRole);
            }
            return userRoleList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        UserRoleDAO userRoleDAO = new UserRoleDAO();
        ArrayList<UserRole> userRoleList = userRoleDAO.getUserRoleList();
        for (UserRole userRole : userRoleList) {
            System.out.println(userRole.getRolename());
        }
    }
}
