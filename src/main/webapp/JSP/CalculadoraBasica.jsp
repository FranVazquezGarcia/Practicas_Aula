<%-- 
    Document   : CalculadoraBásica
    Created on : 04-oct-2018, 23:51:18
    Author     : fjvaz
--%>

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/estilosCalculadora.css" />
        <title>Calculadora Básica</title>
    </head>
    <body>
        <form action="CalculadoraBasica.jsp" method="" name="form">
        <fieldset>
            <legend>Calculadora Básica</legend>
	<label for='op1' >Introduce el primer operando: </label>
	<input type="text" id="op1" name="operando1">

        <label for='op2' >Introduce el segundo operando: </label>
	<input type="text" id="op2" name="operando2">
        <br><br><br>
        <input type="radio"  name="calculo" value="suma" checked="">Suma
        <input type="radio"  name="calculo" value="resta">Resta
        <input type="radio"  name="calculo" value="multiplicacion">Multiplicación
        <input type="radio"  name="calculo" value="division">División
        <hr>
        <br>
        
        <%
            StringBuilder mensaje=new StringBuilder();
            StringBuilder mensajeFecha=new StringBuilder();
            if (request.getParameter("operando1")==null || request.getParameter("operando2")==null){
                mensaje.append("");
            }else{
                boolean numero=true;
                Double operando1=null;
                Double operando2=null;
                try {
                    operando1 = Double.parseDouble(request.getParameter("operando1"));
                    operando2 = Double.parseDouble(request.getParameter("operando2"));
                } catch (NumberFormatException e) {
                    numero = false;
                }
                if (!numero){
                     mensaje.append(request.getParameter("operando1").equals("") || request.getParameter("operando2").equals("")?"No se ha introducido algún operando.":"Se han introducido valores no válidos.");
                     
                }else{
                
                    if(request.getParameter("calculo").equals("suma")){
                     mensaje.append("El resultado de "+operando1+" + "+operando2+" = "+(operando1+operando2) );
                    }
                    if(request.getParameter("calculo").equals("resta")){
                     mensaje.append("El resultado de "+operando1+" - "+operando2+" = "+(operando1-operando2) );
                    }
                    if(request.getParameter("calculo").equals("multiplicacion")){
                     mensaje.append("El resultado de "+operando1+" x "+operando2+" = "+(operando1*operando2) );
                    }
                    if(request.getParameter("calculo").equals("division")){
                        if (operando2!=0){
                            mensaje.append("El resultado de "+operando1+" / "+operando2+" = "+(operando1/operando2) );
                        }else{
                            mensaje.append("No se puede dividir entre 0");
                        }
                    }
                    String[] meses={"Enero", "Febrero" ,"Marzo","Abril","Mayo","Junio","Julio","Agosto", "Septiembre","Octubre","Noviembre","Dicimbre"};
                    String[] dias={"Domingo","Lunes", "Martes" ,"Miercoles","Jueves","Viernes","Sabado"};
                    Calendar fechaActual=Calendar.getInstance();
                    int diaSemana=fechaActual.get(Calendar.DAY_OF_WEEK)-1;
                    int dia=fechaActual.get(Calendar.DAY_OF_MONTH);
                    int mes=fechaActual.get(Calendar.MONTH);
                    int anio=fechaActual.get(Calendar.YEAR);
                    //simpleDateFormat
                    
                    mensajeFecha.append("Cálculo realizado el "+dias[diaSemana]+" "+dia+" de "+meses[mes]+" de "+anio);
                }
            }
        %>
        
        <div class="texto">
            <%=mensaje%>
        </div>
        <br>
        <div class="textoFecha">
            <%=mensajeFecha%>
        </div>
        
        
        <br>
        <div class="botones">
        <input type="submit" name="Submit" id="button" value="Enviar">
        <input type="reset" name="Submit" id="button" value="Limpiar">
        <input type="submit" name="menu" id="button" value="Menú Inicial" onclick="location.href='<%=request.getContextPath()%>'">
        <a href="<%=request.getContextPath()%>">Volver al menú</a>
        </div>
        </fieldset>
        </form>
    </body>
</html>
