package aula01;

public class Data {
	
	private final int dia;
	private final int mes;
	private final int ano;
	
	Data (int d, int m, int a) {			
		this.dia = d;
		this.mes = m;
		this.ano = a;
	}
	
	public int getDia () { return this.dia;}
	public int getMes () { return this.mes;}
	public int getAno () { return this.ano;}
	
	public boolean dataValida () {
		
		// Ano bissexto
		boolean bis = false;
		if ((this.ano%400==0) || (this.ano%100!=0 && this.ano%4==0)) {
			bis = true;
		}
		
		// Dias não positivos & Meses fora do seu domínio
		if (this.dia<=0||this.mes<=0||this.mes>12) {return false;}
		
		// Dias fora do seu domínio
		int [] months31 = {1, 3, 5, 7, 8, 10, 12};
		int [] months30 = {4, 6, 9, 11};
		
		int diasMes=0;
		
		for (int i=0; i<months31.length; i++) {
			if (months31[i] == this.mes) {
				diasMes=31;
				break;
			}
		}
		
		if (diasMes==0) {
			for (int i=0; i<months30.length; i++) {
				if (months30[i] == this.mes) {
					diasMes=30;
					break;
				}
			}
		}
		
		if (diasMes==0) {
			if (bis) {diasMes=29;}
			else {diasMes=28;}
		}
		
		if (this.dia>diasMes) {return false;}
		
		return true;
	}
}