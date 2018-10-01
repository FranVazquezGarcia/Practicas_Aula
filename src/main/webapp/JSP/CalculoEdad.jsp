<%-- 
    Document   : CalculoEdad
    Created on : 01-oct-2018, 17:45:00
    Author     : fjvaz
--%>


<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
        <%--Obtenemos el dia, mes y año de nacimiento en format--%>
        <% 
           

           String nacimientoString=request.getParameter("fecha");
           int anio=Integer.parseInt(nacimientoString.substring(0, 4));
           int mes=Integer.parseInt(nacimientoString.substring(5, 7));
           int dia=Integer.parseInt(nacimientoString.substring(8, 10));
          
           
           Calendar fechaActual=Calendar.getInstance();
           Calendar fechaNacimiento=new GregorianCalendar(fechaActual.get(Calendar.YEAR)-anio, (fechaActual.get(Calendar.MONTH)+1)-mes, fechaActual.get(Calendar.DAY_OF_MONTH)-dia);
           String saludo=(request.getParameter("Nombre").equals(""))? "T" : ("Hola "+request.getParameter("Nombre")+", t");
           
        %>
        <fieldset>
        <h2 id="centrar"><%=saludo%>ienes <%=fechaNacimiento.get(Calendar.YEAR)%> años, <%=fechaNacimiento.get(Calendar.MONTH)%> meses y <%=fechaNacimiento.get(Calendar.DAY_OF_MONTH)%> días.</h2>
        </fieldset>
        <br><div id='centrar'><a href="<%=request.getContextPath()%>">Volver al menú</a></div>
    </body>
</html>
