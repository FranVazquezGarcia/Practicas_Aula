/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.practicas_aula.servlets;
//service, init, destroy
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fjvaz
 */
@WebServlet(name = "CicloDeVida", urlPatterns = {"/CicloDeVida"})
public class CicloDeVida extends HttpServlet {

    public CicloDeVida(){
        super();
        System.out.println("Se crea el Servlet");
    }
    
    
    @Override
    public void init(ServletConfig config){
        System.out.println("Se inicializa el Servlet"+config.getServletName());
        
    }
    
    @Override
    public void destroy(){
        System.out.println("Se destruye el Servlet");
    }
    
    @Override
    public void service( ServletRequest request, ServletResponse response){
        System.out.println("Se accede al Servlet");
    }
    
}
