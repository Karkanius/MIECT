package pt.ua.packages;

public class Data {
	private int dia;
	private int mes;
	private int ano;

	
	public Data (int d, int m, int a) {
		dia = d;
		mes = m;
		ano = a;
	}
	
	
	public boolean igualA (Data comp) {
		if ((comp.dia == this.dia) && (comp.mes == this.mes) && (comp.ano == this.ano))
			return true;
		else
			return false;
	}
	
	
	public boolean menorDoQue (Data comp) {
		if (comp.ano == this.ano)						//mesmo ano
		{
			if (comp.mes == this.mes)					//mesmo mês
			{
				if (comp.dia <= this.dia)				//d2 igual a d1 ou maior
					return true;
				else
					return false;
			}
			else if (comp.mes > this.mes)
				return true;
			else
				return false;
		}
		else if (comp.ano > this.ano)
			return true;
		else
			return false;
	}
	
	
	public boolean maiorDoQue (Data comp) {
		if (comp.ano == this.ano)						//mesmo ano
		{
			if (comp.mes == this.mes)					//mesmo mês
			{
				if (comp.dia >= this.dia)				//d2 igual a d1 ou menor
					return true;
				else
					return false;
			}
			else if (comp.mes < this.mes)
				return true;
			else
				return false;
		}
		else if (comp.ano < this.ano)
			return true;
		else
			return false;
	}
	
	
	public int dia () {
		return this.dia;
	}
	
	
	public int mes () {
		return this.mes;
	}
	
	
	public int ano () {
		return this.ano;
	}
	
	
	public void escreve () {
		System.out.printf ("%02d/%02d/%04d", this.dia, this.mes, this.ano);
	}
}	
