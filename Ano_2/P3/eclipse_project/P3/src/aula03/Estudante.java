package aula03;
import java.time.LocalDateTime;

public class Estudante extends Pessoa {
	
	private int NMec;
	private Data dataInsc;
	static int nextNMec = 100;

	
	public Estudante (String nome, int cc, Data dataNasc) {
		super (nome, cc, dataNasc);
		this.NMec = nextNMec;
		this.dataInsc = new Data (LocalDateTime.now().getDayOfMonth(), LocalDateTime.now().getMonthValue(), LocalDateTime.now().getYear());
		nextNMec++;
	}
	
	
	public Estudante (String nome, int cc, Data dataNasc, Data dataInsc) {
		super (nome, cc, dataNasc);
		this.NMec = nextNMec;
		this.dataInsc = dataInsc;
		nextNMec++;
	}
	
	
	public int getNMec () {return this.NMec; }
	public Data getDataInsc () {return this.dataInsc; }
	
	
	@Override public String toString () {
		return (super.getNome()+
				", CC: "+super.getCC()+
				", Data de Nascimento: "+super.getDataNasc().toString()+
				", NMec: "+this.NMec+
				", inscrito em: "+this.dataInsc.toString());
	}
}
