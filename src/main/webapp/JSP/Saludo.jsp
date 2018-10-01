<%-- 
    Document   : Saludo
    Created on : 01-oct-2018, 16:58:02
    Author     : fjvaz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.time.LocalTime"%>
<!DOCTYPE html PUBLIC "‐//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/edad.css" />
        <title>Saludo</title>
    </head>
    <body>
        <%--A traves de los valores del formulario comprobamos el sexo, y mediante la hora elegimos un saludo--%>
        <%  
            String genero=request.getParameter("Sexo").equals("Mujer")? "señora " : "señor ";
            String horaSaludo="";
            if (LocalTime.now().getHour()>=8 && LocalTime.now().getHour()<=12){
                horaSaludo="Buenos dias ";
            }
            if (LocalTime.now().getHour()>=13 && LocalTime.now().getHour()<=20){
                horaSaludo="Buenas tardes ";
            }
            if (LocalTime.now().getHour()>=21 || LocalTime.now().getHour()<=7){
                horaSaludo="Buenas noches ";
            } 
        %>
        <fieldset>
        <%--Mostramos el saludo elegido, si es hombre o mujer, y el nombre del usuario--%>

        <h2 id="centrar"><%=horaSaludo%><%=genero%><%=request.getParameter("Nombre")%></h2>
        </fieldset>
        <br><div id='centrar'><a href="<%=request.getContextPath()%>">Volver al menú</a></div>
    </body>
</html>
