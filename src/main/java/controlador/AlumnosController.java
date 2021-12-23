/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumnos;
import modelo.AlumnosDAO;

/**
 *
 * @author Naranja
 */
@WebServlet(name = "AlumnosController", urlPatterns = {"/AlumnosController"})
public class AlumnosController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AlumnosDAO alumnosDAO = new AlumnosDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        if(accion == null || accion.isEmpty()) {
            dispatcher = request.getRequestDispatcher("Vistas/alumnos.jsp");
            
        }   else if (accion.equals("ingresar")){ // Login
            String usuario = request.getParameter("email");
            String password = request.getParameter("password");
            
            boolean ingresar;
            ingresar = alumnosDAO.ingresarUsuario(usuario, password);
            if (ingresar) {
                dispatcher = request.getRequestDispatcher("Vistas/alumnos.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/index.jsp");
            }
            
        }   else if (accion.equals("modificar")){
            dispatcher = request.getRequestDispatcher("Vistas/modificar.jsp");

        }   else if (accion.equals("actualizar")) {
            
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            int telefono = Integer.parseInt(request.getParameter("telefono"));
            
            Alumnos alumno = new Alumnos(id,nombre,apellido,email,telefono);
            alumnosDAO.actualizarAlumno(alumno);
            dispatcher = request.getRequestDispatcher("Vistas/alumnos.jsp");
            
        }   else if (accion.equals("nuevo")){
            dispatcher = request.getRequestDispatcher("Vistas/nuevo.jsp");

        }   else if (accion.equals("insert")){
            
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            int telefono = Integer.parseInt(request.getParameter("telefono"));
            
            Alumnos alumno = new Alumnos(0,nombre,apellido,email,telefono);
            alumnosDAO.insertarAlumno(alumno);
            dispatcher = request.getRequestDispatcher("Vistas/alumnos.jsp");

        }   else if (accion.equals("eliminar")){
            int id = Integer.parseInt(request.getParameter("id"));
            alumnosDAO.eliminarAlumno(id);
            dispatcher = request.getRequestDispatcher("Vistas/alumnos.jsp");
        }
        
        dispatcher.forward(request, response);
         
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
