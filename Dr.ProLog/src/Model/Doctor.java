package Model;

import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

import java.util.Set;
import java.util.TreeMap;

public class Doctor {
    private static Doctor doctor = null;
    private TreeMap sicknesses; 
    private String direc = "C:\\Users\\gababarca\\Desktop\\Dr.Prolog\\Dr.ProLog\\src\\Model\\drLogSinGramatical.pl";
    private Doctor(){
    	this.sicknesses = new TreeMap(new SicknessComparator());
    }
    public static Doctor singleton(){
        if (doctor == null)
            return doctor = new Doctor();
        else{
            return doctor;
        }
    }
    public String getSickness(String evaluate){
    	//Codigo a La Base de Datos
        Query q1 = new Query("consult", new Term[] {new Atom(direc)});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("drLogSintomas", new Term[] {new Atom(evaluate),X});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            if (solution == null) {
            	//Buscar en el arbol
            	//Si no está en el arbol manda null
            	return null;
            }else {
            	return solution.get("X").name();
            }
            
        }
        else{
            return "Database not connected";
        }
    }
    public String getCause(String sickness) {
    	Query q1 = new Query("consult", new Term[] {new Atom(direc)});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("drLogCausa", new Term[] {new Atom(sickness),X});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            return "Causa: " + solution.get("X").name();
        }
        else{
            return "Database not connected";
        }
	}
    public String getSymptom(String sickness) {
    	Query q1 = new Query("consult", new Term[] {new Atom(direc)});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("enfermedad", new Term[] {new Atom(sickness),X});
            
            java.util.Map<String,Term> solution;
            String synthoms = "";
            while ( q2.hasMoreSolutions()) {    
          		solution = q2.nextSolution();
                synthoms+=solution.get("X");
            }
            return "Sintomas: " + synthoms;
        }
        else{
            return "Database not connected";
        }
    }
	
	public String getTreatment(String sickness) {
		Query q1 = new Query("consult", new Term[] {new Atom(direc)});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("drLogConsejos", new Term[] {new Atom(sickness),X});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            return "Tratamiento: "+solution.get("X").name();
        }
        else{
            return "Database not connected";
        }
	}
	public String getRecomendations(String sickness) {
		Query q1 = new Query("consult", new Term[] {new Atom(direc)});
        if(q1.hasSolution()){
            Variable X = new Variable("X");
            Query q2 =new Query("drLogRecomendacion", new Term[] {new Atom(sickness),X});
            
            java.util.Map<String,Term> solution;
            solution = q2.oneSolution();
            return "Recomendaciones y Precauciones: "+solution.get("X").name();
        }
        else{
            return "Database not connected";
        }
	}
    
}
