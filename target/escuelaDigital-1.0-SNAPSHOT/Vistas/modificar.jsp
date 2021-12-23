<%-- 
    Document   : modificar
    Created on : 20 dic. 2021, 21:46:30
    Author     : Naranja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Modificar Alumno</title>
    </head>
    <body>
        <%
          String id = request.getParameter("id");
          int mid = Integer.parseInt(id);
          AlumnosDAO alumnosDAO = new AlumnosDAO();
          Alumnos resultado = alumnosDAO.mostrarAlumno(mid);
        %>
        <h1 class="text-center">Modificar Alumno</h1>
        <div class="container">
            <div class="row d-flex justify-content-center">
                <form class="p-5 w-50" action="AlumnosController?accion=actualizar" method="POST">
                    <div class="mb-3">
                        <label for="id" class="form-label">ID</label>
                        <input type="hidden" name="id" id="id" class="form-control" value=<%= resultado.getId()%> />
                    </div>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="type" name="nombre" id="nombre" class="form-control" value=<%= resultado.getNombre()%> />
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="type" name="apellido" id="apellido" class="form-control" value=<%= resultado.getApellido()%> />
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="type" name="email" id="email" class="form-control" value=<%= resultado.getEmail()%> />
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Telefono</label>
                        <input type="number" name="telefono" id="telefono" class="form-control" value=<%= resultado.getTel()%> />
                    </div>
                    <button type="submit" class="btn btn-primary">Modificar</button>
                </form>
            </div>
        </div>
    </body>
</html>