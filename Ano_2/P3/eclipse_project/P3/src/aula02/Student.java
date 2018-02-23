package aula02;

public class Student extends User {
	
	private final int nMec;
	private final String course;
	
	Student (int id, String name, int cc, Date dNasc, int nMec, String course) {
		super(id, name, cc, dNasc);
		this.nMec = nMec;
		this.course = course;
	}
	
}
