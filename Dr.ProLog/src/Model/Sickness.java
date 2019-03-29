package Model;

public class Sickness {
	private String Name;
	private String Cause;
	private String[] Symptom;
	private String Treatment;
	private String Recomendation;
	
	
	public Sickness(String Name, String Cause, String[] Symptom, String Treatment,String Recomendation){
		this.Name = Name;
		this.Cause = Cause;
		this.Symptom = Symptom;
		this.Treatment = Treatment;
		this.Recomendation = Recomendation;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String[] getSymptom() {
		return Symptom;
	}
	public void setSymptom(String[] symptom) {
		Symptom = symptom;
	}
	public String getRecomendation() {
		return Recomendation;
	}
	public void setRecomendation(String recomendation) {
		Recomendation = recomendation;
	}
	public String getCause() {
		return Cause;
	}
	public void setCause(String cause) {
		Cause = cause;
	}
	public String getTreatment() {
		return Treatment;
	}
	public void setTreatment(String treatment) {
		Treatment = treatment;
	}
	
}
