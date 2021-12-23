<%-- 
    Document   : alumnos
    Created on : 20 dic. 2021, 21:46:09
    Author     : Naranja
--%>

<%@page import="modelo.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <title>Lista de Alumnos</title>
    </head>
    <body>
        <h1>Lista de Alumnos</h1>
        <div class="container">
            <div class="row d-flex justify-content-center">
                <a class="btn btn-primary w-25 m-3" href="AlumnosController?accion=nuevo" target="target">Agregar Alumno</a>
                <table class="table table-primary">
                    <thead>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                      <% 
                            List<Alumnos> resultado = null;
                            AlumnosDAO alumno = new AlumnosDAO();
                            resultado = alumno.listarAlumnos();
                            

                            
                            for (int i = 0; i < resultado.size(); i++) {
                                    String ruta = "AlumnosController?accion=modificar&id=" + resultado.get(i).getId();
                                    String rutaE = "AlumnosController?accion=eliminar&id=" + resultado.get(i).getId();
                                
                          %>
                          <tr>
                              <td><%=resultado.get(i).getId() %></td>
                              <td><%=resultado.get(i).getNombre() %></td>
                              <td><%=resultado.get(i).getApellido()%></td>
                              <td><%=resultado.get(i).getEmail()%></td>
                              <td><%=resultado.get(i).getTel()%></td>
                              <td> <a class="text-success p-2" href=<%=ruta%>><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                   <a class="text-danger p-2" href=<%=rutaE%>><i class="fa fa-trash" aria-hidden="true"></i></a> </td>
                          </tr>
                        <%
                          }
                            String id = request.getParameter("id");
                            int mid = Integer.parseInt(id);
                            AlumnosDAO alumnosDAO = new AlumnosDAO();
                            Alumnos resultado2 = alumnosDAO.mostrarAlumno(mid);
                        %>
                    </tbody>
                </table>
            </div>   
        </div>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregarAlumno">
          Agregar alumno <i class="fa fa-plus-circle" aria-hidden="true"></i>

        </button>

        <!-- Modal nuevo.jsp -->
        <div class="modal fade" id="agregarAlumno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Agregar alumno</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
                <form class="form-floating" action="${pageContext.request.contextPath}/AlumnosController?accion=insert" method="POST">
                  <div class="modal-body">
                      <!-- Starting modal FORM nuevo.jsp -->
                    <div class="row d-flex justify-content-center">

                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="type" name="nombre" id="nombre" class="form-control" required="required" />
                            </div>
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="type" name="apellido" id="apellido" class="form-control" required="required" />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="type" name="email" id="email" class="form-control" required="required" />
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Telefono</label>
                                <input type="type" name="telefono" id="telefono" class="form-control" required="required" />
                            </div>

                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-outline-success">Agregar</button>
                  </div>
                </form>
            </div>
          </div>
        </div>
        <!-- END Modal nuevo.jsp -->
        
        <!-- Modal modificar.jsp -->
 
        <div class="modal fade" id="modificarAlumno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Modificar alumno</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
                <form class="form-floating" action="${pageContext.request.contextPath}/AlumnosController?accion=actualizar" method="POST">
                  <div class="modal-body">
                      <!-- Starting modal FORM modificar.jsp -->
                    <div class="row d-flex justify-content-center">
                        <div class="mb-3">
                            <label for="id" class="form-label">ID</label>
                            <input type="hidden" name="id" id="id" class="form-control" value=<%= resultado2.getId()%> />
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="type" name="nombre" id="nombre" class="form-control" value=<%= resultado2.getNombre()%> />
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="type" name="apellido" id="apellido" class="form-control" value=<%= resultado2.getApellido()%> />
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="type" name="email" id="email" class="form-control" value=<%= resultado2.getEmail()%> />
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="number" name="telefono" id="telefono" class="form-control" value=<%= resultado2.getTel()%> />
                        </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-outline-success">Modificar</button>
                  </div>
                </form>
            </div>
          </div>
        </div>
        <!-- END Modal modificar.jsp -->

    </body>
    <script src="https://use.fontawesome.com/c102570fa9.js"></script>


    
</html>
