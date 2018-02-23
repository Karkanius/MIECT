//
//Paulo Vasconcelos, MIECT, 84987
//Universidade de Aveiro, novembro 2017
//


package aula09.prob03;

import java.time.LocalDateTime;

public class Date {
	
	private final int day;
	private final int month;
	private final int year;
	
	public Date (int d, int m, int y) {			
		this.day = d;
		this.month = m;
		this.year = y;
	}
	
	
	public int getDay () { return this.day;}
	public int getMonth () { return this.month;}
	public int getYear () { return this.year;}
	
	
	public boolean dataValida () {
		
		// Ano bissexto
		boolean bis = false;
		if ((this.year%400==0) || (this.year%100!=0 && this.year%4==0)) {
			bis = true;
		}
		
		// Dias não positivos & Meses fora do seu domínio
		if (this.day<=0||this.month<=0||this.month>12) {return false;}
		
		// Dias fora do seu domínio
		int [] months31 = {1, 3, 5, 7, 8, 10, 12};
		int [] months30 = {4, 6, 9, 11};
		
		int diasMes=0;
		
		for (int i=0; i<months31.length; i++) {
			if (months31[i] == this.month) {
				diasMes=31;
				break;
			}
		}
		
		if (diasMes==0) {
			for (int i=0; i<months30.length; i++) {
				if (months30[i] == this.month) {
					diasMes=30;
					break;
				}
			}
		}
		
		if (diasMes==0) {
			if (bis) {diasMes=29;}
			else {diasMes=28;}
		}
		
		if (this.day>diasMes) {return false;}
		
		return true;
	}
	
	
	public int difYears (Date anotherYear) {
		Date firstDate, secondDate;
		int y;
		if (this.laterThan(anotherYear)) {
			firstDate = anotherYear;
			secondDate = this;
		}
		else {
			firstDate = this;
			secondDate = anotherYear;
		}
		y = secondDate.getYear()-firstDate.getYear();
		if (secondDate.getMonth()<firstDate.getMonth()) { y--; }
		return y;
	}
	
	
	private boolean laterThan (Date outraData) {
		if (this.year > outraData.getYear()) { return true; }
		else if (this.year < outraData.getYear()) { return false; }
		else {
			if (this.month > outraData.getMonth()) { return true; }
			else if (this.month < outraData.getMonth()) { return false; }
			else {
				if (this.day > outraData.getDay()) { return true; }
				else { return false; }
			}
		}
	}
	
	
	public static Date today() {
		int y = LocalDateTime.now().getYear();
		int m = LocalDateTime.now().getMonthValue();
		int d = LocalDateTime.now().getDayOfMonth();
		return(new Date(d,m,y));
	}
	
	
	@Override
	public String toString () { return this.day+"/"+this.month+"/"+this.year; }
}