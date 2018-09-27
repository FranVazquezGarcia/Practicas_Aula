/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicas_aula.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fjvaz
 */
@WebServlet(name = "EnviarDatosFormulario", urlPatterns = {"/EnviarDatosFormulario"})
public class EnviarDatosFormulario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @param continuar
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, boolean continuar)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             request.setCharacterEncoding("UTF-8");
            
            out.println("<!DOCTYPE html>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
                 
                 
                    out.println("<html><head> <meta charset=\"UTF-8\"><link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"CSS/formulario.css\" /></head><body><fieldset><legend style=\"\">Datos enviados</legend>");
                     out.println("<div id='datos'>");
                
                     /**
                    while(parametros.hasMoreElements()){
                        String nombre=parametros.nextElement();
                      **/
                         Map<String, String[]> parametros =request.getParameterMap();
                         //do(Map-Entry<String,String[]entrada: parametros.entryset()){
                         //if (!entrada.getKey().startsWith("Sub")){
                         //for (String valor : 
                         Set set = parametros.entrySet();
                         Iterator it = set.iterator();
                         while (it.hasNext()) {
                          Map.Entry<String, String[]> entry = 
                (         Map.Entry<String, String[]>) it.next();
                        String nombre = entry.getKey();
                        String[] valores = entry.getValue();
                        if(!nombre.startsWith("Sub") && !nombre.startsWith("Contra")){
                        
                        if (valores.length == 1) {
                        String valor = valores[0];
                        if (valor!=""){
                        out.print("<div id='datos'><strong>" + nombre + "</strong>: "+valor+"</div>");     
                           
                        }} else if(valores.length >1){
                            out.print("<div id='datos'><strong>" + nombre + "</strong>: ");
                         for (int i = 0; i < valores.length; i++) {
                           out.println( valores[i]);
                         }
                          out.println("</div>");
                         }
                        }
                      
                            
                        
                        }
        out.println("</div>");
        out.println("<br><div id='enlace'><<a href='"+request.getContextPath()+"'>Volver a la página inicial</a></div>"); 
        out.println("</body></html>");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //processRequest(request, response);
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @param continuar
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            boolean correcto=true;
            processRequest(request, response, correcto);
        
      
        
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
