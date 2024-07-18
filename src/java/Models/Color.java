/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HELLO
 */
public class Color {
    private int id;
    private String colorname;
    private String colorcode;
    private String status;

    public Color() {
    }

    public Color(String colorname, String colorcode) {
        this.colorname = colorname;
        this.colorcode = colorcode;
        this.status = "Inactive";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColorname() {
        return colorname;
    }

    public void setColorname(String colorname) {
        this.colorname = colorname;
    }

    public String getColorcode() {
        return colorcode;
    }

    public void setColorcode(String colorcode) {
        this.colorcode = colorcode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Color{" + "id=" + id + ", colorname=" + colorname + ", colorcode=" + colorcode + ", status=" + status + '}';
    }
    
    
}
