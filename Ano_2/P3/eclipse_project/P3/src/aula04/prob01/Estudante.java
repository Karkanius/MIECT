package aula04.prob01;
import java.time.LocalDateTime;

public class Estudante extends Pessoa {
	
	private int nMec;
	private Data dataInsc;
	static int nextNMec = 100;

	
	public Estudante (String nome, int cc, Data dataNasc) {
		super (nome, cc, dataNasc);
		this.nMec = nextNMec;
		this.dataInsc = new Data (LocalDateTime.now().getDayOfMonth(), LocalDateTime.now().getMonthValue(), LocalDateTime.now().getYear());
		nextNMec++;
	}
	
	
	public Estudante (String nome, int cc, Data dataNasc, Data dataInsc) {
		super (nome, cc, dataNasc);
		this.nMec = nextNMec;
		this.dataInsc = dataInsc;
		nextNMec++;
	}
	
	
	public int getNMec () {return this.nMec; }
	public Data getDataInsc () {return this.dataInsc; }
	
	
	@Override
	public String toString() {
		return "|Aluno|"+
				"\nNome: "+super.getNome()+
				"\nNúmero de CC: "+super.getCC()+
				"\nData de Nascimento: "+super.getDataNasc().toString()+
				"\nNúmero Mecanográfico: "+this.nMec+
				"\nData de Inscrição: "+this.dataInsc.toString();
	}
}
