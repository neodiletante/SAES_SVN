/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.redes_sociales;

import catalogos.grupos.Grupo;
import catalogos.grupos.GruposDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author maria
 */
public class BuscaGruposServlet extends HttpServlet {

  /**
   * Processes requests for both HTTP
   * <code>GET</code> and
   * <code>POST</code> methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    System.out.println("En el servlet de busca grupos combo");
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    String corte = (String) request.getParameter("corte");
System.out.println("corte " + corte);   
    //HttpSession session = request.getSession();
    Connection conn = (Connection) session.getAttribute("conn");
    GruposDAO gDAO = new GruposDAO(conn);
    
    List<Grupo> grupos = gDAO.consultaGrupos(Integer.parseInt(corte));
    System.out.println("No. elkementeos " + grupos.size());
        for(int i=0 ; i< grupos.size() ; i++){
          Grupo grupo = grupos.get(i);
            System.out.println(grupo.getGrado() + " " + grupo.getGrupo()) ;
      }
    
    
    //List cortes = gDAO.consultaCortes();
     
    //String dato = "{\"id\":\"" + datoInteres.getIdDato() + "\","
    //        + "\"descripcion\":\"" +datoInteres.getDescripcion() + "\","
    //        + "\"tipo\":\"" + datoInteres.getTipo() + "\"}";
    session.setAttribute("grupos", grupos);
  //  session.setAttribute("cortes",cortes);
    //request.setAttribute()
   // request.setAttribute("grupos", grupos);
   // RequestDispatcher view = request.getRequestDispatcher("Catalogos/Redes_sociales/redes_sociales_reg.jsp");
    //view.forward(request, response);
    try {
    
    } finally {      
      out.close();
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP
   * <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP
   * <code>POST</code> method.
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
