package Project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

public class GenerateRandomPeople {
	
	
	static String [] firstNameF = {"Anna", "Mary", "Joanne", "Daisy", "Lily", "Catherine", "Louise", "Emma", "Olivia", "Sophia",
									"Isabella", "Mia", "Charlotte", "Amelia", "Harper", "Emily", "Madison", "Scarlett", "Grace", "Aubrey",
									"Zoey", "Penelope", "Zoe", "Stella", "Lucy", "Nora", "Skylar", "Violet", "Leah", "Camila",
									"Sarah", "Aurora", "Gabriella", "Bella", "Luna", "Hailey", "Eleanor", "Samantha"};

	static String [] firstNameM = {"Liam", "Noah", "Elijah", "Mason", "James", "Aiden", "Ethan", "Lucas", "Jacob", "Michael",
									"Matthew", "Benjamin", "Alexander", "William", "Jack", "Daniel", "Jayden", "Oliver", "Sebastian", "Joseph",
									"David", "Gabriel", "Julian", "Jackson", "Anthony", "John", "Dylan", "Ted", "Barney", "Marshall"};
	
	static String [] lastName = {"Simth", "Jones", "Taylor", "Williams", "Brown", "Davies", "Evans", "Wilson", "Thomas", "Roberts",
									"Johnson", "Lewis", "Walker", "Robinson", "Wood", "Thompson", "White", "Watson", "Jackson", "Wright",
									"Green", "Mosby", "Stinson"};
	
	static String [] hairSize = {"short", "medium", "long"};
	
	static String [] hairColor = {"blonde", "brown", "black"};
	
	static String [] eyesColor = {"brown", "brown", "brown", "brown", "gray", "black", "black", "black", "blue", "blue", "green"};
	
	static String [] corpulence = {"Thin", "Normal", "Fat"};
	
	static String [] crimeNames = {"Fraud", "Assault", "Murder", "Rape", "Drug traffic",
									"Human traffic", "Theft", "Burglary", "Robbery", "Domestic violence",
									"Prostitution", "Criminal possession of a weapon"};
	
	public static void main(String[] args) throws IOException {

		int n = 10000; //People to Generate
		
		for(int i=0; i<n; i++) { PersontoFile(GeneratePerson()); }
		
	}
	

	
	
//--------------------------------------------------------------------------
//---------------------G-E-N-E-R-A-T-E---P-E-R-S-O-N------------------------
//--------------------------------------------------------------------------
	
	public static Person GeneratePerson() {
		Person p = new Person();
		//Sex
		p.setSex(Math.random()>0.5);
		//Name
		if(p.getSex()) { p.setName(firstNameM[(int)randBetween(0,firstNameM.length)]); }
		else { p.setName(firstNameF[(int)randBetween(0,firstNameF.length)]); }
		p.setName(p.getName()+" "+lastName[(int)randBetween(0,lastName.length)]);
		//Age
		p.setAge((int)randBetween(18,70));
		//Hair
		p.setHairSize(hairSize[(int)randBetween(0,hairSize.length)]);
		p.setHairColor(hairColor[(int)randBetween(0,hairColor.length)]);
		//Eyes
		p.setEyesColor(eyesColor[(int)randBetween(0,eyesColor.length)]);
		//Physical Appearance
		p.setHeight(randBetween(1.5,2.1));
		p.setCorpulence(corpulence[(int)randBetween(0,corpulence.length)]);
		//Crime Record
		int n = (int)Math.round(randBetween(0,3));
		if(n!=0) {
			CriminalRecord cr = new CriminalRecord();
			for(int i=0; i<n; i++) {
				cr.add(new CrimeCommited(crimeNames[(int)randBetween(0,crimeNames.length)], (int)Math.round(randBetween(1,3))));
			}
			p.setRecord(cr);
		}
		return p;
	}
	

	

//--------------------------------------------------------------------------
//----------------------P-E-R-S-O-N---T-O---F-I-L-E-------------------------
//--------------------------------------------------------------------------

	private static File PersontoFile (Person person) throws IOException {
		String fileName = person.hashCode()+".txt";
		File file = new File("./src/Project/Documents/Database",fileName);
		file.createNewFile();
		PrintWriter pw = new PrintWriter(file);
		Boolean b;
		String str;
		Integer n;
		Double d;
		//Name
		str = person.getName();
		if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getName()); }
		else { pw.println(); }
		//Sex
		b = person.getSex();
		if(b!=null) {
			if(b) { pw.println("M"); }
			else { pw.println("F"); }
		}
		else { pw.println(); }
		//Age
		n = person.getAge();
		if((n!=null)&&(n!=0)) { pw.println(n); }
		else { pw.println(); }
		//Hair Size
		try {
			str = person.getHairSize();
			if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getHairSize()); }
			else { pw.println(); }
		} catch (NullPointerException e) {}
		//Hair Color
		try {
			str = person.getHairColor();
			if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getHairColor()); }
			else { pw.println(); }
		} catch (NullPointerException e) {}
		//Eyes Color
		try {
			str = person.getEyesColor();
			if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getEyesColor()); }
			else { pw.println(); }
		} catch (NullPointerException e) {}
		//Height
		try {
			d = person.getHeight();
			if((d!=null)&&(d!=0)) { pw.println(String.format("%1$.2f",d)); }
			else { pw.println(); }
		} catch (NullPointerException e) {}
		//Corpulence
		try {
			str = person.getCorpulence();
			if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getCorpulence()); }
			else { pw.println(); }
		} catch (NullPointerException e) {}
		//Criminal Record
		try {
			for(CrimeCommited c : person.getRecord().getCrimeList()) { pw.println(c.getCrimeName().substring(0, 1).toUpperCase()+c.getCrimeName().substring(1)+"|"+c.getConvictionsAmount()); }
		} catch (NullPointerException e) {}
		pw.close();
		return file;
	}
	
	


//--------------------------------------------------------------------------
//----------------------M-A-T-H---F-U-N-C-T-I-O-N-S-------------------------
//--------------------------------------------------------------------------
	
	private static double logX(int base, double x) { return Math.log(x) / Math.log(base); }
	
	private static double randBetween(double min, double max) { return Math.random()*Math.abs(max-min)+min; }
	
}
