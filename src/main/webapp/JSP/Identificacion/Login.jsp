<%-- 
    Document   : Login
    Created on : 13-oct-2018, 12:16:46
    Author     : fjvaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="<%=request.getContextPath()%>/CSS/identificacion.css" />
        <title>Login</title>
    </head>
    <body>
         <form action="ControlLogin.jsp" method="" name="form">
		<fieldset>
                    <legend>Inicio de sesión</legend>
                    <%  Cookie[] cookies=request.getCookies();
                        String nombreUsuario= new String();
                        // TE FALTA PREGUNTAR SI EXISTE cookies Y ESTO PRODUCE UN ERROR DE EJECUCIÓN
                        if(cookies != null) {
                        for(int i=0;i<cookies.length;i++){
                            if(cookies[i].getName().equals("NombreUsuario")){
                                nombreUsuario=cookies[i].getValue();
                                break;
                            }
                        } 
                        }
                        %>
				<label for='nombre' >Introduce tu nombre de usuario: </label>
                                <input type="text" id="nombre" name="nombre" required="" value="<%=nombreUsuario==null? "": nombreUsuario%>">
                                <br><br>
                                <label for='contra' >Introduce la contraseña: </label>
                                <input type="password" id="contra" name="contra" required="">
                                <br><br>
                                <label for='recordar' >Recordar usuario: </label>
                                <input type="checkbox" id="recordar" name="recordar" value="recordar">
                                <br><br>
                                <%HttpSession miSesion=request.getSession();%>
                                <p class="texto"><%=miSesion.getAttribute("error")!=null? miSesion.getAttribute("error") : ""%></p>
                                <br><br>
                                <input type="submit" name="Submit" id="button" value="Enviar">
                                <input type="button" name="Submit" id="button" value="Menú" onclick="location.href='<%=request.getContextPath()%>'">
                                
                                
                </fieldset>
         </form>
    </body>
</html>
