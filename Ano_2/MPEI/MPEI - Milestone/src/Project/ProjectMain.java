package Project;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;

public class ProjectMain {
	
	static Scanner sc = new Scanner (System.in);
	
	static ArrayList<File> PeopleFileList = new ArrayList<File>();
	static ArrayList<Person> PeopleList = new ArrayList<Person>();
	
	public static void main (String[] args) throws IOException {
		
		String [] mainMenu = {"Report Crime", "Add Subject to Database", "Search Subject", "Exit"};
		
		
		//Load Files Content
		Path inputPath = Paths.get("./src/Project/Documents/Database");
		FileVisitor<Path> sfv = new SimpleFileVisitor<Path>() {
			@Override
			public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
				PeopleFileList.add(file.toFile());
			return FileVisitResult.CONTINUE;
			}
		};
		Files.walkFileTree(inputPath, sfv);
		PeopleList = FiletoPerson(PeopleFileList);
		
		
		
		int op = 0;
		do {
			try {
				op = menu(mainMenu);
				switch(op) {
					case 1:
						reportCrime();
					break;
					case 2:
						addToDB(getPersonData());
					break;
					case 3:
						//searchFromDB();
					break;
					case 4:
						System.exit(0);
					break;
					default:
						System.out.println("Insert an integer between 1 and 10.");
					break;
				}
			}
			catch (InputMismatchException a) {
				System.out.println("Insert integer.");
			}
		}
		while(op != 4);
		
	}
	
	
	

//--------------------------------------------------------------------------
//----------------------------D-A-T-A-B-A-S-E-------------------------------
//--------------------------------------------------------------------------
	
	private static void addToDB (Person person) throws IOException {
		PersontoFile(person);
		PeopleList.add(person);
	}
	
	
	
	
//--------------------------------------------------------------------------
//----------------------F-I-L-E---T-O---P-E-R-S-O-N-------------------------
//--------------------------------------------------------------------------

	private static ArrayList<Person> FiletoPerson (ArrayList<File> files) throws FileNotFoundException {
		ArrayList<Person> people = new ArrayList<Person>(files.size());
		ListIterator<File> iterator = files.listIterator();
		while (iterator.hasNext()) { 
			Person p = FiletoPerson(iterator.next());
			people.add(p);
		}
		return people;
	}
	
	
	private static Person FiletoPerson (File f) throws FileNotFoundException {
		Scanner scf = new Scanner(f);
		Person person = new Person();
		CriminalRecord cr = new CriminalRecord();
		String str = "";
		for (int i=0; scf.hasNextLine(); i++) {
			switch(i) {
				case 0:
					person.setName(scf.nextLine());
				break;
				case 1:
					str = scf.nextLine();
					if (str.toUpperCase().equals("M")) { person.setSex(true); }
					else if (str.toUpperCase().equals("F")) { person.setSex(false); }
				break;
				case 2:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setAge(Integer.parseInt(str)); }
				break;
				case 3:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setHairSize(str); };
				break;
				case 4:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setHairColor(str); };
				break;
				case 5:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setEyesColor(str); };
				break;
				case 6:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setHeight(Double.parseDouble(str)); }
				break;
				case 7:
					str = scf.nextLine();
					if((!str.equals(""))&&(!str.equals(null))) { person.setCorpulence(str); };
				break;
				default:
					str = scf.nextLine();
					String [] crimeArgs = str.split("\\|");
					cr.add(new CrimeCommited(crimeArgs[0], Integer.parseInt(crimeArgs[1])));
				break;
			}
		}
		person.setRecord(cr);
		scf.close();
		return person;
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
		str = person.getHairSize();
		if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getHairSize()); }
		else { pw.println(); }
		//Hair Color
		str = person.getHairColor();
		if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getHairColor()); }
		else { pw.println(); }
		//Eyes Color
		str = person.getEyesColor();
		if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getEyesColor()); }
		else { pw.println(); }
		//Height
		d = person.getHeight();
		if((d!=null)&&(d!=0)) { pw.println(d); }
		else { pw.println(); }
		//Corpulence
		str = person.getCorpulence();
		if((!str.equals(""))&&(!str.equals(null))) { pw.println(person.getCorpulence()); }
		else { pw.println(); }
		//Criminal Record
		try {
			for(CrimeCommited c : person.getRecord().getCrimeList()) { pw.println(c.getCrimeName().substring(0, 1).toUpperCase()+c.getCrimeName().substring(1)+"|"+c.getConvictionsAmount()); }
		} catch (NullPointerException e) {}
		pw.close();
		return file;
	}
	
	
	
	
