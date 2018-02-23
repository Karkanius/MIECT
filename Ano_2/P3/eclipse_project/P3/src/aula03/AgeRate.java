package aula03;

import java.util.InputMismatchException;

public class AgeRate {
	
	private String name;
	private int minAge;
	
	public AgeRate () {
		this.name = "";
		this.minAge = -1;
	}
	
	public AgeRate (int age) {	
		try {
			switch(age) {
				case 0:
					this.name = "ALL";
				break;
				case 6:
					this.name = "M6";
				break;
				case 12:
					this.name = "M12";
				break;
				case 16:
					this.name = "M16";
				break;
				case 18:
					this.name = "M18";
				break;
				default:
					System.out.println("Insira uma idade válida {0, 6, 12, 16, 18.}.");
				break;
			}
		}
		catch (InputMismatchException a) {
		System.out.println("Insira um número inteiro.");
		}
		this.minAge = age;
	}
	

	public String getName () { return this.name; }
	public int getMinAge () { return this.minAge; }
}
