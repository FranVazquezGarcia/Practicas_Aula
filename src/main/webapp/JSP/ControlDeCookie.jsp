<%-- 
    Document   : controlDeCookie
    Created on : 05-oct-2018, 16:18:44
    Author     : fjvaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de cookie</title>
    </head>
    <body>
        
        <%
            StringBuilder mensaje=new StringBuilder();
            Cookie[] cookies=request.getCookies();
            String nombre=request.getParameter("Nombre");
            String valor=request.getParameter("Valor");
            Cookie cookie;
            //Comprobamos si el nombre de la cookie tiene espacios, si los tiene los eliminamos.
            if (nombre.indexOf(" ")==-1 && valor.indexOf(" ")==-1){
            cookie= new Cookie(nombre, valor);
            }else{
                if(nombre.indexOf(" ")!=-1){
                    nombre=nombre.replace(" ", "");
                } 
                if(valor.indexOf(" ")!=-1){
                    valor=valor.replace(" ", "%20");
                }
                cookie= new Cookie(nombre, valor);
            }
            
            int posicion=-1;
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals(nombre)){
                    posicion=i;
                    break;
                }
            }
            //Si la cookie existe
            if(posicion!=-1){
                if(request.getParameter("Submit").equals("Crear")){
                    mensaje.append("Ya existe la cookie: "+cookies[posicion].getName()+", con valor: "+cookies[posicion].getValue());
                }else if(request.getParameter("Submit").equals("Visualizar")){
                    mensaje.append("La cookie "+cookies[posicion].getName()+", tiene el valor: "+cookies[posicion].getValue());
                }else if(request.getParameter("Submit").equals("Modificar")){
                    if (cookie.getValue().equals(cookies[posicion].getValue())){
                        mensaje.append("No se ha modificado la cookie: "+cookie.getName()+", porque ya tenia el valor: "+cookie.getValue());
                    }else if (cookie.getValue().equals("")){
                        mensaje.append("Se debe introducir un valor para modificar la cookie: "+cookie.getName());
                    }else{
                    response.addCookie(cookie);
                    mensaje.append("Se ha modificado la cookie: "+cookie.getName()+", con el nuevo valor: "+cookie.getValue());
                    }
                }else if(request.getParameter("Submit").equals("Eliminar")){
                    mensaje.append("Se ha eliminado la cookie: "+cookies[posicion].getName());
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                
                
            
            
            //Si no existe
            }else{
            
            if(request.getParameter("Submit").equals("Crear")){
                if(valor.equals("")){
                mensaje.append("Debes introducir un valor para la cookie.");
                }else{
                cookie.setMaxAge(60*60);
                response.addCookie(cookie);
                mensaje.append("Se ha creado la cookie: "+cookie.getName()+", con el valor: "+cookie.getValue()+".");
                }
            }else if(request.getParameter("Submit").equals("Visualizar")){
                mensaje.append("No existe la cookie: "+cookie.getName()+".");
            }else if(request.getParameter("Submit").equals("Modificar")){
                mensaje.append("No se puede modificar la cookie: "+cookie.getName()+", porque no existe.");
            }else if(request.getParameter("Submit").equals("Eliminar")){
                mensaje.append("No se puede eliminar la cookie: "+cookie.getName()+", porque no existe.");
            }
                
          
                
            
                
            }
            //mensaje.append(cookie.getValue());
        response.sendRedirect("MenuCookies.jsp?mensaje="+mensaje);
        %>
        
        
    </body>
</html>
