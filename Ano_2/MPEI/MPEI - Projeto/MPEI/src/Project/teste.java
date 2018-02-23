package Project;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class teste {
	
	static ArrayList<Person> PeopleList;
	static BloomFilter bf;
	
	static Scanner sc = new Scanner (System.in);
	
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
	
		PeopleList = new ArrayList<Person>();
		for (int i=0; i<2000; i++) { PeopleList.add(GeneratePerson()); }
		
		Person pers = getSuspectDescription();
		CriminalRecord cr = new CriminalRecord();
		cr.add(new CrimeCommited("Fraud", 2));
		pers.setRecord(cr);
		PeopleList.add(pers);
		
		//Add Criminals to Bloom Filter
		bf = new BloomFilter(nElemToInsert());
		ListIterator<Person> iteratorPL = PeopleList.listIterator();
	    while (iteratorPL.hasNext()) {
	    	Person p = iteratorPL.next();
	    	try{
		    	if(p.getRecord().getCrimeAmount()!=0) {
			    	LinkedList<CrimeCommited> list = p.getRecord().getCrimeList();
		    		for (int i=0; i<list.size(); i++) { bf.insert(list.get(i).getCrimeName()+p.hashCode()); }
		    	}
	    	}catch(NullPointerException e) {}
	    }
	    System.out.println(bf.isMember("Fraud"+pers.hashCode()));
	}
	
	
	public static int nElemToInsert() {
		int n=0;
		ListIterator<Person> iteratorPL = PeopleList.listIterator();
	    while (iteratorPL.hasNext()) { try{n += iteratorPL.next().getRecord().getCrimeAmount();}catch(NullPointerException e) {} }
	    return n;
	}
	
	private static Person getSuspectDescription() {
		Person suspect = new Person();
		String str;
		Integer i;
		Double d;
		str = read("Sex (M/F)");	if((!str.equals(""))&&(!str.equals(null))) {
										if(str.toLowerCase().equals("m")) { suspect.setSex(true); }
										else if(str.toLowerCase().equals("f")) { suspect.setSex(false); } }
		i = readInteger("Age");		if((i!=null)&&(i!=0)) { suspect.setAge(i); }
		str = read("Hair Size");	if((!str.equals(""))&&(!str.equals(null))) { suspect.setHairSize(str); }
		str = read("Hair Color");	if((!str.equals(""))&&(!str.equals(null))) { suspect.setHairColor(str); }
		str = read("Eyes Color");	if((!str.equals(""))&&(!str.equals(null))) { suspect.setEyesColor(str); }
		d = readDouble("Height");	if((d!=null)&&(d!=0)) { suspect.setHeight(d); }
		str = read("Corpulence");	if((!str.equals(""))&&(!str.equals(null))) { suspect.setCorpulence(str); }
		return suspect;
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
	
	
	private static double randBetween(double min, double max) { return Math.random()*Math.abs(max-min)+min; }
	
	
	private static String read() {
		System.out.print((char)9205+" ");
		return sc.nextLine();
	}
	
	
	private static String read(String text) {
		System.out.println(text);
		return read();
	}
	
	
	private static Integer readInteger() {
		System.out.print((char)9205+" ");
		String aux = sc.nextLine();
		if((!aux.equals(""))&&(!aux.equals(null))) { return Integer.parseInt(aux); }
		else { return null; }
	}
	
	
	private static Integer readInteger(String text) {
		System.out.println(text);
		return readInteger();
	}
	
	
	private static Double readDouble() {
		System.out.print((char)9205+" ");
		String aux = sc.nextLine();
		for(int i=0; i<aux.length(); i++) { if(aux.charAt(i)==',') { aux = aux.substring(0,i)+'.'+aux.substring(i+1); } }
		if((!aux.equals(""))&&(!aux.equals(null))) { return Double.parseDouble(aux); }
		else { return null; }
	}
	
	
	private static Double readDouble(String text) {
		System.out.println(text);
		return readDouble();
	}	
}
