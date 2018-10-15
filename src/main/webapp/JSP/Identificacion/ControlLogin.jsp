<%-- 
    Document   : ControlLogin
    Created on : 13-oct-2018, 12:17:03
    Author     : fjvaz
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ControlLogin</title>
    </head>
    <body>
        <%
            String nombre=request.getParameter("nombre");
            String contra=request.getParameter("contra");
            Boolean recordar=(request.getParameter("recordar")==null? false : true);
            HttpSession miSesion= request.getSession();
            miSesion.setAttribute("Fran", "12345");
            //Compruebo si el usuario introducido por el usuario existe o no.
            Enumeration atributos = miSesion.getAttributeNames();
            boolean correcto=false;
            //Compruebo si el atributo introducido por el usuario existe o no, si existe boolean existe sera igual a true.
            // EN ESTE CASO NO TIENES PORQUE BUSCAR EL ATRIBUTO SOLO TIENES QUE PREGUNTAR SI LO QUE TE VIENE ES IGUAL TU_USER Y TU_PASSWORD 
            while (atributos.hasMoreElements()) { // TE FALTARIA LA CONDICIÓN && !correcto
                String atributo=(String)atributos.nextElement();
                if (atributo.equals(nombre)){
                    if (contra.equals(miSesion.getAttribute(atributo)))
                    correcto=true;
                }
            }
            // NO ESTÁ BIEN PLANTEADO. SI ESTÁ ACTIVADO recordar SE HACE EL PROCESO DE LA COOKIE Y SINO NADA
            // UNA VEZ QUE EL USUARIO SE RECUERDA LO HARÁ SIEMPRE HASTA QUE DESAPAREZCA LA COOKIE
            if(correcto){
                Cookie cookieRecordar=new Cookie("NombreUsuario", nombre);
                if(recordar){
                    response.addCookie(cookieRecordar);
                }else{
                    cookieRecordar.setMaxAge(0);
                    response.addCookie(cookieRecordar);
                }
                miSesion.removeAttribute("error");
                response.sendRedirect("Menu.jsp?nombre="+nombre);
            }else{
                miSesion.setAttribute("error", "Los datos introducidos no son correctos.");
                response.sendRedirect("Login.jsp");
            }
            
            %>
    </body>
</html>
