<%-- 
    Document   : LogOut
    Created on : 13-oct-2018, 12:17:57
    Author     : fjvaz
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int anio= LocalDate.now().getYear();
            Month mes = LocalDate.now().getMonth();
            DayOfWeek dia= LocalDate.now().getDayOfWeek();
            int numDia=LocalDate.now().getDayOfMonth();
            int hora= Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
            int minutos= Calendar.getInstance().get(Calendar.MINUTE);
            int segundos= Calendar.getInstance().get(Calendar.SECOND);
            String fecha=dia.getDisplayName(TextStyle.FULL, new Locale("es", "ES"))+", "+numDia+
                    " de "+mes.getDisplayName(TextStyle.FULL, new Locale("es", "ES"))+" de "+anio+" a las "+hora+":"+minutos+":"+segundos;
            
            fecha=fecha.replace(" ", "%20");
            fecha=fecha.replace(":", "2puntos");
            fecha=fecha.replace(",", "coma");
            response.addCookie(new Cookie("fecha", fecha));
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>