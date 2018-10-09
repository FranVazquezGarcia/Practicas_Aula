<%-- 
    Document   : ControlDeSessions
    Created on : 08-oct-2018, 17:54:46
    Author     : fjvaz
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de sessions</title>
    </head>
    <body>
        <%
            StringBuilder mensaje=new StringBuilder();
            String nombre=request.getParameter("Nombre");
            String valor=request.getParameter("Valor");
            
            
            //Compruebo si el atributo introducido por el usuario existe o no.
            Enumeration atributos = session.getAttributeNames();
            boolean existe=false;
            //Compruebo si el atributo introducido por el usuario existe o no, si existe boolean existe sera igual a true.
            while (atributos.hasMoreElements()) {
                String nombreAtributos = (String) atributos.nextElement();
                if (nombreAtributos.equals(nombre)){
                    existe=true;
                }
            }
            //Si existe el atributo
            if(existe){
                if(request.getParameter("Submit").equals("Visualizar")){
                    mensaje.append("El atributo: "+nombre+" tiene el valor: "+session.getAttribute(nombre));
                }else if(request.getParameter("Submit").equals("Modificar")){
                    if(valor.equals("")){
                        mensaje.append("Debes introducir un valor para modificar el atributo.");
                    }else{
                    session.setAttribute(nombre, valor);
                    mensaje.append("Se ha modificado el atributo: "+nombre+", con el valor: "+session.getAttribute(nombre));
                    }
                }else if(request.getParameter("Submit").equals("Eliminar")){
                    mensaje.append("Se ha eliminado el atributo: "+nombre+", que tenia el valor: "+session.getAttribute(nombre));
                    session.removeAttribute(nombre);
                }else{
                    mensaje.append("Ya existe el atributo: "+nombre);
                }
            //Si no existe
            }else{
                if(request.getParameter("Submit").equals("Crear")){
                    if(valor.equals("")){
                        mensaje.append("Debes introducir un valor para crear un atributo.");
                    }else{
                        session.setAttribute(nombre, valor);
                        mensaje.append("Se ha creado el atributo "+nombre+", con el valor: "+valor+".");
                    }
                }else{
                    mensaje.append("No existe el atributo: "+nombre+".");
                }
            }
            session.setAttribute("mensaje", mensaje);
            response.sendRedirect("MenuSessions.jsp?mensaje="+mensaje);  
        %>
        
        
        
        
        <h1></h1>
    </body>
</html>