//--------------------------------------------------------------------------
//------------------------R-E-P-O-R-T---C-R-I-M-E---------------------------
//--------------------------------------------------------------------------
	
	private static void reportCrime() {
		emptyLines(2);
		CrimeReported newCrime = new CrimeReported(read("Crime to Report"));
		emptyLines(1);
		String answer = "";
		while (!answer.equals("y")&&!answer.equals("n")) { answer = read("Suspect sighted? (Y/N)").toLowerCase(); }
		if (answer.equals("y")) {
			emptyLines(1);
			int nSuspects = readInteger("Number of suspects sighted");
			ArrayList<Person> suspects = new ArrayList<Person>(nSuspects);
			for (int i=0; i<nSuspects; i++) {
				emptyLines(1);
				System.out.printf("Suspect %02d\n",i+1);
				suspects.add(getSuspectDescription());
			}
			newCrime.addSuspects(suspects);
		}
		//MISSING
		//Finding on Database similar people to suspects
	}
	
	
	
	
//--------------------------------------------------------------------------
//-------------------------------M-E-N-U------------------------------------
//--------------------------------------------------------------------------
	
	private static int menu(String[] args) {
		emptyLines(3);
		System.out.print((char)9487);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		for (int i=0; i<args.length; i++) {
			System.out.print((char)9475);
			int spaceLeft = (int)((36-args[i].length())/2);
			int spaceRight = 36 - spaceLeft - args[i].length();
			for (int j=0; j<spaceLeft; j++) { System.out.print(" "); }
			System.out.print((i+1)+" - "+args[i]);
			for (int j=0; j<spaceRight; j++) { System.out.print(" "); }
			System.out.print((char)9475+"\n");
		}
		System.out.print((char)9495);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
		return readInteger();
	}
	
	
	
	private static int menu(LinkedList<String> args) {
		emptyLines(3);
		System.out.print((char)9487);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		for (int i=0; i<args.size(); i++) {
			System.out.print((char)9475);
			int spaceLeft = (int)((36-args.get(i).length())/2);
			int spaceRight = 36 - spaceLeft - args.get(i).length();
			for (int j=0; j<spaceLeft; j++) { System.out.print(" "); }
			System.out.print((i+1)+" - "+args.get(i));
			for (int j=0; j<spaceRight; j++) { System.out.print(" "); }
			System.out.print((char)9475+"\n");
		}
		System.out.print((char)9495);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
		return readInteger();
	}
	

	
	

//--------------------------------------------------------------------------
//--------------P-E-R-S-O-N-A-L---D-A-T-A---R-E-T-R-I-V-A-L-----------------
//--------------------------------------------------------------------------

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
	
	
	private static Person getPersonData() {
		String name = read("Name");
		Person person = getSuspectDescription();
		person.setName(name);
		String answer = "";
		while (!answer.equals("y")&&!answer.equals("n")) { answer = read("Does "+name+" have Criminal Record? (Y/N)").toLowerCase(); }
		if (answer.equals("y")) {
			CriminalRecord cr = new CriminalRecord();
			System.out.println("Type \"Done\" when all crimes have been inserted.");
			while(true) {
				String crimeName = read("Crime");
				if (crimeName.equals("Done")) { break; }
				int crimeAmount = readInteger("Number of convictions");
				cr.add(new CrimeCommited(crimeName, crimeAmount));
			}
			person.setRecord(cr);
		}
		System.out.println(person.toString());
		return person;
	}
	
	
	

//--------------------------------------------------------------------------
//-------------------------------R-E-A-D------------------------------------
//--------------------------------------------------------------------------
		
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
			
	
	
	
//--------------------------------------------------------------------------
//-------------------A-U-X-I-L-I-A-R---F-U-N-T-I-O-N-S----------------------
//--------------------------------------------------------------------------
	
	private static void emptyLines (int n) { for (int i=0; i<n; i++) { System.out.println(); } }

}
