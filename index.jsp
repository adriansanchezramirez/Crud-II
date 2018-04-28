
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Componentes Kyoya</title>


        <link href="css/newcss.css" rel="stylesheet"/>
    </head>
    <body>
        
       <div id="base">
        <form method="get" action="sesion.jsp">
            <div class="login">
            <div id="triangle"></div>
	<div id="titulo"> Iniciar Sesión</div>
        <form method="post">
        <input class="input" type="text" name="u" placeholder="Usuario" required="required">
    <input class="input" type="password" name="p" placeholder="Contaseña" required="required">
     <br>
		<input class="boton1" type="reset" value="Limpiar">
    <input class="boton2" type="submit" value="Enviar">
    </form>
 	 </div>
    <div></div>
	</div>
        </form>
   
</div>
    </body>
</html>