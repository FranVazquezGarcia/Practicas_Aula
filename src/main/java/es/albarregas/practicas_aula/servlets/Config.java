/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicas_aula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Enumeration;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fjvaz
 */

//Parámetros definidos automaticamente por Netbeans
@WebServlet(name = "Config", urlPatterns = {"/Config"}, initParams = {
    @WebInitParam(name = "Parametro1", value = "Este es el parametro número 1")
    , @WebInitParam(name = "Parametro2", value = "Este es el parámetro número 2")})
public class Config extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Config</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"CSS/Sencillo.css\" />\n");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Parametros iniciales</h1>");
            out.println("<fieldset>");
            
            //Obtenemos los parametros iniciales y los muestro:
            Enumeration<String> parametrosIniciales=getInitParameterNames();
            while(parametrosIniciales.hasMoreElements()){
            String nombre=parametrosIniciales.nextElement();
            String valor=getInitParameter(nombre);
            //Para que muestre los parametros en la pagina:
            out.println("<div><Strong>"+nombre+" :</strong>"+valor+"</div><hr>");
            
            //Para que los muestre por consola: 
            System.out.println(nombre+" :"+valor);
        }
            out.println("</fieldset>");
            out.println("<br><div id='enlace'><a href='"+request.getContextPath()+"'>Volver al menú</a></div>"); 
            out.println("</body>");
            out.println("</html>");
        }
    }
            
        

    
    
    
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
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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

    

}
