package Model;

import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

public class Doctor {
    private static Doctor doctor = null;
    private Doctor(){

    }
    public static Doctor singleton(){
        if (doctor == null)
            return doctor = new Doctor();
        else{
            return doctor;
        }
    }
    public String getPhrase(String patientPhrase){
    	//Codigo a La Base de Datos
        Query q1 = new Query("consult", new Term[] {new Atom("C:\\Users\\gababarca\\Desktop\\Dr.Prolog\\Dr.ProLog\\src\\Model\\drLogSinGramatical.pl")});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("drLogSintomas", new Term[] {new Atom(patientPhrase),X});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            System.out.println(patientPhrase);
            return solution.get("X").name();
        }
        else{
            return "Database not connected";
        }
    }
}
