package DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

class UserRole {
    private int id;
    private String rolename;
    private String status;

    public UserRole(int id, String rolename, String status) {
        this.id = id;
        this.rolename = rolename;
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", rolename='" + rolename + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}

public class AdminDAO extends DBContext {

    public List<UserRole> getUserRoles() {
        List<UserRole> userRoles = new ArrayList<>();
        String query = "SELECT id, rolename, status FROM userrole";

        try {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String rolename = resultSet.getString("rolename");
                String status = resultSet.getString("status");
                UserRole userRole = new UserRole(id, rolename, status);
                userRoles.add(userRole);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userRoles;
    }

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        if (dao.connect != null) {
            System.out.println("Kết nối thành công!");
            List<UserRole> roles = dao.getUserRoles();
            for (UserRole role : roles) {
                System.out.println(role);
            }
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }
}
