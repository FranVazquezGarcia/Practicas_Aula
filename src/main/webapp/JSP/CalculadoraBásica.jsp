<%-- 
    Document   : CalculadoraBásica
    Created on : 04-oct-2018, 23:51:18
    Author     : fjvaz
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="screen" href="../CSS/estilosCalculadora.css" />
        <title>Calculadora Básica</title>
    </head>
    <body>
        <fieldset>
            <legend>Calculadora Básica</legend>
	<label for='op1' >Introduce el primer operando: </label>
	<input type="text" id="op1" name="operando1">

        <label for='op2' >Introduce el segundo operando: </label>
	<input type="text" id="op2" name="operando2">
        <br><br><br>
        <input type="radio"  name="calculo" value="suma">Suma
        <input type="radio"  name="calculo" value="resta">Resta
        <input type="radio"  name="calculo" value="multiplicacion">Multiplicación
        <input type="radio"  name="calculo" value="division">División
        <hr>
        <br>
        
        <div class="texto">
            <%=""%>
        </div>
        
        <br>
        <div class="botones">
        <input type="reset" name="Submit" id="button" value="Limpiar">
        <input type="submit" name="Submit" id="button" value="Enviar">
        <input type="submit" name="menu" id="button" value="Menú Inicial" onclick="location.href='<%=request.getContextPath()%>'">
        </div>
        </fieldset>
    </body>
</html>
