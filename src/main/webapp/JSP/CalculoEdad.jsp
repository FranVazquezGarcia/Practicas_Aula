<%-- 
    Document   : CalculoEdad
    Created on : 01-oct-2018, 17:45:00
    Author     : fjvaz
--%>


<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
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
        <fieldset>
        <% 
           
            //Obtenemos el valor de la fecha y a partir del String obtenemos el año, mes y dia de nacimiento.
        String nacimientoString=request.getParameter("fecha");
           
        int anio=Integer.parseInt(nacimientoString.substring(0, 4));
        int mes=Integer.parseInt(nacimientoString.substring(5, 7));
        int dia=Integer.parseInt(nacimientoString.substring(8, 10));
        
        //Mediante el metodo between de Period obetenmos la diferenci entre los LocalDate de la fecha actual y la fecha de nacimiento.
        LocalDate fechaActual= LocalDate.now();
        LocalDate fechaNacimiento= LocalDate.of(anio, mes, dia);
        Period diferencia=Period.between(fechaNacimiento, fechaActual);
           
        
        //Comprobamos las condiciones que cumplen los datos introducidos para asi mostrar el mensaje de una forma u otra.
        StringBuilder cadenaFecha = new StringBuilder();
        if((!diferencia.isNegative() && !fechaActual.equals(fechaNacimiento))){
            cadenaFecha.append((request.getParameter("Nombre").equals(""))? "" : ("Hola "+request.getParameter("Nombre")+", tienes "));
  
           if(diferencia.getYears()>1){
           cadenaFecha.append(diferencia.getYears()+" años");
           }
           else if(diferencia.getYears()==1){
                 cadenaFecha.append(diferencia.getYears()+" año");
           }
           
           if(diferencia.getYears()!=0 && (diferencia.getMonths()!=0 && diferencia.getDays()!=0)){
               cadenaFecha.append(", ");
           }
           else if(diferencia.getYears()!=0 && (diferencia.getMonths()!=0)){
               cadenaFecha.append(" y ");
           }
           else if(diferencia.getYears()!=0 && (diferencia.getDays()!=0)){
               cadenaFecha.append(" y ");
           }
           
           
           if(diferencia.getMonths()>1){
           cadenaFecha.append(diferencia.getMonths()+" meses");
           }
           else if(diferencia.getMonths()==1){
                 cadenaFecha.append(diferencia.getMonths()+" mes");
           }
           
            if(diferencia.getMonths()!=0 && (diferencia.getDays()!=0)){
               cadenaFecha.append(" y ");
           }
           
            if(diferencia.getDays()>1){
           cadenaFecha.append(diferencia.getDays()+" días");
           }
           else if(diferencia.getDays()==1){
                 cadenaFecha.append(diferencia.getDays()+" día");
           }  
        }else if(fechaActual.equals(fechaNacimiento)){
            cadenaFecha.append((request.getParameter("Nombre").equals(""))? "Ha nacido hoy" : (request.getParameter("Nombre")+" ha nacido hoy"));
        }else{
               cadenaFecha.append((request.getParameter("Nombre").equals(""))? "No ha nacido todavía" : (request.getParameter("Nombre")+" no ha nacido todavía"));
        }
        cadenaFecha.append(".");
           //Muestra el mensaje
           %>
           <h2><%=cadenaFecha%></h2>
           <%
           
           
            %></fieldset>
        <br><div id='centrar'><a href="<%=request.getContextPath()%>">Volver al menú</a></div>
    </body>
</html>
