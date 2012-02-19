/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package catalogos.alumnos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ulises
 */
public class ModificarAlumnoServlet extends HttpServlet {

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
    System.out.println("En el servlet de modificado");
    int noExpedienteAnt = Integer.parseInt(request.getParameter("noExpedienteAnt"));
    String noExpediente = request.getParameter("noExpediente");
    String nombre = request.getParameter("nombre");
    String sexo = request.getParameter("sexo");
    Alumno alumnoUpdate = new Alumno(noExpediente, nombre, sexo);   
    System.out.println(noExpedienteAnt);
    System.out.println(noExpediente);
    HttpSession session = request.getSession();
    Connection conect = (Connection) session.getAttribute("conn");
    AlumnosDAO aDAO = new AlumnosDAO(conect);
    int status = aDAO.modificarAlumno(noExpedienteAnt, alumnoUpdate);
    
    // Agregado para validar si se insertó en la BD
    String mensaje = "";
    if(status == 1){
      mensaje = "Alumno modificado";
    }else if(status == 0){
      mensaje = "No se pudo modificar porque ya existe un alumno con ese No. de expediente";
    }else{
      mensaje = "No se pudo modificar porque ocurrió un error en la Base de Datos";
    }
    response.setContentType("charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
     
      out.println(mensaje);
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