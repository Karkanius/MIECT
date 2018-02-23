package Project;

import java.util.LinkedList;
import java.util.ListIterator;

public class CriminalRecord {

	//ATTRIBUTES
	private LinkedList<CrimeCommited> crimeList = new LinkedList<CrimeCommited>();
	
	
	//CONSTRUCTORES
	
	public CriminalRecord() { }
	
	public CriminalRecord(LinkedList<CrimeCommited> crimes) {
		this.crimeList = crimes;
	}
	
	
	//METHODS
	
	public int getCrimeAmount() { return this.crimeList.size(); }
	public LinkedList<CrimeCommited> getCrimeList() { return this.crimeList; }
	
	public int getConvictionsAmount() {
		int amount=0;
		ListIterator<CrimeCommited> iterator = crimeList.listIterator();
		while (iterator.hasNext()) {
			amount += iterator.next().getConvictionsAmount();
		}
		return amount;
	}
	
	
	public boolean crimeCommitted(Crime c) {
		ListIterator<CrimeCommited> iterator = crimeList.listIterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(c.getCrimeName().toLowerCase())) { return true; } }
		return false;
	}
	
	
	public boolean crimeCommitted(String crimeName) {
		crimeName = crimeName.toLowerCase();
		ListIterator<CrimeCommited> iterator = crimeList.listIterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(crimeName)) { return true; }	}
		return false;
	}
	
	
	private CrimeCommited getCrime(CrimeCommited c) {
		assert this.crimeCommitted(c):"ERROR: Crime not committed. Unable to return not committed crime.";
		ListIterator<CrimeCommited> iterator = crimeList.listIterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(c.getCrimeName().toLowerCase())) { return iterator.next(); }	}
		return null;
	}
	
	
	private Crime getCrime(String crimeName) {
		crimeName = crimeName.toLowerCase();
		assert this.crimeCommitted(crimeName):"ERROR: Crime not committed. Unable to return not committed crime.";
		ListIterator<CrimeCommited> iterator = crimeList.listIterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(crimeName)) { return iterator.next(); } }
		return null;
	}
		
	
	public void add(CrimeCommited newCrime) {
		if (this.crimeCommitted(newCrime)) {
			int index = crimeList.indexOf(this.getCrime(newCrime));
			crimeList.set(index, new CrimeCommited(newCrime.getCrimeName(), this.getCrime(newCrime).getConvictionsAmount()+newCrime.getConvictionsAmount()));
		}
		else { crimeList.add(newCrime); }
	}
	
	
	@Override
	public String toString() {
		String str = "Crime Record";
		for (int i=0; i<crimeList.size(); i++) { str += "\n\t"+crimeList.get(i).toString(); }
		return str;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((crimeList == null) ? 0 : crimeList.hashCode());
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
		CriminalRecord other = (CriminalRecord) obj;
		if (crimeList == null) {
			if (other.crimeList != null)
				return false;
		} else if (!crimeList.equals(other.crimeList))
			return false;
		return true;
	}
		
}
