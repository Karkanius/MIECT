package aula02;

public class Worker extends User {
	
	private final int nWorker;
	private final int nif;
	
	Worker (int id, String name, int cc, Date dNasc, int nWorker, int nif) {
		super(id, name, cc, dNasc);
		this.nWorker = nWorker;
		this.nif = nif;
	}
	
}
