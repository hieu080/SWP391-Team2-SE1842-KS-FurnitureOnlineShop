import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import DAL.UserDAO;
import Models.User;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.CsvSource;

public class UserDAOTest {

    private UserDAO userDAO;

    @BeforeEach
    public void setUp() {
        userDAO = new UserDAO(); // Khởi tạo đối tượng UserDAO trước mỗi test case
    }

    @ParameterizedTest
    @MethodSource("userListProvider")
    @DisplayName("Test getUserList method with different user lists")
    public void testGetUserList(List<User> expectedUsers) {
        // Assuming the database is already populated with expectedUsers data
        ArrayList<User> actualUsers = userDAO.getUserList();

        assertNotNull(actualUsers, "User list should not be null");
        assertEquals(expectedUsers.size(), actualUsers.size(), "User list size should match");

        for (int i = 0; i < expectedUsers.size(); i++) {
            User expected = expectedUsers.get(i);
            User actual = actualUsers.get(i);
            assertEquals(expected.getId(), actual.getId(), "User ID should match");
            assertEquals(expected.getFullname(), actual.getFullname(), "Fullname should match");
            assertEquals(expected.getGender(), actual.getGender(), "Gender should match");
            assertEquals(expected.getAvatar(), actual.getAvatar(), "Avatar should match");
            assertEquals(expected.getPhonenumber(), actual.getPhonenumber(), "Phone number should match");
            assertEquals(expected.getAddress(), actual.getAddress(), "Address should match");
            assertEquals(expected.getEmail(), actual.getEmail(), "Email should match");
            assertEquals(expected.getPassword(), actual.getPassword(), "Password should match");
            assertEquals(expected.getRole_id(), actual.getRole_id(), "Role ID should match");
            assertEquals(expected.getStatus(), actual.getStatus(), "Status should match");
        }
    }

    static Stream<List<User>> userListProvider() {
        return Stream.of(
            List.of(
                new User(1, "John Doe", "Male", "avatar1.jpg", "123456789", "123 Street", "john@example.com", "password1", 1, "active"),
                new User(2, "Jane Smith", "Female", "avatar2.jpg", "987654321", "456 Avenue", "jane@example.com", "password2", 2, "active")
            ),
            List.of(
                new User(3, "Alice Johnson", "Female", "avatar3.jpg", "111111111", "789 Boulevard", "alice@example.com", "password3", 3, "inactive"),
                new User(4, "Bob Brown", "Male", "avatar4.jpg", "222222222", "1010 Lane", "bob@example.com", "password4", 4, "inactive")
            )
            // Add more test cases as needed
        );
    }
    // Test case dùng để kiểm tra phương thức getUserbyID
    @ParameterizedTest
    @MethodSource("provideUserIDs")
    @DisplayName("Test getUserbyID method")
    public void testGetUserbyID(int id) {
        User user = userDAO.getUserbyID(String.valueOf(id));
        assertNotNull(user);
        assertEquals(id, user.getId());
    }

    // Phương thức cung cấp dữ liệu cho test case testGetUserbyID
    private static Stream<Integer> provideUserIDs() {
        return Stream.of(1, 2, 3); // Các ID người dùng mẫu để test
    }

    // Test case dùng để kiểm tra phương thức changePass
    @ParameterizedTest
    @MethodSource("provideUserDataForChangePass")
    @DisplayName("Test changePass method")
    public void testChangePass(String uid, String newPass) {
        boolean result = userDAO.changePass(uid, newPass);
        assertTrue(result);
        // Kiểm tra lại rằng mật khẩu đã được thay đổi thành công
        User user = userDAO.getUserbyID(uid);
        assertNotNull(user);
        assertEquals(newPass, user.getPassword());
    }

    // Phương thức cung cấp dữ liệu cho test case testChangePass
    private static Stream<Arguments> provideUserDataForChangePass() {
        return Stream.of(
            Arguments.of("1", "newpassword1"),
            Arguments.of("2", "newpassword2"),
            Arguments.of("3", "newpassword3")
        );
    }

     @ParameterizedTest
    @CsvSource({
        "john@example.com, password1, 1, John Doe, Male, avatar1.jpg, 123456789, 123 Street, john@example.com, password1, 1, active",
        "jane@example.com, password2, 2, Jane Smith, Female, avatar2.jpg, 987654321, 456 Avenue, jane@example.com, password2, 2, active",
        "invalid@example.com, wrongpassword, , , , , , , , , , " // Case with invalid credentials
    })
    @DisplayName("Test login method with different email and password combinations")
    public void testLogin(String email, String password, Integer id, String fullname, String gender, String avatar, String phonenumber, String address, String expectedEmail, String expectedPassword, Integer role_id, String status) {
        User actualUser = userDAO.login(email, password);

        if (id == null) {
            assertNull(actualUser, "User should be null for invalid credentials");
        } else {
            assertNotNull(actualUser, "User should not be null for valid credentials");
            assertEquals(id.intValue(), actualUser.getId(), "User ID should match");
            assertEquals(fullname, actualUser.getFullname(), "Fullname should match");
            assertEquals(gender, actualUser.getGender(), "Gender should match");
            assertEquals(avatar, actualUser.getAvatar(), "Avatar should match");
            assertEquals(phonenumber, actualUser.getPhonenumber(), "Phone number should match");
            assertEquals(address, actualUser.getAddress(), "Address should match");
            assertEquals(expectedEmail, actualUser.getEmail(), "Email should match");
            assertEquals(expectedPassword, actualUser.getPassword(), "Password should match");
            assertEquals(role_id.intValue(), actualUser.getRole_id(), "Role ID should match");
            assertEquals(status, actualUser.getStatus(), "Status should match");
        }
    }
    

}
