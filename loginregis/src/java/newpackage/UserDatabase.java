/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;
import java.sql.*;
/**
 *
 * @author Aaron
 */

public class UserDatabase {
    Connection con;

    public UserDatabase(Connection con) {
        this.con = con;
    }

    // For registering a user
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            // Insert register data into the database
            String query = "INSERT INTO user(name, email, password) VALUES (?, ?, ?)";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
}

