package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Doctor;
import View.DoctorView;

/**
 * Servlet implementation class JavaServlet
 */
@WebServlet("/JavaServlet")
public class JavaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Doctor model  = Doctor.singleton();

    //Create a view : to write student details on console
    DoctorView view = new DoctorView();

    DoctorController controller = new DoctorController(model, view);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public JavaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				//response.getWriter().append("Server at: ").append(request.getContextPath());
		        //Especificamos la respuestas
		        PrintWriter salida = response.getWriter();

		        //Generar respuesta de la petición
		        salida.println("<html><body>");

		        salida.println("<h1 style='text-align:center'>");
		        salida.println(controller.updateView(""));

		        salida.println("</h1>");
		        for (int i=0; i<7;i++)
		            salida.println("");

		        salida.println("Fecha y hora:" + new Date());
		        salida.println("<body><html>");
		doGet(request, response);
	}

}
