/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author HELLO
 */
import Models.Page;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

public class PageDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(PageDAO.class.getName());

//    public static void main(String[] args) {
//        PageDAO pageDAO = new PageDAO();
//        ArrayList<Page> pageList = pageDAO.getPageList();
//        for (Page page : pageList) {
//            System.out.println(page.toString());
//        }
//    }
//    
    // Phương thức getPageList
    public ArrayList<Page> getPageList() {
        ArrayList<Page> pageList = new ArrayList<>();
        String sql = "SELECT * FROM page";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); 
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                int authorId = rs.getInt("author_id");
                String name = rs.getString("name");
                String content = rs.getString("content");
                Page page = new Page(authorId, name, content);
                page.setId(id);
                pageList.add(page);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving page list", ex);
        }

        return pageList;
    }

    // Phương thức insertPage
    public boolean insertPage(Page page) {
        String sql = "INSERT INTO page (author_id, name, content) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, page.getAuthor_id());
            pstmt.setString(2, page.getName());
            pstmt.setString(3, page.getContent());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error inserting page", ex);
            return false;
        }
    }

    // Phương thức updatePage
    public boolean updatePage(Page page) {
        String sql = "UPDATE page SET author_id = ?, name = ?, content = ? WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, page.getAuthor_id());
            pstmt.setString(2, page.getName());
            pstmt.setString(3, page.getContent());
            pstmt.setInt(4, page.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error updating page", ex);
            return false;
        }
    }

    // Phương thức deletePage
    public boolean deletePage(int pageId) {
        String sql = "DELETE FROM page WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, pageId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error deleting page", ex);
            return false;
        }
    }
}

