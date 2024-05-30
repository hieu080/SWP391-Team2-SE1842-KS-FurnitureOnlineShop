/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Room;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
/**
 *
 * @author HELLO
 */
public class RoomDAO extends DBContext {

    private static final java.util.logging.Logger LOGGER = java.util.logging.Logger.getLogger(RoomDAO.class.getName());

    public ArrayList<Room> getRoomList() {
        ArrayList<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM room";

        try (PreparedStatement pstmt = connect.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String roomname = rs.getString("roomname");
                Room room = new Room(roomname);
                room.setId(id);
                roomList.add(room);
            }

        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving room list", ex);
        }

        return roomList;
    }

    // Phương thức insertRoom
    public boolean insertRoom(Room room) {
        String sql = "INSERT INTO room (roomname) VALUES (?)";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, room.getRoomname());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error inserting room", ex);
            return false;
        }
    }

    // Phương thức updateRoom
    public boolean updateRoom(Room room) {
        String sql = "UPDATE room SET roomname = ? WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setString(1, room.getRoomname());
            pstmt.setInt(2, room.getId());
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error updating room", ex);
            return false;
        }
    }

    // Phương thức deleteRoom (xóa mềm)
    public boolean deleteRoom(int roomId) {
        String sql = "UPDATE room SET status = 'Inactive' WHERE id = ?";
        try (PreparedStatement pstmt = connect.prepareStatement(sql)) {
            pstmt.setInt(1, roomId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error deleting room", ex);
            return false;
        }
    }
}
