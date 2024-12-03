/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionPro {
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb?useSSL=false", "admin", "admin123"); // Ubah "root" dan "" sesuai dengan pengaturan XAMPP Anda
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
