package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Doctor;
import Model.Sickness;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Doctor doc = Doctor.singleton();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name = request.getParameter("sickness_name");
		String cause = request.getParameter("sickness_cause");
		String[] symptoms = request.getParameter("sickness_symptoms").split(",");
		String treatment = request.getParameter("sickness_treatment");
		String recomendation = request.getParameter("sickness_recomendation");
		Sickness sick = new Sickness(name,cause,symptoms,treatment,recomendation);
		
		doc.getSicknesses().add(sick);
		RequestDispatcher myDispatcher = request.getRequestDispatcher("/Introduction.jsp");			
		//Enviar a JSP
		myDispatcher.forward(request, response);
		
	}

}
