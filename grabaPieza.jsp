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
      <!-----------------------------CONEXION----------------------------------->
      
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      //---------------------COMPROBACÓN DE LA TARJETA--------------------------
      
  

      String consultaNumSocio = "SELECT * FROM piezas WHERE IdPiez="
                                + Integer.valueOf(request.getParameter("IdPiez"));      
      
      ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);
      numeroDeSocios.last();
      
      if (numeroDeSocios.getRow() != 0) {
        out.println("Lo siento, no se ha podido crear "
                    + request.getParameter("IdPiez") + ".");
      } else {
        String insercion = "INSERT INTO piezas VALUES (" 
                           + Integer.valueOf(request.getParameter("IdPiez"))
                           + ", '" + Integer.valueOf(request.getParameter("localidad"))
                           + "', '" + request.getParameter("nombre")
                           + "', '" + request.getParameter("Descrip")
                           + "', " + Double.valueOf(request.getParameter("precio")) + ")";
        s.execute(insercion);

        
      }
      conexion.close();
    %>
    
    
    <!------------------------FIN DE LA CONEXIÓN----------------------------->
    
    
    <br>
    <div class="opcion">
      <h2>Componente actualizado correctamente.</h2><br>
    <a href="principal.jsp"><span></span> Inicio </a>
    </div>
  </body>
</html>