/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Room {
    private int id;
    private String Roomname;

    public Room() {
    }

    public Room(String roomname) {
        this.Roomname = roomname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomname() {
        return Roomname;
    }

    public void setRoomname(String roomname) {
        this.Roomname = roomname;
    }
    
    
}
