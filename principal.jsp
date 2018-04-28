<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="css/estilos.css">
        <title>Componentes Kyoya</title>
    </head>

    <body>
        <div class="todo">
            <div >
                <br><br>			
                <div>
                    <div class="uno"><h2>Componentes PC´s Kyoya</h2></div>

                    <!-------------------- FORMULARIO PARA AÑADIR Pieza --------------------------------------------------->

                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3", "root", "");
                        Statement s = conexion.createStatement();

                        ResultSet listado2 = s.executeQuery("SELECT * FROM categoria");
                    %>



                    <table class="t1">
                        <tr><th>Numero</th><th>Nombre Componente</th><th>Nombre</th><th>Descripción</th><th>Precio</th></tr>
                        <form method="get" action="grabaPieza.jsp">
                            <tr><td><input type="text" name="IdPiez" onkeypress="return valida(event)"size="5"></td>
                                <td><select name="localidad" >
                                        <%
                                  ArrayList<String> lugar = new ArrayList();
                                  lugar.add("Placa Base");
                                  lugar.add("Disco Duro");
                                  lugar.add("Tarjeta Gráfica");
                                  lugar.add("Fuente de Alimentación");
                                  lugar.add("Memoria RAM");
                                  lugar.add("Procesadores");
                                  lugar.add("Torres/Cajas/Carcasas");
                                  lugar.add("Grabadoras DVD/Blu Ray");
                        
                                      int cont = 0;
                                      for (String n : lugar) {
                                          cont++;
                                        out.println("<option value="+cont+">" + n + "</option>");
                                      }
                                    %>
                                       

                                    </select></td>

                                <td><input type="text" name="nombre" maxlength="30" maxlength="30" size="30"></td>
                                <td><input type="text" name="Descrip" maxlength="300" size="15"></td>
                                <td><input type="text" name="precio" onkeypress="return valida(event)" maxlength="6" size="5"></td>
                                <td><button type="submit" value="Añadir" class="boton"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>   
                        </form>
                        <!------------------------FIN AÑADIR PIEZA------------------------------------------------------------>





                        <!-------------------- LISTADO DE PIEZAS --------------------------------------------------->


                        <%
                            ResultSet listado = s.executeQuery("SELECT * FROM piezas");

                        %>                           

                        <%                            Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud3", "root", "");

                            while (listado.next()) {
                                out.println("<tr><td>");
                                out.println(listado.getString("IdPiez") + "</td>");

                                Statement s3 = conexion3.createStatement();
                                ResultSet tipo = s3.executeQuery("SELECT NombCat FROM categoria  WHERE IdCat ='" + listado.getString("IdCat") + "' ");

                                tipo.next();

                                String p = tipo.getString("NombCat");

                                out.println("<td>" + p + "</td>");
                                out.println("<td>" + listado.getString("nombre") + "</td>");
                                out.println("<td>" + listado.getString("Descrip") + "</td>");
                                out.println("<td>" + listado.getString("precio") + "€" + "</td>");
                        %>
                        <td>
                            <form method="get" action="modificaPieza.jsp">
                                <input type="hidden" name="IdPiez" value="<%=listado.getString("IdPiez")%>">
                                <input type="hidden" name="IdCat" value="<%=listado.getString("IdCat")%>">
                                <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
                                <input type="hidden" name="Descrip" value="<%=listado.getString("Descrip")%>">
                                <input type="hidden" name="precio" value="<%=listado.getString("precio")%>">
                                <button type="submit"  class="boton"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                            </form>
                        </td>
                        <td>
                            <form method="get" action="borraPieza.jsp">
                                <input type="hidden" name="IdPiez" value="<%=listado.getString("IdPiez")%>"/>
                                <button type="submit"class="boton">Eliminar</button>
                            </form>
                        </td></tr>
                        <%
                            }
                        %>
                    </table>
                </div>
                <!------------------------------------FIN ELIMINADO SOCIO------------------------------------->




                <div class="names">Almacén de piezas de ordenador<br></br>
                    ✆ adrisanchez39@gmail.com</div>
            </div>
        </div>       


        <!------------------------------------FUNCIONES------------------------------------->
        <script>
            function valida(e) {
                tecla = (document.all) ? e.keyCode : e.which;

                //Tecla de retroceso para borrar, siempre la permite
                if (tecla == 8) {
                    return true;
                }

                // Patron de entrada, en este caso solo acepta numeros
                patron = /[0-9-.]/;
                tecla_final = String.fromCharCode(tecla);
                return patron.test(tecla_final);
            }
        </script>




        <!------------------------------------FIN FUNCIONES------------------------------------->





    </body>
</html>