# Practicas_Aula
Commit 11/10/20178
-Arreglado un error de CalculadoraBasica.jsp, en el que mostraba 2 botones de enlace al menu, en lugar de uno solo.

-----------------
Commit 10/10/2018
-Finalizado el ejercicio de contador con session, el ContadorConSessions.jsp muestra por pantalla el numero de veces que se ha recargado la pagina
y 2 botones, recargar y menu, y un checkbox eliminar. Al recargar la pagina, o al entrar por primera vez, se compruba si existe la session cotador
recorriendo un enumeration, si no existe la crea y le poner de valor 1, y si ya existe le suma 1 al valor, despues este valor es el numero que 
muestra por pantalla que indica el numero de veces que se ha recargado la pagina. Si se selecciona el check de eliminar y pulsamos en recargar,
se borra el atributo contador, y mostrara un 0 como numero de veces que se ha recargado la pagina.


----------------
Commit 9/10/2018
-He reducido el código del jsp ControlDeCookie.jsp, para evitar repeticiones y multiples if innecesarios en el código.

-Finalizado el ejercicio del menu de sesiones, el jsp MenuSessions.jsp pide al usuario el nombre y el valor del un atributo, y segun la opcion
que elija se realizaran deiferentes acciones, primero llama a ControlDeSessions.jsp, el cual se encarga de buscar si ya existe el atributo e la session
mediante getAtributeNames, en el caso de que existe no se podra crear otra igual, y se podra visualizar, modificat y eliminar, y en el caso de que no
existe se podra crear, pero no se podra ni visualizar, ni modificar, ni eliminar. Finalmente crea un atributo mensaje, el cual tiene
como valor un stringbuilder que indica la accion realizada y la informacion de los atributos, a este atributo lo llamamos desde el MenuSessions.jsp
mediante session.getAttribute("mensaje").

 
----------------
Commit 8/10/2018
-He arreglado un error de la aplicacion de ContadorCookie.jsp, en el que simepre mostraba la informacion de la cookie aparte del contador,
ahora solo muestra esa informacion cuando el valor de la cookie es 1, es decir,solo la primera vez que se entra en la página.
Tambien he arreglado otro error, que hacia que a veces saltase un error al entrar en la pagina,
esto se debia a que el jsp intentaba recorrer un array que era nulo siempre por primera vez al ejecutar la aplicacion.




----------------
Commit 7/10/2018
-La aplicacion ContadorConCookie.jsp esta finalizada, primero recoge todas las cookies con request.getCookies(),y si alguna de ellas coincide con
la cookie que hace de contador se guarda en un int, la posicion del array en la que se ecncuentra la cookie, si no existe se crea con el valor 1,
y si existe se le suma al valor 1, convirtiendo el valor a int para sumarle 1 y despues añadiendoselo de nuevo a la cookie como string.
Se muestra por pantalla la informacion de la cookie, y las veces que se ha recargado la pagina, cada vez que se recarge muestra el valor mas 1.
Si se pulsa la opcion eliminar se establece el valo a 0, para poder mostrarle algo al usuario, y despues se elimina. Si se le vuelve dar a recargar
se volvera a crear la cookie. Ademas, en caso de que se introduzcan espacios es el nombre, se elimian, y si lo introduce en el valor se sustituye
por %20, para que no salga error, y el usuario seguira viendo que hay un espacio en el valor.




----------------
Commit 5/10/2018
-Hecho el jsp calculadoraBasica.jsp, este pide al usuario dos números mediantes dos inputs, y con un radio se le da una operacion a elegir,
el jsp se encarga de comprobar si los datos introducidos son valores correctos, o si no se han introducido nada, en el caso de que sean correctos,
se obtienen estos valores con getParameter y se introducen en atributos Double, transformando los strings con parseDouble.
Despues segun la opcion elegida muestra el resultado de la operacion, y debajo se escribe el dia, mes y año de la fecha cuando se realiza la operacion,
escribiendo ademas el dia de la semana y el mes es español, esto lo conseguimos gracias a los arrays meses, donde se guardan los nombres de los meses,
y el array dias, donde se guardan el nombre de los dias de la semana.

-Se ha creado y finalizado la aplicacion menuCookies.jsp, este pide al usuario mediante inputs, el nombre y el valor de la cookie, y se le da elegir
4 botones, eliminar, visualizar, crear y modificar. Es obligatorio introducir nombre. Lo primero que hace el jsp es comprobar si hay cookies, y si las hay
las compara con el nombre de la cookie que ha introducido el usuario, y segun la opcion que haya elegido mostrara un mensaje u otro.
En el caso de que quiera crear una cookie ya existente no le dejara y mostrara el mensaje, si no existe la crea, si quiere eliminar, visualizar, o modificar
una cookie que no existe se le informa al usuario. Si existe y la opcion es modificar, se le sustituira el valor a la cookie simrpe que no sea un campo vacio,
si la opcion es visualizar el muestra el nombre y la valor de la cookie por pantalla, y si es eliminar la elimina, no es necesario introducir el valor,
para ninguna de estas opciones, solo para la opcion crear.
El mensaje de respuesta al usuario se lo pasa el jsp al html como un parametro inicial.






