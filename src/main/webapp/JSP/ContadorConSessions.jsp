<%-- 
    Document   : ContadorConSessions
    Created on : 09-oct-2018, 12:59:28
    Author     : fjvaz
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/estilosContadorCookie.css" />
        <title>Contador con sessions</title>
    </head>
    <body>
        <fieldset>
            <legend>Contador con Sessions</legend>
            <%
            Enumeration atributos = session.getAttributeNames();
            
            boolean existe=false;
            //comprobamos si existe el atributo llamado contador
            while (atributos.hasMoreElements()) {
                String nombreAtributos = (String) atributos.nextElement();
                if (nombreAtributos.equals("contador")){
                    existe=true;
                }
            }
            //si existe le suma 1 al valor
            if (existe){
                int valor=(int)session.getAttribute("contador")+1;
                session.setAttribute("contador", valor);
            //si no existe lo crea
            }else{
                session.setAttribute("contador", 1);
            }
            
            //Para que no salte un error comprobamos el check solo si no es null
            if(request.getParameter("check")!=null){
                if(request.getParameter("check").equals("Eliminar")){
                    session.removeAttribute("contador");
            }

            }
            %>
            <form action="ContadorConSessions.jsp" name="form">
                <%Http sesion%>
        <h2><%=sesion.getAttribute("mensaje")!=null? sesion.getAttribute("contador"): ""%></h2>
        <input type="submit" name="Submit" id="button" value="Recargar">
        <input type="checkbox" name="check" id="button" value="Eliminar">Eliminar
        <input type="button" name="Submit" id="button" value="Menú" onclick="location.href='<%=request.getContextPath()%>'">
        </form>
        </fieldset>
    </body>
</html>
