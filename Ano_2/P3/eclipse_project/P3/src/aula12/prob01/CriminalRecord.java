package aula12.prob01;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.NoSuchElementException;

public class CriminalRecord {

	//ATTRIBUTES
	private HashMap<String,CrimeCommited> crimeList = new HashMap<String,CrimeCommited>();
	
	
	//CONSTRUCTORES
	
	public CriminalRecord() { }
	
	public CriminalRecord(HashMap<String,CrimeCommited> crimes) {
		this.crimeList = crimes;
	}
	
	
	//METHODS
	
	public int getCrimeAmount() { return this.crimeList.size(); }
	public LinkedList<CrimeCommited> getCrimeList() {
		LinkedList<CrimeCommited> l = new LinkedList<CrimeCommited>();
		l.addAll(this.crimeList.values());
		return l;
	}
	
	public int getConvictionsAmount() {
		int amount=0;
		Iterator<CrimeCommited> iterator = crimeList.values().iterator();
		while (iterator.hasNext()) {
			amount += iterator.next().getConvictionsAmount();
		}
		return amount;
	}
	
	
	public boolean crimeCommitted(Crime c) {
		Iterator<CrimeCommited> iterator = crimeList.values().iterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(c.getCrimeName().toLowerCase())) { return true; } }
		return false;
	}
	
	
	public boolean crimeCommitted(String crimeName) {
		crimeName = crimeName.toLowerCase();
		Iterator<CrimeCommited> iterator = crimeList.values().iterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(crimeName)) { return true; }	}
		return false;
	}
	
	
	private CrimeCommited getCrime(CrimeCommited c) {
		assert this.crimeCommitted(c):"ERROR: Crime not committed. Unable to return not committed crime.";
		Iterator<CrimeCommited> iterator = crimeList.values().iterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(c.getCrimeName().toLowerCase())) { return iterator.next(); }	}
		return null;
	}
	
	
	private Crime getCrime(String crimeName) {
		crimeName = crimeName.toLowerCase();
		assert this.crimeCommitted(crimeName):"ERROR: Crime not committed. Unable to return not committed crime.";
		Iterator<CrimeCommited> iterator = crimeList.values().iterator();
		while (iterator.hasNext()) { if (iterator.next().getCrimeName().equals(crimeName)) { return iterator.next(); } }
		return null;
	}
		
	
	public void add(CrimeCommited newCrimeData) {
		if(this.crimeList.containsKey(newCrimeData.getCrimeName())) {
			CrimeCommited oldCrimeData = crimeList.get(newCrimeData.getCrimeName());
			crimeList.put(newCrimeData.getCrimeName(),
					new CrimeCommited(newCrimeData.getCrimeName(), newCrimeData.getConvictionsAmount()+oldCrimeData.getConvictionsAmount()));
		} else { crimeList.put(newCrimeData.getCrimeName(), new CrimeCommited(newCrimeData.getCrimeName(), newCrimeData.getConvictionsAmount())); }
	}
	
	
	@Override
	public String toString() {
		if (crimeList.size()>0) {
			String str = "Criminal Record";
			for (int i=0; i<crimeList.size(); i++) { str += "\n\t"+crimeList.get(i).toString(); }
			return str;
		}
		return "";
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
