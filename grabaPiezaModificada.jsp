<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="css/estilos.css">
        <title>Componentes Kyoya</title>
    </head>
    <body>
        <div class="opcion"><h2>Actualizacion completada</h2></div>
        <STYLE>A {text-decoration: none;} </STYLE>
        
        <!------------------------------CONEXIÓN-------------------------------->
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3", "root", "");
            Statement s = conexion.createStatement();

            request.setCharacterEncoding("UTF-8");

            String actualizacion = "UPDATE piezas SET "
                    + "IdCat='" + request.getParameter("IdCat")
                    + "', nombre='" + request.getParameter("nombre")
                    + "', Descrip='" + request.getParameter("Descrip")
                    + "', precio=" + Double.valueOf(request.getParameter("precio"))
                    + " WHERE IdPiez=" + Integer.valueOf(request.getParameter("IdPiez"));
            s.execute(actualizacion);

            conexion.close();
        %>
        
        <!----------------------FIN DE LA CONEXIÓN------------------------------>
        <br>
        <div class="opcion">
            <a href="principal.jsp" type="submit" >Página principal</a>
        </div>
    </body>
</html>