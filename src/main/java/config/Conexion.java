/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Naranja
 */
public class Conexion {
        
    public Connection getConnection() {
        Connection conexion = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/comision2160", "root", "");
        } catch(ClassNotFoundException | SQLException e) {
            System.out.println(e.toString());
        }
        return conexion;
    }
    /*
    public static void main(String[] args) throws SQLException {
        Connection conexion = null;
        Conexion con = new Conexion();
        conexion = con.getConnection();
        
        PreparedStatement ps;
        ResultSet rs;
        ps = conexion.prepareStatement("SELECT * FROM participantes");
        rs = ps.executeQuery();
        while (rs.next()){
            int id = rs.getInt("id");
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String email = rs.getString("email");
            int tel = rs.getInt("telefono");
            System.out.println("ID: "+id+", Nombre: "+nombre+", Apellido: "+apellido+", Email: "+email+", Telefono: "+tel);
        }    
    }*/
}
