package aula05.prob02;

public class Matricula {

	private char [] matricula = new char [6];
	
	public Matricula (char[] arr) {
		String str = matricula[0]+matricula[1]+matricula[2]+matricula[3]+matricula[4]+matricula[5]+"";
		str.toUpperCase();
		for (int i=0; i<6; i++) {
			matricula[i] = str.charAt(i);
		}
	}
	
	public Matricula (String str) {
		str.toUpperCase();
		for (int i=0; i<6; i++) {
			matricula[i] = str.charAt(i);
		}
	}
	
	@Override
	public String toString () { return matricula[0]+matricula[1]+"-"+matricula[2]+matricula[3]+"-"+matricula[4]+matricula[5]; }
}
