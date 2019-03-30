package Model;

import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

import java.util.Arrays;
import java.util.LinkedList;

public class Doctor {
    private static Doctor doctor = null;
    private LinkedList<Sickness> sicknesses; 
    private String direc = "C:\\Users\\fmuri\\Desktop\\drLog\\Dr.Prolog\\Dr.ProLog\\src\\Model\\drLogSinGramatical.pl";
    private Doctor(){
    	this.setSicknesses(new LinkedList<Sickness>()); ;
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
            	return SearchBySymptoms(evaluate);
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
            if(solution == null) {
            	for(Sickness sick : sicknesses)
            	{
            		if (sick.getName() == sickness)
            			return sick.getCause();
            	}
            	return null;
            }else {
            	return "Causa: " + solution.get("X").name();
            }           
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
            if(synthoms == "") {
            	for(Sickness sick : sicknesses)
            	{
            		if (sick.getName() == sickness)
            			return ArrayToString(sick.getSymptom());
            	}
            	return null;
            }else {
            	return "Sintomas: " + synthoms;
            }
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
            if(solution == null) {
            	for(Sickness sick : sicknesses)
            	{
            		if (sick.getName() == sickness)
            			return sick.getTreatment();
            	}
            	return null;
            }else {
            	return "Tratamiento: "+solution.get("X").name();
            }
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
            if(solution == null) {
            	for(Sickness sick : sicknesses)
            	{
            		if (sick.getName() == sickness)
            			return sick.getRecomendation();
            	}
            	return null;
            }else {
            	return "Recomendaciones y Precauciones: "+solution.get("X").name();
            }
        }
        else{
            return "Database not connected";
        }
	}
	public LinkedList<Sickness> getSicknesses() {
		return sicknesses;
	}
	public void setSicknesses(LinkedList<Sickness> sicknesses) {
		this.sicknesses = sicknesses;
	}
	private String SearchBySymptoms(String evaluate) {
		String [] sickness = evaluate.split(" ");
		
		for (Sickness sick : sicknesses) {
			Object[] arr1 = {sick.getSymptom()};
			Object[] arr2 = {sickness};
			if (Arrays.deepEquals(arr1,arr2))
				return sick.getName();
		}
		return null;
			
			
	}
    private String ArrayToString(String[] arr) {
    	String str = "";
    	for (String strArr:arr)
    		str+=", "+strArr;
    	return str;
    }
}
