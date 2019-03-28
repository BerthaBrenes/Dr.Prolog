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
        Query q1 = new Query("consult", new Term[] {new Atom("src/Database/test.pl")});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("descendent_of", new Term[] {X,new Atom("ralf")});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            return solution.get("X").name();
        }
        else{
            return "Database not connected";
        }
    }
}
