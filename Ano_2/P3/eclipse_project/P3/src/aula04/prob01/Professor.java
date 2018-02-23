package aula04.prob01;
import java.time.LocalDateTime;

public class Professor extends Pessoa {

	private int nFunc;
	private static int nextNFunc = 1;
	private Data dataAd;
		
	
	public Professor(String nome, int cc, Data data, Data dataAd) {
		super(nome, cc, data);
		this.nFunc = nextNFunc;
		this.dataAd = dataAd;
		nextNFunc++;
	}
	
	
	public Professor(String nome, int cc, Data data) {
		super(nome, cc, data);
		this.nFunc = nextNFunc;
		this.dataAd = new Data (LocalDateTime.now().getDayOfMonth(), LocalDateTime.now().getMonthValue(), LocalDateTime.now().getYear());
		nextNFunc++;
	}


	public int getNFunc() { return nFunc; }
	public Data getDataAd() { return dataAd; }

	@Override
	public String toString() {
		return "|Professor|"+
				"\nNome: "+super.getNome()+
				"\nNúmero de CC: "+super.getCC()+
				"\nData de Nascimento: "+super.getDataNasc().toString()+
				"\nNúmero de Funcionário: "+this.nFunc+
				"\nData de Admissão: "+this.dataAd.toString();
	}
}