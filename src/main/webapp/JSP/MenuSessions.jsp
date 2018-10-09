<%-- 
    Document   : MenuSessions
    Created on : 08-oct-2018, 17:50:04
    Author     : fjvaz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/estilosCookies.css" />
        <title>Menu de Sesiones</title>
    </head>
    <body>
        <form action="ControlDeSessions.jsp" name="form">
		<fieldset>
                    <legend>Menú de Sesiones</legend>
				<label for='nombre' >Introduce el nombre del atributo: </label>
                                <input type="text" id="nombre" name="Nombre" required="">
                                <br><br>
                                <label for='valor' >Introduce el valor del atributo: </label>
				<input type="text" id="valor" name="Valor">
                                <br><br>
                                <input type="submit" name="Submit" id="button" value="Crear">
                                <input type="submit" name="Submit" id="button" value="Visualizar">
                                <input type="submit" name="Submit" id="button" value="Modificar">
                                <input type="submit" name="Submit" id="button" value="Eliminar">
                                <br><br><br>
                                <div class="texto">
                                    <%=session.getAttribute("mensaje")!=null? session.getAttribute("mensaje") : ""%>
                                    
                                </div>

                </fieldset>
                <br><div id='enlace'><a href="<%=request.getContextPath()%>">Volver al menú</a></div>
        </form>
        
        
        
    </body>
</html>
