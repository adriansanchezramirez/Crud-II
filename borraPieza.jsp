<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <!----------------------------CONEXIÓN--------------------------------->
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3", "root", "");
            Statement s = conexion.createStatement();

            s.execute("DELETE FROM piezas WHERE IdPiez=" + request.getParameter("IdPiez"));

            s.close();
        %>	
        <!---------------------------FIN DE LA CONEXÓN-------------------------->
        <script>document.location = "principal.jsp"</script> 
    </body>
</html>