package aula03;
import java.util.*;

public class ex04 {
	
	static Scanner sc = new Scanner (System.in);
	
	//Video Organization
	static HashMap<String, Video> vids = new HashMap<String, Video> ();
	static int nextIDVid = 1;
	
	//People Organization
	static HashMap<Integer, User> users = new HashMap<Integer, User> ();
	static int nextIDUser = 1;
	
	
	public static void main (String[] args) {
		//Auxiliary Variables
		int op = 0;
		
		do {
			try {
				menu();
				switch(op) {
					case 1:
						addUser();
					break;
					case 2:
						removeUser();
					break;
					case 3:
						addVideo();
					break;
					case 4:
						removeVideo();
					break;
					case 5:
						verifyVideo();
					break;
					case 6:
						checkout();
					break;
					case 7:
						checkin();
					break;
					case 8:
						videoHistory();
					break;
					case 9:
						videoRatings();
					break;
					case 10:
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
		while(op != 9);
		
	}
	
	
	
//--------------------------------------------------------------------------
//-------------------------------M-E-N-U------------------------------------
//--------------------------------------------------------------------------
	
	private static void menu() {
		System.out.println();
		System.out.println();
		System.out.println();
		
		System.out.print((char)9487);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		
		System.out.println((char)9475+"              1 - Add User              "+(char)9475);
		System.out.println((char)9475+"            2 - Remove User             "+(char)9475);
		System.out.println((char)9475+"             3 - Add Video              "+(char)9475);
		System.out.println((char)9475+"            4 - Remove Video            "+(char)9475);
		System.out.println((char)9475+"        5 - Verify Video Status         "+(char)9475);
		System.out.println((char)9475+"              6 - Checkout              "+(char)9475);
		System.out.println((char)9475+"              7 - Checkin               "+(char)9475);
		System.out.println((char)9475+"       8 - Video Checkout History       "+(char)9475);
		System.out.println((char)9475+"           9 - Video Ratings            "+(char)9475);
		System.out.println((char)9475+"               10 - Exit                "+(char)9475);
		
		System.out.print((char)9495);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
		
		//return Integer.parseInt(read());
	}
	

	
	
	
//--------------------------------------------------------------------------
//----------------------U-S-E-R-------R-E-L-A-T-E-D-------------------------
//-------------------------F-U-N-C-T-I-O-N-S--------------------------------
//--------------------------------------------------------------------------	
	
	private static void addUser() {
		int op = 0;
		
		String tempName;
		int tempCC, tempDay, tempMonth, tempYear;
		Date tempDate;
		
		System.out.println();
		
		System.out.print((char)9487);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		System.out.println((char)9475+"            1 - Add Student             "+(char)9475);
		System.out.println((char)9475+"             2 - Add Worker             "+(char)9475);
		System.out.print((char)9495);
		for (int i=0; i<40; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
		
		try {
			op = Integer.parseInt(read());
			switch(op) {
				case 1:
					tempName = read("Name");
					tempCC = Integer.parseInt(read("CC"));
					System.out.println("Birthday");
					tempDay = Integer.parseInt(read("\tDay"));
					tempMonth = Integer.parseInt(read("\tMonth"));
					tempYear = Integer.parseInt(read("\tYear"));
					tempDate = new Date (tempDay, tempMonth, tempYear);
					int tempNMec = Integer.parseInt(read("Nmec"));
					String tempCourse = read("Course");
					Student tempStudent = new Student(nextIDUser, tempName, tempCC, tempDate, tempNMec, tempCourse);
					users.put(tempCC, tempStudent);
					nextIDUser++;
					System.out.println("Student "+tempName+" added to users.");
				break;
				case 2:
					tempName = read("Name");
					tempCC = Integer.parseInt(read("CC"));
					System.out.println("Birthday");
					tempDay = Integer.parseInt(read("\tDay"));
					tempMonth = Integer.parseInt(read("\tMonth"));
					tempYear = Integer.parseInt(read("\tYear"));
					tempDate = new Date (tempDay, tempMonth, tempYear);
					int tempNWorker = Integer.parseInt(read("Worker Number"));
					int tempNIF = Integer.parseInt(read("NIF"));
					Worker tempWorker = new Worker(nextIDUser, tempName, tempCC, tempDate, tempNWorker, tempNIF);
					users.put(tempCC, tempWorker);
					nextIDUser++;
					System.out.println("Worker "+tempName+" added to users.");
				break;
				default:
					System.out.println("Insert number 1 or 2.");
				break;
			}
		}
		catch (InputMismatchException a) {
			System.out.println("Insert integer.");
		}
	}
	
	
	private static void removeUser() {
		int cc = Integer.parseInt(read("Insert the user's CC number."));
		if (users.containsKey(cc)) {
			users.remove(cc);
			System.out.println("User removed.");
		}
		else { System.out.println("CC number not associated with any existing user."); }
	}
	




//--------------------------------------------------------------------------
//---------------------V-I-D-E-O------R-E-L-A-T-E-D-------------------------
//-------------------------F-U-N-C-T-I-O-N-S--------------------------------
//--------------------------------------------------------------------------	
	
	private static void addVideo() {
		String title, category;
		int ageAux;
		AgeRate rate = new AgeRate ();
		
		title = read("Title");
		
		category = read("Category");
		
		System.out.println("Age");
		System.out.println("1 - ALL");
		System.out.println("2 - M6");
		System.out.println("3 - M12");
		System.out.println("4 - M16");
		System.out.println("5 - M18");	
		try {
			ageAux = Integer.parseInt(sc.nextLine());
			switch(ageAux) {
				case 1:
					rate = new AgeRate(0);
				break;
				case 2:
					rate = new AgeRate(6);
				break;
				case 3:
					rate = new AgeRate(12);
				break;
				case 4:
					rate = new AgeRate(16);
				break;
				case 5:
					rate = new AgeRate(18);
				break;
				default:
					System.out.println("Insert an integer between 1 and 5.");
				break;
			}
		}
		catch (InputMismatchException a) {
		System.out.println("Insert integer.");
		}
		Video vid = new Video (nextIDVid, title, category, rate);
		vids.put(title, vid);
		nextIDVid++;
	}
	
	
	private static void removeVideo() {
		
	}
	
	
	private static void verifyVideo() {
		
	}
	
	
	private static void videoHistory() {
		
	}
	
	
	private static void videoRatings() {
		Video [] rated = new Video [vids.size()];
		Set<String> keysSet = vids.keySet();
		String [] keysArray = new String [keysSet.size()];
		keysSet.toArray(keysArray);
		for (int i=0; i<keysArray.length; i++) {
			for (int j=0; j<rated.length; j++) {
				if (vids.get(keysArray[i]).getTotalRating()>rated[j].getTotalRating()) {
					System.arraycopy(rated, j, rated, j+1, rated.length-j);
					rated[j] = vids.get(keysArray[i]);
					break;
				}
			}	
		}
		
		for (int i=0; i<rated.length; i++) {
			System.out.println("Filme: "+rated[i].getTitle());
			System.out.println("Rating: "+rated[i].getAverageRating());
		}
	}




	
//---------------------------C-H-E-C-K-O-U-T--------------------------------
//--------------------------------A-N-D-------------------------------------
//----------------------------C-H-E-C-K-I-N---------------------------------
	
	private static void checkout() {
		String vidKey = read("Video Name");
		if (vids.containsKey(vidKey)) {
			Video vid = vids.get(vidKey);
			if (vid.inStock()) {
				vid.checkOut();
				vids.replace(vidKey, vid);
			}
			else {
				System.out.println("No copy of "+vidKey+" in stock.");
			}
		}
		else {
			System.out.print("ERROR: No such video entry in database.");
		}
	}
	
	
	private static void checkin() {
		String vidKey = read("Video Name");
		if (vids.containsKey(vidKey)) {
			Video vid = vids.get(vidKey);
			vid.checkIn();
			int r = Integer.parseInt(read("Rating (1-10)"));
			vid.rate(r);
			vids.replace(vidKey, vid);
		}
	}
	

	

//--------------------------------------------------------------------------
//-------------------------------R-E-A-D------------------------------------
//--------------------------------------------------------------------------
	
	private static String read () {
		System.out.print((char)9205+" ");
		return sc.nextLine();
	}
	
	
	private static String read (String text) {
		System.out.println(text);
		System.out.print((char)9205+" ");
		return sc.nextLine();
	}
}
