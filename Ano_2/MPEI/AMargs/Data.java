package biblioteca;
import java.util.*;

public class Data {
	private int dia;
	private int mes; 
	private int ano;
	
	public Data (int dia, int mes, int ano){
		if (!dataValida(dia, mes, ano))
			throw new IllegalArgumentException("Date not valid!");
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
	}
	
	public int getDia() { return dia; }
	
	public int getMes() { return mes; }
	
	public int getAno() { return ano; }
	
	public boolean equals(Data d){
		if(dia!=d.getDia()) return false;
		if(mes!=d.getMes()) return false;
		if(ano!=d.getAno()) return false;
		return true;
	}
	
	public String toString() { return(getDia()+"-"+getMes()+"-"+getAno()); }
	
	public boolean dataValida (int dia, int mes, int ano){
		if(mes<1||mes>12) return false;
		if(dia<1||dia>31) return false;
		if((mes==4||mes==6||mes==9||mes==11)&&dia>30) return false;
		if(mes==2 && bissexto(ano)){
			if(bissexto(ano)){
				if(dia>29) return false;
			}
			else if(dia>28) return false;
		}
		return true;
	}
	
	public static boolean bissexto(int ano){
		if((ano % 400 == 0) || ((ano % 4 == 0) && (ano % 100 != 0))) return true;
		else return false;
	}
	
	public static Data today(){
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);
		return new Data(day,month,year);
		}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ano;
		result = prime * result + dia;
		result = prime * result + mes;
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
		Data other = (Data) obj;
		if (ano != other.ano)
			return false;
		if (dia != other.dia)
			return false;
		if (mes != other.mes)
			return false;
		return true;
	}
	
	
}
