package aula04.prob01;

public class Disciplina {
	
	private String nome;
	private String area;
	private int ects;
	private Professor prof;
	private Estudante[] alunos;
	private int numAlunos = 0;
	
	
	public Disciplina (String nome, String area, int ects, Professor prof) {
		this.nome = nome;
		this.area = area;
		this.ects = ects;
		this.prof = prof;
		this.alunos = new Estudante [10];
	}
	
	
	public boolean addAluno(Estudante est) {
		if (!alunoInscrito(est.getNMec())) {
			if (numAlunos<alunos.length) { alunos[numAlunos] = est; }
			else {
				Estudante [] auxArray = alunos.clone();
				alunos = new Estudante [alunos.length+10];
				for (int i=0; i<alunos.length-10; i++) {
					alunos[i] = auxArray[i];
				}
				alunos[alunos.length-10] = est;
			}
			numAlunos++;
			return true;
		}
		else { return false; }
	}
	
	
	public boolean delAluno(int nMec) {
		if (alunoInscrito(nMec)) {
			for (int i=0; i<numAlunos; i++) {
				if (alunos[i].getNMec() == nMec) {
					alunos[i] = alunos[numAlunos];
					alunos[numAlunos] = null;
					break;
				}
			}
			numAlunos--;
			return true;
		}
		else { return false; }
	}
	
	
	public boolean alunoInscrito(int nMec) {
		for (int i=0; i<numAlunos; i++) {
			if (alunos[i].getNMec() == nMec) {
				return true;
			}
		}
		return false;
	}
	
	
	public int numAlunos() {
		return numAlunos;
	}
	
	
	@Override
	public String toString() {
		return "|Disciplina|"+
				"\nNome: "+this.nome+
				"\nÁrea: "+this.area+
				"\nECTS: "+this.ects+
				"\nProfessor Responsável: "+this.prof;
	}
	
	
	public Estudante[] getAlunos() {
		return alunos;
	}
	
	
	public Estudante[] getAlunos(String tipo) {
		Estudante [] alunosTipo = new Estudante [alunos.length];
		int n=0;
		for (int i=0; i<this.alunos.length; i++) {
			if (this.alunos[i].getClass().getSimpleName()==tipo) {
				alunosTipo[n] = alunos[i];
				n++;
			}
		}
		return alunosTipo;
	}
}