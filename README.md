# Practicas_Aula

[index.html]
Muestra el indice donde hay listas con enlaces que llevan a los programas correspondientes.

[Formulario Simple]
Muestra el html FormularioSimple.html en el que pedimos mediante diferentes inputs los datos al usuario, y mediante el boton enviar llamamos
al Servlet EnviarDatosFormulario.java, en el cual recogemos los datos introducidos con un Map, y los mostramos por pantalla.

[Registro De Usuarios]
Mediante el html RegistroDeUsuarios.html, mostramos varios input, que piden el nombre, apellidos, sexo, fecha de nacimiento, usuario, contraseña,
y preferencias. Con el boton enviar llama a al metodo doPost del Servlet DatosRegistroUsuarios.java, que primero se encarga de comprobar si los campos
nombre, contraseña y usuario estan vacios, y comprueba si la fecha de nacimiento es correcta llamando al metodo validarFecha(), en el caso de que no lo sean muestra
el mensaje de error correspondiente que estara guardado en el array mostrarError. Con una condicion if, si hay errores mostramos el formulario de nuevo,
en el cual va a tener los datos introducidos anteriormente escritos, estableciendo el value igual al request.getParameter del dato que corresponda,
en caso de que el input no sea type text, los demas valores se recuerdan mediante checked en el caso de los checkbox, o selected en el caso del select. Mediante las condiciones
if conseguimos saber que valor debe esta seleccionado o no. Este formulario se muestra siempre que haya errores, cuando no haya errores, se mostrara
la pantalla de los datos, en el cual el año estara escrito con el mes en Español gracias a un array meses en el que esta guardado el nombre de cada mes.
Y los datos de preferencias se muestran seguidos, en lugar de uno en cada linea, esto lo conseguimos gracias a un StringBuilder. 