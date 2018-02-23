package aula03;

public class User {
	
	private final int id;
	private final String name;
	private final int cc;
	private final Date birthDate;
	private int age;
	
	User (int id, String name, int cc, Date birthDate) {
		this.id = id;
		this.name = name;
		this.cc = cc;
		this.birthDate = birthDate;
		this.age = calcAge();
	}
	
	private int calcAge () {
		int years = 0;
		
		return years;
	}
}
