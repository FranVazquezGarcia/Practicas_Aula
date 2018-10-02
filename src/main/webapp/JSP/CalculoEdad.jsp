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
           
            //Obtenemos el valor de la fecha y a partir del String obtenemos el año, mes y dia de nacimiento.
           String nacimientoString=request.getParameter("fecha");
           
           int anio=Integer.parseInt(nacimientoString.substring(0, 4));
           int mes=Integer.parseInt(nacimientoString.substring(5, 7));
           int dia=Integer.parseInt(nacimientoString.substring(8, 10));
          
           //Obtenemos la fecha actual y creamos otra variable calendar estableciendole en el dia me y año el valor actual menos el de nacimiento, asi se calcula automaticamente.
           Calendar fechaActual=Calendar.getInstance();
           Calendar fechaNacimiento=new GregorianCalendar(fechaActual.get(Calendar.YEAR)-anio, (fechaActual.get(Calendar.MONTH)+1)-mes, fechaActual.get(Calendar.DAY_OF_MONTH)-dia);
           String saludo;
           //El calendar no guarda como valor de año 0, asique el año lo calculamos en una variable aparte.
           int anyo=fechaActual.get(Calendar.YEAR)-anio;


           %><fieldset><%
           
           //Comprobamos con unas condiciones if si no ha nacido aun, si ha nacido hoy o si ya ha nacido, en este ultimo caso muestra los dias, meses y años que tiene.
           if(anio>fechaActual.get(Calendar.YEAR) || (anio==fechaActual.get(Calendar.YEAR) && mes>fechaActual.get(Calendar.MONTH)+1) || (anio==fechaActual.get(Calendar.YEAR) && mes==fechaActual.get(Calendar.MONTH)+1 && dia>fechaActual.get(Calendar.DAY_OF_MONTH))){
               saludo=(request.getParameter("Nombre").equals(""))? "N" : (""+request.getParameter("Nombre")+" n");
               %><h2 id="centrar"><%=saludo%>o ha nacido todavía.</h2><%
           }else{
                if((anio==fechaActual.get(Calendar.YEAR) && mes==fechaActual.get(Calendar.MONTH)+1 && dia==fechaActual.get(Calendar.DAY_OF_MONTH))){
                saludo=(request.getParameter("Nombre").equals(""))? "H" : (""+request.getParameter("Nombre")+" h");
               %><h2 id="centrar"><%=saludo%>a nacido hoy</h2><%
                }else{
                
                 saludo=(request.getParameter("Nombre").equals(""))? "T" : ("Hola "+request.getParameter("Nombre")+", t");
               %><h2 id="centrar"><%=saludo%>ienes <%=anyo%> años, <%=fechaNacimiento.get(Calendar.MONTH)%> meses y <%=fechaNacimiento.get(Calendar.DAY_OF_MONTH)%> días.</h2><%
                }
            }
            
            %></fieldset>
        <br><div id='centrar'><a href="<%=request.getContextPath()%>">Volver al menú</a></div>
    </body>
</html>
