package View;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Servlet(){
        super();
    }

    /**
     *
     * @psee request HttpServlet#doGet(HttpServletRequest request, HttpServletRequest response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        //response.getWriter().append("Server at: ").append(request.getContextPath());
        //Especificamos la respuestas
        PrintWriter salida = response.getWriter();

        //Generar respuesta de la petición
        salida.println("<html><body>");

        salida.println("<h1 style='text-align:center'>Prueba Servlet</h1>");
        for (int i=0; i<7;i++)
            salida.println("");

        salida.println("Fecha y hora:" + new Date());
        salida.println("<body><html>");
    }

}
