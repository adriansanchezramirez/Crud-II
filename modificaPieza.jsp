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
        <% request.setCharacterEncoding("UTF-8");%>
        <div>

            <br><br>
            <div>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3", "root", "");
                    Statement s2 = conexion2.createStatement();

                    ResultSet listado2 = s2.executeQuery("SELECT * FROM categoria");
                %>
                <div class="names2">Modificación de componentes</div>
                <form method="get" action="grabaPiezaModificada.jsp">
                    <div class="names"> 
                        <label>&nbsp;&nbsp;Numero:&nbsp;</label><input type="text" size="5" name="IdPiez" value="<%= Integer.valueOf(request.getParameter("IdPiez"))%>" readonly>
                    </div>
                    <div class="names">
                        <td><select name="IdCat" >
                                <%
                                    while (listado2.next()) {
                                        out.println("<option value='" + listado2.getString("IdCat") + "'>" + listado2.getString("NombCat") + "</option>");
                                    }
                                %>

                            </select></td>
                    </div>
                    <!-----------------------------------FORMULARIO---------------------------------------------------->
                    <div class="names">
                        <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="30" name="nombre" value="<%= request.getParameter("nombre")%>">
                        <label>&nbsp;&nbsp;Descripción&nbsp;</label><input type="text" size="15" name="Descrip" value="<%= request.getParameter("Descrip")%>">
                    </div>
                    <div class="names">
                        <label>&nbsp;&nbsp;Precio:&nbsp;</label><input type="text" name="precio" size="5" value="<%= Double.valueOf(request.getParameter("precio"))%>">
                    </div>
                    <hr>
                    <button <a href="principal.jsp" class="t1" type="submit">Cancelar</button</a>
                    <button class="t1" type="submit">Aceptar</button><br><br>
                </form>
            </div>
        </div>
    </body>
</html>
