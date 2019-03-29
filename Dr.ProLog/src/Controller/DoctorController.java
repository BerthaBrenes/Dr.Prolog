package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Doctor;

/**
 * Servlet implementation class DoctorController
 */
@WebServlet("/DoctorController")
public class DoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Doctor doctor = Doctor.singleton();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorController() {
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
		doGet(request, response);
		
		String[] Enfermedades = new String[5];
		
		
		Enfermedades[0] = doctor.getSickness(request.getParameter("usermsg"));//Enfermedad
		if (Enfermedades[0] == null) {
			RequestDispatcher myDispatcher = request.getRequestDispatcher("/Form.jsp");
			//Enviar a JSP
			myDispatcher.forward(request, response);
		}
		else {
			Enfermedades[1] = doctor.getCause(request.getParameter(Enfermedades[0]));//Causa
			Enfermedades[2] = doctor.getSymptom(request.getParameter(Enfermedades[0]));//Sintomas
			Enfermedades[3] = doctor.getTreatment(request.getParameter(Enfermedades[0]));//Tratamiento
			Enfermedades[4] = doctor.getRecomendations(request.getParameter(Enfermedades[0]));//Recomendaciones Y Prevenciones
			request.setAttribute("lista_enfermedades", Enfermedades);
			
			RequestDispatcher myDispatcher = request.getRequestDispatcher("/JavaView.jsp");			
			//Enviar a JSP
			myDispatcher.forward(request, response);
		}
		
	}

}
