/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;
import config.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Naranja
 */
public class AlumnosDAO {
    Connection conexion;
    public AlumnosDAO(){
        Conexion con = new Conexion();
        conexion = con.getConnection();
    }
    
    public List<Alumnos> listarAlumnos(){
        PreparedStatement ps;
        ResultSet rs;
        List<Alumnos> lista = new ArrayList<>();
        /*List es abstracta*/
        try{
            ps = conexion.prepareStatement("SELECT * FROM participantes");
            rs = ps.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                int tel = rs.getInt("telefono");
                
                Alumnos alumnos = new Alumnos(id, nombre, apellido, email, tel);
                lista.add(alumnos);
                
            }
            return lista;
            
        }catch(SQLException e){
            System.err.println(e.toString());
            return null;
        }

    }
    
    public Alumnos mostrarAlumno(int _id){
        PreparedStatement ps;
        ResultSet rs;
        Alumnos alumno = null;
        
        try{
            ps= conexion.prepareStatement("SELECT * FROM participantes WHERE id=?");
            ps.setInt(1, _id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                int tel = rs.getInt("telefono");
                
                alumno = new Alumnos(id, nombre, apellido, email, tel);
            } 
            return alumno;
            
        } catch (SQLException e) {
            System.err.println(e);
            return null;
        }

    }
    
    public boolean insertarAlumno(Alumnos alumno){
        PreparedStatement ps;
        
        try{
            ps = conexion.prepareStatement("INSERT INTO participantes (nombre,apellido,email,telefono) VALUES (?,?,?,?)");
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setString(3, alumno.getEmail());
            ps.setInt(4, alumno.getTel());
            ps.execute();
            return true;
        } catch (SQLException e){
            System.err.println(e.toString());
            return false;
        }
    }
    
    public boolean actualizarAlumno(Alumnos alumno) {
        PreparedStatement ps;
        
        try{
            ps = conexion.prepareStatement("UPDATE participantes SET nombre=?, apellido=?, email=?, telefono=? WHERE id=?");
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setString(3, alumno.getEmail());
            ps.setInt(4, alumno.getTel());
            ps.setInt(5, alumno.getId());
            ps.execute();
            return true;
        } catch (SQLException e){
            System.err.println(e.toString());
            return false;
        }
    }
    
    public boolean eliminarAlumno(int _id) {
        PreparedStatement ps,ps2;
        
        try{
            ps = conexion.prepareStatement("DELETE FROM participantes WHERE id=?");
            ps.setInt(1, _id);
            ps2 = conexion.prepareStatement("ALTER TABLE participantes AUTO_INCREMENT = 1;");
            ps.execute();
            ps2.execute();
            return true;
        } catch (SQLException e){
            System.err.println(e.toString());
            return false;
        }
    }
    
    public boolean ingresarUsuario(String email, String password) {
        PreparedStatement ps;
        ResultSet rs;
        
        try {
            ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()) {
                return email.equals(rs.getString("email")) && password.equals(rs.getString("password"));
            }
            return false;
            
        } catch (SQLException e) {
            System.err.println(e.toString());
            return false;
        }
    }
    
}
