/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/** private int id;
 *
 * @author HELLO
 */
public class SliderDAO extends DBContext{
    //CRUD Slider

    /**
     * Phương thức để thêm một slider mới vào cơ sở dữ liệu
     */
    public void addSlider(Slider slider) {
        String query = "INSERT INTO slider (image,author_id title, link, status, note) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setString(1, slider.getImage());
            preparedStatement.setInt(2, slider.getAuthor_id());
            preparedStatement.setString(3, slider.getTitle());
            preparedStatement.setString(4, slider.getLink());
            preparedStatement.setString(5, slider.getStatus());
            preparedStatement.setString(6, slider.getNotes());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Phương thức để lấy danh sách tất cả các slider từ cơ sở dữ liệu
     */
    public List<Slider> getAllSliders() {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query); ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Slider slider = new Slider(
                        resultSet.getInt("id"),
                        resultSet.getInt("author_id"),
                        resultSet.getString("title"),
                        resultSet.getString("image"),
                        resultSet.getString("link"),
                        resultSet.getString("status"),
                        resultSet.getString("note")
                );
                sliders.add(slider);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSlidersByAuthor(int author_id) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE author_id =?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setInt(1, author_id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note")
                    );
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSlidersWith(String status) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE status = ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            preparedStatement.setString(1, status);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note")
                    );
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    

    /* List slider with status and author */
    public List<Slider> getAllSlidersWith(String status, int author_id) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE status = ? AND author_id";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, author_id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note")
                    );
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSlidersBy(String condition) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE title LIKE ? OR link LIKE ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            String conditionWithWildcard = "%" + condition + "%";
            preparedStatement.setString(1, conditionWithWildcard);
            preparedStatement.setString(2, conditionWithWildcard);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note")
                    );
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSlidersAuthorBy(String condition, int author_id) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE (title LIKE ? OR link LIKE ?) AND author_id= ?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            String conditionWithWildcard = "%" + condition + "%";
            preparedStatement.setString(1, conditionWithWildcard);
            preparedStatement.setString(2, conditionWithWildcard);
            preparedStatement.setInt(3, author_id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note")
                    );
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public List<Slider> getAllSlidersWithStatusAndSearch(String status, String search) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE status = ? AND (title LIKE ? OR link LIKE ?)";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            preparedStatement.setString(1, status);
            String searchPattern = "%" + search + "%";
            preparedStatement.setString(2, searchPattern);
            preparedStatement.setString(3, searchPattern);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider();
                    slider.setId(resultSet.getInt("id"));
                    slider.setAuthor_id(resultSet.getInt("author_id"));
                    slider.setTitle(resultSet.getString("title"));
                    slider.setImage(resultSet.getString("image"));
                    slider.setLink(resultSet.getString("link"));
                    slider.setStatus(resultSet.getString("status"));
                    slider.setNotes(resultSet.getString("note"));
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sliders;
    }

    public List<Slider> getAllSlidersWithStatusAndSearch(String status, String search, int author_id) {
        List<Slider> sliders = new ArrayList<>();
        String query = "SELECT * FROM slider WHERE status = ?  AND (title LIKE ? OR link LIKE ? ) AND author_id=?";

        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {

            preparedStatement.setString(1, status);
            String searchPattern = "%" + search + "%";
            preparedStatement.setString(2, searchPattern);
            preparedStatement.setString(3, searchPattern);
            preparedStatement.setInt(4, author_id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Slider slider = new Slider();
                    slider.setId(resultSet.getInt("id"));
                    slider.setTitle(resultSet.getString("title"));
                    slider.setImage(resultSet.getString("image"));
                    slider.setLink(resultSet.getString("link"));
                    slider.setStatus(resultSet.getString("status"));
                    slider.setNotes(resultSet.getString("note"));
                    sliders.add(slider);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sliders;
    }

    /**
     * Phương thức để cập nhật một slider trong cơ sở dữ liệu
     */
    public void updateSlider(Slider slider) {
        String query = "UPDATE slider SET image = ?, title = ?, link = ?, status = ?, note = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setString(1, slider.getImage());
            preparedStatement.setString(2, slider.getTitle());
            preparedStatement.setString(3, slider.getLink());
            preparedStatement.setString(4, slider.getStatus());
            preparedStatement.setString(5, slider.getNotes());
            preparedStatement.setInt(6, slider.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Phương thức để xóa một slider từ cơ sở dữ liệu
     */
    public void deleteSlider(int id) {
        String query = "DELETE FROM slider WHERE id = ?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Phương thức để lấy một slider theo id từ cơ sở dữ liệu
     */
    public Slider getSliderById(int id) {
        String query = "SELECT * FROM slider WHERE id = ?";
        try (PreparedStatement preparedStatement = connect.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Slider(
                            resultSet.getInt("id"),
                            resultSet.getInt("author_id"),
                            resultSet.getString("title"),
                            resultSet.getString("image"),
                            resultSet.getString("link"),
                            resultSet.getString("status"),
                            resultSet.getString("note"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * Phương thức để lấy một slider theo id từ cơ sở dữ liệu
     */
}
