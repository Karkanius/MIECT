package Project;

import java.util.LinkedList;

public class Person {
	
	//ATTRIBUTES
	//Basic
	private String name = null;
	private Boolean sex = null;		//1 - Male; 0 - Female;
	private Integer age = null;
	
	//Hair
	private String hairSize = null;
	private String hairColor = null;
	
	//Eyes
	private String eyesColor = null;
	
	//Physical Appearance
	private Double height = null;
	private String corpulence = null;
	
	//Criminal Record
	private CriminalRecord record = null;
	
	
	//CONSTRUCTORES
	//No-Attributes constructor
	public Person() { }
	
	
	//All-Attributes constructor
	public Person(String name, boolean sex, int age, String hairSize, String hairColor, String eyesColor, double height, String corpulence, CriminalRecord record) {
		this.name = name;
		this.sex = sex;
		this.age = 5*(Math.round(age/5));
		this.hairSize = hairSize;
		this.hairColor = hairColor;
		this.eyesColor = eyesColor;
		this.height = 0.05*(Math.round(height/0.05));
		this.corpulence = corpulence;
		this.record = record;
	}

	
	//METHODS
	//Getters
	public String getName() { return name; }
	public Boolean getSex() { return sex; }
	public Integer getAge() { return age; }
	public String getHairSize() { return hairSize; }
	public String getHairColor() { return hairColor; }
	public String getEyesColor() { return eyesColor; }
	public Double getHeight() { return height; }
	public String getCorpulence() { return corpulence; }
	public CriminalRecord getRecord() { return record; }
	
	
	//Setters
	public void setName(String name) { this.name = name; }
	public void setSex(boolean sex) { this.sex = sex; }
	public void setAge(int age) { this.age = 5*(Math.round(age/5)); }
	public void setHairSize(String hairSize) { this.hairSize = hairSize.toLowerCase(); }
	public void setHairColor(String hairColor) { this.hairColor = hairColor.toLowerCase(); }
	public void setEyesColor(String eyeColor) { this.eyesColor = eyeColor.toLowerCase(); }
	public void setHeight(double height) { this.height = 0.05*(Math.round(height/0.05)); }
	public void setCorpulence(String corpulence) { this.corpulence = corpulence.toLowerCase(); }
	public void setRecord(CriminalRecord record) { this.record = record; }
	
	
	public boolean commited(String crimeName) { return this.record.crimeCommitted(crimeName); }
	public boolean commited(Crime crime) { return this.record.crimeCommitted(crime); }
	
	
	@Override
	public String toString() {
		String str = "";
		//Name
		if (name!=null) { str += "["+name.toUpperCase()+"]\n"; }
		//Sex
		if (sex!=null) {
			if (sex) { str += "Male"; }
			else { str += "Female"; }
		}
		else { str += "Undefined sex subject"; }
		//Age
		if (age!=null) {
			if (str != "") { str += ", "; }
			str += this.age+" years old";
		}
		//Hair
		if (hairSize!=null || hairColor!=null) {
			if (str != "") { str += ", "; }
			if (hairSize!=null) {
				str += hairSize;
				if (hairColor!=null) { str += ", "; }
			}
			if (hairColor!=null) { str += hairColor; }
			str += " hair";
		}
		//Eyes
		if (eyesColor!=null) {
			if (str != "") { str += ", "; }
			str += eyesColor+" eyes";
		}
		//Height
		if (height!=null) {
			if (str != "") { str += ", "; }
			str += height+"m";
		}
		//Corpulence
		if (corpulence!=null) {
			if (str != "") { str += ", "; }
			str += corpulence;
		}
		str += ".";
		//Criminal Record
		try{ str += "\n"+record.toString(); } catch (NullPointerException e) { str += "\n"; }
		return str;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result + ((corpulence == null) ? 0 : corpulence.hashCode());
		result = prime * result + ((eyesColor == null) ? 0 : eyesColor.hashCode());
		result = prime * result + ((hairColor == null) ? 0 : hairColor.hashCode());
		result = prime * result + ((hairSize == null) ? 0 : hairSize.hashCode());
		result = prime * result + ((height == null) ? 0 : height.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((record == null) ? 0 : record.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
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
		Person other = (Person) obj;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (corpulence == null) {
			if (other.corpulence != null)
				return false;
		} else if (!corpulence.equals(other.corpulence))
			return false;
		if (eyesColor == null) {
			if (other.eyesColor != null)
				return false;
		} else if (!eyesColor.equals(other.eyesColor))
			return false;
		if (hairColor == null) {
			if (other.hairColor != null)
				return false;
		} else if (!hairColor.equals(other.hairColor))
			return false;
		if (hairSize == null) {
			if (other.hairSize != null)
				return false;
		} else if (!hairSize.equals(other.hairSize))
			return false;
		if (height == null) {
			if (other.height != null)
				return false;
		} else if (!height.equals(other.height))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (record == null) {
			if (other.record != null)
				return false;
		} else if (!record.equals(other.record))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		return true;
	}


	public LinkedList<Integer> getHashes() {
		LinkedList<Integer> hashes = getHashesWOName();
		if (this.name!=null)		hashes.addFirst(name.hashCode());
		else						hashes.addFirst(0);
		return hashes;
	}
	
	
	public LinkedList<Integer> getHashesWOName() {
		LinkedList<Integer> hashes = new LinkedList<Integer>();
		if (this.sex!=null)			hashes.add(sex.hashCode());
		else						hashes.add(0);
		if (this.age!=null)			hashes.add(age.hashCode());
		else						hashes.add(0);
		if (this.hairSize!=null)	hashes.add(hairSize.hashCode());
		else						hashes.add(0);
		if (this.hairColor!=null)	hashes.add(hairColor.hashCode());
		else						hashes.add(0);
		if (this.eyesColor!=null)	hashes.add(eyesColor.hashCode());
		else						hashes.add(0);
		if (this.height!=null)		hashes.add(height.hashCode());
		else						hashes.add(0);
		if (this.corpulence!=null)	hashes.add(corpulence.hashCode());
		else						hashes.add(0);
		if (this.record!=null)		hashes.add(record.hashCode());
		else						hashes.add(0);
		return hashes;
	}

}
