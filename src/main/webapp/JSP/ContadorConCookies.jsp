<%-- 
    Document   : ContadorConCookies
    Created on : 06-oct-2018, 16:00:33
    Author     : fjvaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/estilosContadorCookie.css" />
        <title>Control de cookie</title>
    </head>
    <body>
        <fieldset>
            <legend>Contador con Cookie</legend>
        <%
            Cookie[] cookies=request.getCookies();
            Cookie cookie=null;
            int posicion=-1;
            if (cookies!=null){
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals("Cookie")){
                    posicion=i;
                    break;
            }
            }
            }
            
            if(posicion!=-1){
               int contador=Integer.parseInt(cookies[posicion].getValue())+1;
               cookie=new Cookie(cookies[posicion].getName(), Integer.toString(contador));
               cookie.setMaxAge(60*60);
               response.addCookie(cookie);
            }else{
                cookie=new Cookie("Cookie", "1");
                cookie.setMaxAge(60*60);
                response.addCookie(cookie);
            }
            if(request.getParameter("Submit")!=null){
                if(request.getParameter("Submit").equals("Eliminar")){
                    cookie=new Cookie("Cookie", "0");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        %>
        <form action="ContadorConCookies.jsp" name="form">
        <h2>Número de veces que has recargado la página: <%=cookie.getValue()%></h2>
        <ul>
            <li>Caducidad: <%=cookie.getMaxAge()%></li>
            <li>Nombre: <%=cookie.getName()%></li>
            <li>Seguridad: <%=cookie.getSecure()%></li>
            <li>Version: <%=cookie.getVersion()%></li>
        </ul>
        
               <input type="submit" name="Submit" id="button" value="Recargar">
               <input type="submit" name="Submit" id="button" value="Eliminar">
               <input type="button" name="Submit" id="button" value="Menú" onclick="location.href='<%=request.getContextPath()%>'">
        </form>
                
        
        </fieldset>
        
    </body>
</html>
