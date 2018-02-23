package Project;

import java.util.ArrayList;

public class CrimeReported extends Crime {
	
	//ATTRIBUTES
	
	private ArrayList<Person> suspects = new ArrayList<Person>();
	
	
	//CONSTRUCTORES
	
	public CrimeReported(String name) {
		super(name);
	}
	
	
	public CrimeReported(String name, ArrayList<Person> suspects) {
		super(name);
		this.suspects = suspects;
	}
	
	
	
	
	//METHODS
	
	public ArrayList<Person> getSuspects() { return this.suspects; }
	public int getNumberOfSuspects() { return this.suspects.size(); }
	public void addSuspect(Person suspect) { this.suspects.add(suspect); }
	public void addSuspects(ArrayList<Person> suspects) { for(Person p : suspects) { this.suspects.add(p); } }
	
	@Override
	public String toString() { 
		String str = super.getCrimeName().substring(0, 1).toUpperCase()+super.getCrimeName().substring(1)+" - ";
		if (this.suspects!=null) { str += "Suspect description available"; }
		else { str += "No suspect description available"; }
		return str;
	}
}
