/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





package es.albarregas.practicas_aula.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fjvaz
 */
@WebServlet(name = "DatosRegistroUsuarios", urlPatterns = {"/DatosRegistroUsuarios"})
public class DatosRegistroUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific errorFecha occurs
     * @throws IOException if an I/O errorFecha occurs
     */
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific errorFecha occurs
     * @throws IOException if an I/O errorFecha occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific errorFecha occurs
     * @throws IOException if an I/O errorFecha occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            
            out.println("<!DOCTYPE html>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
                 
                 
            out.println("<head> <meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"CSS/RegistroUsuarios.css\" /><link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\"></head>");
            out.println("<body>");
            //Mensajes de error en el caso de que el usuario introduza un dato mal
            String mostrarError[]={"ERROR: No has introducido el nombre.","ERROR: No has introducido el usuario.","ERROR: No has introducido la contaseña.","ERROR: La fecha de nacimiento es incorrecta."};
    
            int numAnio=Integer.parseInt(request.getParameter("Anio"));
             
            int numMes=Integer.parseInt(request.getParameter("Mes"));
             
            int numDia=Integer.parseInt(request.getParameter("Dia"));
            int error[] = { -1,-1,-1,-1};
            //Comprobamos si los datos introducidos son correctos mediante las siguientes condiciones:
            if (request.getParameter("Nombre").equals("")){
                error[0]=0;
            }
            if (request.getParameter("Usuario").equals("")){
                error[1]=0;
            }
            if (request.getParameter("Contrasena").equals("")){                
                error[2]=0;
            }
            //Comprueba la fecha llamando al metodo ValidarFecha, pasandole 3 parametros enteros.
            if (validarFecha(numDia, numMes,numAnio)){
                error[3]=0;
            }

            
             
            //Si hay algun error (si error[x]==0), Vuelve a mostrar el formulario con el mensaje de error.
            if(error[0]==0 || error[1]==0 || error[2]==0 || error[3]==0){
            
             out.println("<fieldset id='campoerror'><legend style=\"\">Error</legend>");
             for(int i=0;i<error.length;i++){
                 if(error[i]==0){
                      out.println("<div class='error'>"+mostrarError[i]+"</div>");   
                 }
             }
             
             out.println("<br></fieldset>");
                
             out.print("<form action=\"DatosRegistroUsuarios\" method=\"POST\" name=\"form\">\n<h1>Registro de usuarios</h1>\n<fieldset>\n<legend style=\"\">Informacion Personal</legend>\n");
             out.print("<label for='nombre' >*Nombre: </label>\n<input type=\"text\" id=\"nombre\" name=\"Nombre\" value="+request.getParameter("Nombre")+">");
                    //Si hay un error muestra un icono X, y si es correcto muestra un check
                    if(error[0]==-1){
                        out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                    }else{
                        out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                    }
                    out.println("<br><br>\n<label for='apellidos' >Apellidos: </label>\n");
                                out.println("<input type=\"text\" id=\"apellidos\" name=\"Apellidos\" value="+request.getParameter("Apellidos")+"><br>\n");
                                out.print("<br>\n\n\n<div>Sexo:<br>\n<div id=\"radio\">\n\n");
                                out.println("<label for='Sexo' >Hombre</label>\n");
                                if(request.getParameter("Sexo").equals("Hombre")){
                                    out.print("<input type=\"radio\"  name=\"Sexo\" value=\"Hombre\" checked=\"\"><br><br>\n \n");
                                }else{
                                    out.print("<input type=\"radio\"  name=\"Sexo\" value=\"Hombre\" ><br><br>\n \n");
                                }
                                out.print("<label for='Sexo'  >Mujer</label>");
                                  if(request.getParameter("Sexo").equals("Mujer")){
                                    out.print("<input type=\"radio\"  name=\"Sexo\" value=\"Mujer\" checked=\"\"><br><br>\n \n");
                                }else{
                                    out.print("<input type=\"radio\"  name=\"Sexo\" value=\"Mujer\" ><br><br>\n \n");
                                }
                                  //Escribimos las opciones de los select mediante un for.
                                out.print("</div>\n<br><br><br><br>\n<div>Fecha de nacimiento:\n<div id=\"derecha\">\n<select name=\"Dia\">\n");                                    
                                        for(int i=1;i<32;i++){
                                            out.println("<option value="+i+" ");
                                            if (i==Integer.parseInt(request.getParameter("Dia"))){
                                                out.print("selected>"+i+"</option>\n");
                                            }else{
                                                out.print(">"+i+"</option>\n");
                                            }
                                        }
                                 out.println("</select> /\n<select name=\"Mes\" >\n");
                                         for(int i=1;i<13;i++){
                                       out.println("<option value="+i+" ");
                                            if (i==Integer.parseInt(request.getParameter("Mes"))){
                                                out.print("selected>"+i+"</option>\n");
                                            }else{
                                                out.print(">"+i+"</option>\n");
                                            }
                                    }
                                out.println("</select> /\n <select name=\"Anio\" >\n");
                                for(int i=1980;i<2019;i++){
                                       out.println("<option value="+i+" ");
                                            if (i==Integer.parseInt(request.getParameter("Anio"))){
                                                out.print("selected>"+i+"</option>\n");
                                            }else{
                                                out.print(">"+i+"</option>\n");
                                            }
                                    }
                                   out.println("</select>");
                                        if(error[3]==-1){
                                            out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                                        }else{
                                            out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                                    }
                                        out.println("\n</div>\n</div>\n</fieldset>\n");
                                        out.println("<fieldset>\n<legend style=\"\">Datos de acceso</legend>\n");
                                        out.println("<label for='usuario' >*Usuario: </label>\n");
                                        out.println("<input type=\"text\" id=\"usuario\" name=\"Usuario\" value="+request.getParameter("Usuario")+">");
                                        if(error[1]==-1){
                                            out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                                        }else{
                                            out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                                        }
        
                                        out.println("<br><br>\n<label for='contrasenia' >*Contraseña: </label>\n<input type=\"password\" id=\"contrasenia\" name=\"Contrasena\" value="+request.getParameter("Contrasena")+">");
                                        if(error[2]==-1){
                                            out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                                        }else{
                                            out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                                        }
                
                   out.println("</fieldset>\n");
                   out.println("<fieldset>\n<legend>Informacion General</legend>\n<div id=\"preferencias\">Preferencias:<br><div id=\"radio\">\n");
//                              //Comparando el array de los valores de preferencias y el array con todas las preferencias posibles muestor los checbox que estan marcadas y las que no.
                                String preferencias[]=request.getParameterValues("Preferencias");
                                String aficiones[]={"Deporte", "Lectura", "Cine", "Viajes"};
                                
                                for(int i=0;i<aficiones.length;i++){
                                    String seleccionado="";
                                    for(int n=0;n<preferencias.length;n++){
                                        if(aficiones[i].equals(preferencias[n])){
                                            seleccionado="checked=\"\"";
                                        }
                                    }
                                    out.println("<input type=\"checkbox\"  name=\"Preferencias\" value=\""+aficiones[i]+"\" "+seleccionado+">"+aficiones[i]+"<br>\n");
                                    
                                }
                                
                           
                                out.println("<br><br>\n</div>\n</fieldset><br><div id=\"centrar\">\n");
                                out.println("<input type=\"submit\" name=\"Submit\" id=\"boton\" value=\"Enviar datos\">\n\n");
                                out.println("<input type=\"reset\" id=\"boton\" value=\"Limpiar formulario\">\n<br><br>´\n</div>\n");
                                out.println("</form>");
                                out.println("</body>");
                                out.println("</html>");
            //En el caso de que no haya errores muestro los datos.
            }else{
                                out.println("<h1>Datos del Usuario</h1>");
                                out.println("<fieldset id=\"campoResultado\">");
                                //Mediante un map obtengo los datos del formulario
                                Map<String, String[]> coleccion =request.getParameterMap();
                                int Dia=0;
                                int Mes=0;
                                int Anio=0;
                                boolean mostrarFecha=true;
                                String[] meses={"Enero", "Febrero" ,"Marzo","Abril","Mayo","Junio","Julio","Agosto", "Septiembre","Octubre","Noviembre","Dicimbre"};
                                for (Map.Entry<String, String[]> entrada : coleccion.entrySet()){
                                    String[] valores = entrada.getValue();
                                    if (!entrada.getKey().startsWith("Sub")){ 
                                        //Si los valores son dia, mes o anio los guardo en atributos int, si no, lo muestro
                                        if(valores.length==1){
                                            if (entrada.getKey().startsWith("Dia")){
                                                Dia=Integer.parseInt(valores[0]);
                                            }
                                            else if (entrada.getKey().startsWith("Mes")){
                                                Mes=Integer.parseInt(valores[0])-1;
                                            }
                                            else if (entrada.getKey().startsWith("Anio")){
                                                Anio=Integer.parseInt(valores[0]);
                                            }else{
                                                out.println("<div id='datos'><strong>"+entrada.getKey()+ "</strong>: "+valores[0]+"</div><hr>");
                                            }
                                        }else if(valores.length>1){
                                            
                                            out.println("<div id='datos'><strong>"+entrada.getKey()+": </strong>");
                                            StringBuilder cadena = new StringBuilder();
                                            //Con un stringBuilder concateno las preferencias para mostrarlas en una sola linea.
                                            for(int i=0;i<valores.length;i++){
                                                cadena.append(valores[i]+", ");
                                                

                                            }
                                            cadena.replace(cadena.length()-2,cadena.length(), " ");
                                            
                                            out.println(cadena+"</div><hr>");
                                            
                                        }
                                    }
                                 //Cuando dia, mes y anio, tomen nuevo valores se mostraran, y con el boolean mostrarFecha, hara que solo se muestre una vez.
                                 if (Dia!=0 && Mes>=0 && Anio!=0 && mostrarFecha){
                                        out.println("<div id='datos'><strong>Fecha de nacimiento</strong>: "+Dia+" de "+meses[Mes]+" de "+Anio+"</div><hr>");
                                        mostrarFecha=false;
                                }
                               
                                }
                                
                                out.println("</fieldset>");
                                
                                out.println("<br><div id='enlace'><a href='"+request.getContextPath()+"'>Volver al menú</a></div>"); 
                                out.println("</body>");
                                out.println("</html>");
             }
        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean validarFecha(int numDia, int numMes, int numAnio) {
        //Comparando el dia introducido por el usuario con cada uno de los dias del mes del array comprobamos si la fecha es correcta o no.
       int[] diasDelMes = {30,28,31,30,30,30,30,30,30,30,31,30};
       boolean errorFecha=false;
       if(numDia>diasDelMes[numMes-1] && numMes!=2){
            errorFecha=true;
       }
       //Si el mes es Febrero comprobamos si el año es bisiesto
       if(numMes==2){
           if((numAnio%100==0 && numAnio%400==0) || (numAnio%100 != 0 && numAnio% 4 == 0)){
                    if(numDia>diasDelMes[numMes-1]+1)
                        errorFecha=true;
                    }else{
                        if(numDia>diasDelMes[numMes-1]){
                            errorFecha=true;
                        }
                    }
       }
       
//       //Usando switch
//        boolean errorFecha=false;
//          
//        switch(numMes){
//            
//            case 4:case 6:case 9:case 11:
//                if(numDia>30){
//                    errorFecha=true;
//                }
//                break;
//            case 2:
//                if((numAnio%100==0 && numAnio%400==0) || (numAnio%100 != 0 && numAnio% 4 == 0)){
//                    if(numDia>29){
//                        errorFecha=true;
//                    }   
//                }else{
//                    if(numDia>28){
//                          
//                        errorFecha=true;
//                    }
//                }
//                break;
//        }
        return errorFecha;
        }
       //To change body of generated methods, choose Tools | Templates.
    

    

    

    }

