/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/*
Meses en numeros en el html. los nombres en un array.
array entero tablaerror con 4 espacios inicializado a -1,-1,-1,-1, con errores nombre, fecha, usuario, y contraseña.
Si el nombre esta vacio en la posicion delarray del nombre coloco un 0 sustituyendo el -1.
StringBuilder para la fecha y asi añadirle dia,mes y año.metodo ape
jesusAlbarregas github
*/

package es.albarregas.practicas_aula.servlets;
import java.io.IOException;
import java.io.PrintWriter;

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            
            out.println("<!DOCTYPE html>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
                 
                 
            out.println("<head> <meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"CSS/RegistroUsuarios.css\" /><link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">");

            /* TODO output your page here. You may use following sample code. */
            //
            out.println(request.getParameter("Preferencia1"));
            String mostrarError[]={"ERROR: No has introducido el nombre.","ERROR: No has introducido el usuario.","ERROR: No has introducido la contaseña.","\"ERROR: La fecha de nacimiento es incorrecta.\""};
    
             int numAnio=Integer.parseInt(request.getParameter("Anio"));
             
             int numMes=Integer.parseInt(request.getParameter("Mes"));
             
             int numDia=Integer.parseInt(request.getParameter("Dia"));
            int error[] = { -1,-1,-1,-1};
            if (request.getParameter("Nombre").equals("")){
                error[0]=0;
            }
            if (request.getParameter("Usuario").equals("")){
                error[1]=0;
            }
            if (request.getParameter("Contrasena").equals("")){                
                error[2]=0;
            }
            if (validarFecha(numDia, numMes,numAnio)){
                error[3]=0;
            }

            
             
            
             if(error[0]==0 || error[1]==0 || error[2]==0 || error[3]==0){
            
             out.println("<fieldset id='campoerror'><legend style=\"\">Error</legend>");
             for(int i=0;i<error.length;i++){
                 if(error[i]==0){
                      out.println("<div class='error'>"+mostrarError[i]+"</div>");   
                 }
             }
             
             out.println("<br></fieldset>");
                
             out.print("<form action=\"DatosRegistroUsuarios\" method=\"POST\" name=\"form\">\n" +
"            <h1>Registro de usuarios</h1>\n" +
"		<fieldset>\n" +
"                    <legend style=\"\">Informacion Personal</legend>\n" +
"                    <label for='nombre' >*Nombre: </label>\n" +
"                    <input type=\"text\" id=\"nombre\" name=\"Nombre\" value="+request.getParameter("Nombre")+">");
                    if(error[0]==-1){
                        out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                    }else{
                        out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                    }
                    out.println("<br><br>\n" +
"                                <label for='apellidos' >Apellidos: </label>\n" +
"                                <input type=\"text\" id=\"apellidos\" name=\"Apellidos\" value="+request.getParameter("Apellidos")+"><br>\n" +
"                                <br>\n" +
"                              \n" +
"                                \n" +
"                                <div>Sexo:<br>\n" +
"                                    <div id=\"radio\">\n" +
"                                    \n" +
"                                <label for='sexo' >Hombre</label>\n");
                                if(request.getParameter("sexo").equals("Hombre")){
                                    out.print("<input type=\"radio\"  name=\"sexo\" value=\"Hombre\" checked=\"\"><br><br>\n \n");
                                }else{
                                    out.print("<input type=\"radio\"  name=\"sexo\" value=\"Hombre\" ><br><br>\n \n");
                                }
                                out.print("<label for='sexo'  >Mujer</label>");
                                  if(request.getParameter("sexo").equals("Mujer")){
                                    out.print("<input type=\"radio\"  name=\"sexo\" value=\"Mujer\" checked=\"\"><br><br>\n \n");
                                    
                                }else{
                                    out.print("<input type=\"radio\"  name=\"sexo\" value=\"Mujer\" ><br><br>\n \n");
                                }
                                out.print("</div>\n" +
"                                <br><br><br><br>\n" +
"                                <div>Fecha de nacimiento:\n" +
"                                    <div id=\"derecha\">\n" +
"                                <select name=\"Dia\">\n");                                    
                                        for(int i=1;i<32;i++){
                                            out.println("<option value="+i+" ");
                                            if (i==Integer.parseInt(request.getParameter("Dia"))){
                                                out.print("selected>"+i+"</option>\n");
                                            }else{
                                                out.print(">"+i+"</option>\n");
                                            }
                                        }
                                 out.println("</select> /\n" +
"                                <select name=\"Mes\" >\n");
                                         for(int i=1;i<13;i++){
                                       out.println("<option value="+i+" ");
                                            if (i==Integer.parseInt(request.getParameter("Mes"))){
                                                out.print("selected>"+i+"</option>\n");
                                            }else{
                                                out.print(">"+i+"</option>\n");
                                            }
                                    }
                                out.println("</select> /\n" +
"                                <select name=\"Anio\" >\n");
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
                                        out.println("\n" +
"                                 </div>\n" +
"                                </div>\n" +
"                </fieldset>\n" +
"                <fieldset>\n" +
"                    <legend style=\"\">Datos de acceso</legend>\n" +
"                    <label for='usuario' >*Usuario: </label>\n" +
"                    <input type=\"text\" id=\"usuario\" name=\"Usuario\" value="+request.getParameter("Usuario")+">");
                                if(error[1]==-1){
                        out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                    }else{
                        out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                    }
        
        out.println("<br><br>\n" +
"                    <label for='contrasenia' >*Contraseña: </label>\n" +
"                                <input type=\"password\" id=\"contrasenia\" name=\"Contrasena\" value="+request.getParameter("Contrasena")+">");
        if(error[2]==-1){
                        out.println("<i class=\"material-icons\" id=\"iconCorrect\">check</i>");
                    }else{
                        out.println("<i class=\"material-icons\"  id=\"iconError\">clear</i>");
                    }
                
                out.println("</fieldset>\n" +
"                  <fieldset>\n" +
"                    <legend>Informacion General</legend>\n" +
"                    <div id=\"preferencias\">Preferencias:<br>\n" +
"                        <div id=\"radio\">\n" +
"                                <label for='preferencias' >Deporte</label>\n" +
"                                <input type=\"checkbox\"  name=\"Preferencias1\" value=\"Deporte\" checked=\"\"><br>\n" +
                                
"                                <label for='preferencias' >Lectura</label>\n" +
"                                <input type=\"checkbox\"  name=\"Preferencias2\" value=\"Lectura\"><br>\n" +
"                                <label for='preferencias' >Cine</label>\n" +
"                                <input type=\"checkbox\"  name=\"Preferencias3\" value=\"Cine\"><br>\n" +
"                                <label for='preferencias' >Viajes</label>\n" +
"                                <input type=\"checkbox\"  name=\"Preferencias4\" value=\"Viajes\"><br>\n" +
"                                <br><br>\n" +
"                                </div>\n" +
"                </fieldset><br>"+
"                <div id=\"centrar\">\n" +
"                <input type=\"submit\" name=\"Submit\" id=\"boton\" value=\"Enviar datos\">\n" +
"                                \n" +
"                <input type=\"reset\" id=\"boton\" value=\"Limpiar formulario\">\n" +
"                <br><br>´\n" +
"                </div>\n" +
"        </form> ");
            
            }else{
       
                
                
                          
               
        
        
            out.println("</body>");
            out.println("</html>");
        }
        
        }
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
       
        boolean errorFecha=false;
          
        switch(numMes){
            case 4:case 6:case 9:case 11:
                if(numDia>30){
                    errorFecha=true;
                }
                break;
            case 2:
                if((numAnio%100==0 && numAnio%400==0) || (numAnio%100 != 0 && numAnio% 4 == 0)){
                    if(numDia>29){
                        errorFecha=true;
                    }
                }else{
                    if(numDia>28){
                          
                        errorFecha=true;
                    }
                }
                break;
        }
        return errorFecha;
        }
       //To change body of generated methods, choose Tools | Templates.
    

    

    

    }

