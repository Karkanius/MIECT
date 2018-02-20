package KarkaniusUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import java.util.Stack;

public class Menu {

	
	/*
	 * ATRIBUTTES
	 */
	
	private String title = null;
	private ArrayList<String> options = new ArrayList<>();
	
	private boolean thinSeparator = true;

//----------------------------------------------------------------------------------------------------
	
	/*
	 * CONSTRUCTORS
	 */
	
	public Menu() {	}
	
	public Menu(List<String> list) { this.options.addAll(list); }
	
	public Menu(String title, List<String> list) { this.title = title; this.options.addAll(list); }
	
	public Menu(String[] arr) { this.options.addAll(Arrays.asList(arr)); }
	
	public Menu(String title, String[] arr) { this.title = title; this.options.addAll(Arrays.asList(arr)); }
	
//----------------------------------------------------------------------------------------------------

	/*
	 * BASIC METHODS
	 */
	
	public String getTitle() { return this.title; }
	
	public List<String> getOptions() { return this.options; }
	
	public void setTitle(String title) { this.title = title; }

	public void setOptions(ArrayList<String> options) { this.options = options; }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((options == null) ? 0 : options.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Menu other = (Menu) obj;
		if (options == null) {
			if (other.options != null)
				return false;
		} else if (!options.equals(other.options))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		String retValue = "MENU";
		if (!this.title.equals(null)) { retValue += " ["+this.title+"]"; }
		retValue += "\n";
		ListIterator<String> it = options.listIterator();
		while (it.hasNext()) { retValue += "\t"+it.next()+"\n"; }
		return retValue;
	}
	
//----------------------------------------------------------------------------------------------------
	
	/*
	 * CUSTOM METHODS
	 */
	
	public void printMenu() {
		int width = 30;
		int needed = 0;
		if (!this.title.equals(null)) {
			int aux = (int)Math.ceil((this.title.length()+4)/10.0)*10;
			if (needed<aux) { needed = aux; }
		}
		for (String str : this.options) {
			int aux = (int)Math.ceil((str.length()+4)/10.0)*10;
			if (needed<aux) { needed = aux; }
		}
		if (width<needed) { width = needed; }
		
		// Top
		System.out.print((char)9487);
		for (int i=0; i<width; i++) { System.out.print((char)9473); }
		System.out.println((char)9491);
		
		// Title
		if (!this.title.equals(null)) {
			System.out.print((char)9475);
			int usedSpace = this.title.length();
			int spaceLeft = (int)((width-usedSpace)/2);
			int spaceRight = width-(spaceLeft+usedSpace);
			for (int j=0; j<spaceLeft; j++) { System.out.print(" "); }
			System.out.print(this.title);
			for (int j=0; j<spaceRight; j++) { System.out.print(" "); }
			System.out.print((char)9475+"\n");
		
			// Title-Middle Separator
			if (thinSeparator) {
				System.out.print((char)9504);
				for (int i=0; i<width; i++) { System.out.print((char)9472); }
				System.out.print((char)9512+"\n");
			} else {
				System.out.print((char)9507);
				for (int i=0; i<width; i++) { System.out.print((char)9473); }
				System.out.print((char)9515+"\n");
			}
		}
		
		//Middle
		for (int i=0; i<options.size(); i++) {
			System.out.print((char)9475);
			int usedSpace = 4+options.get(i).length();
			int spaceLeft = (int)((width-usedSpace)/2);
			int spaceRight = width-(spaceLeft+usedSpace);
			for (int j=0; j<spaceLeft; j++) { System.out.print(" "); }
			System.out.print((i+1)+" - "+options.get(i));
			for (int j=0; j<spaceRight; j++) { System.out.print(" "); }
			System.out.print((char)9475+"\n");
		}
		
		//Bottom
		System.out.print((char)9495);
		for (int i=0; i<width; i++) { System.out.print((char)9473); }
		System.out.println((char)9499);
	}
	
	public void invertOptions() {
		Stack<String> stc = new Stack<>();
		ListIterator<String> it = options.listIterator();
		while (it.hasNext()) { stc.push(it.next()); }
		this.options = new ArrayList<>();
		while (!stc.isEmpty()) { options.add(stc.pop()); }
	}
}
