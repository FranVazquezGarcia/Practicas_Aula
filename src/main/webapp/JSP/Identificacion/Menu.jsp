<%-- 
    Document   : Menu
    Created on : 13-oct-2018, 12:17:49
    Author     : fjvaz
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/CSS/identificacion.css" />
        <title>Menu</title>
    </head>
    <body>
        <fieldset>
                    <legend>Menú de usuario</legend>
        <%HttpSession miSesion= request.getSession();
        
        
            Cookie[] cookies=request.getCookies();
            String fecha= new String();
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals("fecha")){
                    fecha=cookies[i].getValue();
                    fecha=fecha.replaceAll("%20", " ");
                    fecha=fecha.replaceAll("2puntos", ":");
                    fecha=fecha.replaceAll("coma", ",");
                    break;
                }
            }
            


      
        %>
        <h1>Menu de usuario de <%=request.getParameter("nombre")%> </h1>
        
        <p><%=fecha.equals("")?"Es la primera vez que se inicia sesión" : "Última vez que se inició sesión: "+fecha%></p>
        
        <input type="button" name="Submit" id="button" value="Cerrar Sesión" onclick="location.href='LogOut.jsp'">
        </fieldset>
    </body>
</html>
