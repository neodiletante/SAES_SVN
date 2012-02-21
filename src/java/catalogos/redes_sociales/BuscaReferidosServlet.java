/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.redes_sociales;

import catalogos.datos_interes.DatoInteres;
import catalogos.datos_interes.DatosInteresDAO;
import catalogos.datos_interes.TipoDato;
import catalogos.listas.ListasDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ulises
 */
@WebServlet(name = "BuscaReferidos", urlPatterns = {"/buscaReferidos"})
public class BuscaReferidosServlet extends HttpServlet {

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
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    Connection conect = (Connection) session.getAttribute("conn");
    List<ListasDAO> lista = (List) session.getAttribute("lista");
    ListasDAO alumno = new ListasDAO();
    String noLista = request.getParameter("no_lista");
    alumno.setNo_lista(Integer.parseInt(noLista));
    //List referidos = lista;
    List<ListasDAO> referidos = new ArrayList<ListasDAO>();
    for(ListasDAO dao : lista){
      referidos.add(dao);
    }
    referidos.remove(alumno);
    //System.out.println("Referidos " + referidos.size());
    session.setAttribute("referidos", referidos);
    
    
    
     DatosInteresDAO dDAO = new DatosInteresDAO(conect);
    
    //  List lista = new ListasDAO(conect).getDatos(2);
      List<DatoInteres> datosInteres = dDAO.buscaDatosInteres(); 
      List<TipoDato> tiposDato = dDAO.buscaTiposDeDatos(false); 
      Map datos = new HashMap();
      for(TipoDato tipo : tiposDato){
        List<DatoInteres> datosXT = null;
        System.out.println(tipo.getDescripcion());
        datosXT = new ArrayList<DatoInteres>();
        for(DatoInteres datoInteres : datosInteres){
          
          if (datoInteres.getTipo() == tipo.getTipo()){
            datosXT.add(datoInteres);
            System.out.println(datoInteres.getDescripcion());
          }
        }
        request.setAttribute(tipo.getDescripcion(), datosXT);
        datos.put(tipo.getDescripcion(), datosXT);
      }
      
    
      
      for(TipoDato tipo : tiposDato){
        System.out.println("Tipo de dato " + tipo.getDescripcion());
        List list =  (List) datos.get(tipo.getDescripcion());
      //  List list =  (List) datos.get("sociales");
        for(Object di : list){
      //    if (datos.containsKey(tipo.getDescripcion())){
          String desc = ((DatoInteres)di).getDescripcion();
            System.out.println("desc " + desc);
        //  }
        }
      }
    //  System.out.println("Quitando el atributo grupos");
     // session.removeAttribute("grupos");
     // session.removeAttribute("cortes");
     // session.removeAttribute("referidos");
     // session.removeAttribute("lista");
       session.setAttribute("datosInteres", datosInteres);
      session.setAttribute("datos", datos);
      session.setAttribute("tiposDato", tiposDato);
    
    
    
    
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
