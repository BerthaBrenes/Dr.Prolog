package Controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		// TODO Auto-generated method stub
		        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//De Fijo
		doGet(request, response);
		response.setContentType("text/html");
		
		//response.getWriter().append("Server at: ").append(request.getContextPath());
        //Especificamos la respuestas
        PrintWriter salida = response.getWriter();

        //Generar respuesta de la petición
        salida.println("<html><body>");
        //Texto que ingresa el usario
        String userentry = request.getParameter("usermsg");
        String docPhrase = controller.updateView(userentry);
        salida.println(docPhrase);
        salida.println("<h1 style='text-align:center'>");
        //salida.println(controller.updateView(""));

        salida.println("</h1>");
        for (int i=0; i<7;i++)
            salida.println("");

        salida.println("Maincra " + request.getParameter("usermsg"));
        salida.println("<body><html>");
	}

}