----------------
Commit 4/10/2018
-Se ha modificado el servlet DatosRegistroDeUsuarios arreglando algunos errores.
Se ha arreglado que cuando al no seleccionar ninguna preferencia a la vez que hay algun error, desaparecen los botones y los checkbox.
Ahora muestra correctamente los datos del usuario una vez no hay errores introducidos, la fecha la muestra en castellano gracias a un arrayMes,
donde estan guardados los nombre de los meses. Tambien muestra las preferencias seguidas por comas, y en la ultima preferencia no muestra la coma.
He eliminado el checked que hacia que la preferencia deporte estuviese seleccionada por defecto tanto en el html como en el servlet.
Tambien se han modificado la hoja de estilos de RegistroUsuarios.css.
Ademas, antes toda la informacion y html del servlet, estaba escrito en el metodo processRequest, todo esto se ha movido al metodo doPost, y
se han modificado los html para que al pulsar el boton enviar llamen ha dicho metodo.






----------------
Commit 3/10/2018
-Creada la aplicacion de Saludo, el fichero FormularioSaludo.html pide al usuario el nombre y el sexo, y llama al jsp Saludo.jsp.
El Saludo.jsp guarda en varios String, el genero y la hora del saludo, y muestra el saludo(segun sea dia, tarde o noche),
indicando el genero y el nombre de usuario.

-Añadida la aplicacion de calcular la edad, CalcularEdad.html  pide al usuario su nombre y su fecha de nacimiento, una vez le da a enviar se llama al jsp CalculoEdad.jsp,
este se encarga de obtener el dia, año y mes de nacimiento. Usando Perid, y su metodo between comprobamos la diferencia entre 2 localdate, el cual
uno es la fecha de nacimiento y el otro la actual, esto nos devolvera la diferencia entre ambos. Se crea un stringbuilder, en el cual se van
guardando diferentes valores en funcion del numero de años, meses y dias, por ejemplo, en el caso de que los años sean 0, no se añaden al stringbuilder,
por lo que se hacen multiples comprobaciones con if, para saber cuando poner las palabras en singular, cuando poner comas, etc, y finalmente muestra la cadena.







----------------
Commit 2/10/2018
-Creada el servlet cabeceras.java, que mediante getHeaderNames guarda los datos en un enumeration y posteriormente lo muestra
por pantalla al usuario, utiliza los estilo de Sencillo.css

-Hecho el servlet cicloDeVida.java, que utiliza los metodos init, service y destroy para mostrar un mensaje por pantalla, que indica que
metodos de esos 3 ha ejecutado la aplicacion, el mensaje de destroy solo lo muestra si se para el servidor, si no, no lo mostrara nunca.

-Se ha modificado el servlet config.java para que muestre tanto el nombre como el valor por pantalla, utilizando los estilos de Sencillo.css.

-Se ha creado el servlet InfoDeCliente.java, que recoge cierta informacion del cliente mediante metodos de request, como por ejemplo:
equest.getServerPort(), request.getRequestURL(), request.getServerPort(), etc. Ademas, hemos definido 2 parametros iniciales el web.xml,
los cuales este el servlet infoDeCliente.java guarda en un enumeration mediante getInitParameterNames(), y recorre este enumeration mostrando sus valores.

-Se ha empezado el Servlet DatosRegistroUsuarios.java, el cual recoge la informacion de RegistroDeUsuarios.html, ya comprueba si alguno de los datos
introducidos estan vacios, y en el caso de la fecha llama al metodo validarFecha pasandole los parametros de dia, mes y años, y hace la comprobacion,
este devuelve un boolean que indica si es correcto o no, en el caso de que algun dato no sea correcto, cierta posicion del array error, se pondra a 0,
cada posicion corresponde con un dato. En el caso de que algun dato sea incorrecto se muestra un mensaje de error que estara guardado en el array
mostrarError, segun los errores que haya mostrara unos mensajes u otros, ademas volvera a mostrar el formulario pidiendo de nuevo que introduzca los datos.
Queda por terminar la pantalla de datos del usuario.







----------------
Commit 28/9/2018
-Se ha creado el html RegistroDeUsuarios.html que recoge la informacion que pide al usuario mediante varios inputs y llama al servlet DatosRegistroUsuarios.java
que mostrara los datos del usuario por pantalla una vez este terminada.

-Tambien se ha creado el servlet Config.java que mediante parametros iniciales creados automaticamente por netbeans en el servlet, los muestra
por pantalla guardando estos parametros en un enumeration mediante getInitParameter, y los muestra por pantalla.






----------------
Commit 27/9/2018
-Creada el index.html, donde se ecnuentran los enlaces a cada uno de los ejercicios, este fichero se actualizará
conforme vayamos haciendo nuevos ejercicios, ya que debemos añadir el enlace a esos nuevos ejercicios.Este index ademas utiliza
para los estilos el fichero indice.css de la carpeta CSS.

-Tambien se ha creado el primer servlet, HolaMundoServlet.java, que simplemente muestra por pantalla el nombre de la aplicacion, mediante el metodo
processRequest.

-Tambien esta finalizado el ejercicio de Formulario Simple, que mediante el formularioSimple.html le pedimos al usuario varios datos con imputs,
y al pular el boton "Enviar" llama al Servlet DatosRegistroUsuarios.java, el cual recoge la informacion mediante un getParameterMap,
y los muestra por pantalla.

-El formulario Completo tambien esta finalizado, pide al usuario más datos que en el ejecicio anterior, incluyendo 2 select, al pulsar enviar llama al
servlet DatosRegistroUsuarios.java y con el getParameterMap hacemos que muestre por pantalla los datos introducidos por el usuario.
