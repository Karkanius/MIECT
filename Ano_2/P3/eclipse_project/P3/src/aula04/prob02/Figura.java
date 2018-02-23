package aula04.prob02;

public abstract class Figura implements HasArea {
	
	public Ponto centro;
	
	public Figura (Ponto p) {
		this.centro = p;
	}
	
	public Figura (double x, double y) {
		this.centro = new Ponto(x,y);
	}
}
