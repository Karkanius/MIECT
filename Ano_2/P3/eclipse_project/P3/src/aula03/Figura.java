package aula03;

public abstract class Figura {
	
	public Ponto centro;
	
	Figura (Ponto p) {
		this.centro = p;
	}
	
	Figura (double x, double y) {
		this.centro = new Ponto(x,y);
	}
}
