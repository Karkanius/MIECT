package aula03;

public class Quadrado extends Figura {
	
	private double lado = 0;
	
	public Quadrado (Ponto p, double l) {
		super(p);
		this.lado = l;
	}
	
	
	public Quadrado (double x, double y, double l) {
		super(x, y);
		this.lado = l;
	}
	
	
	public Quadrado (double l) {
		super(0, 0);
		this.lado = l;
	}
	
	
	public Quadrado (Quadrado outroQuad) {
		super(outroQuad.centro);
		this.lado = outroQuad.getLado();
	}
	
	
	
	
	public double getPerimetro() { return 4*this.lado;}
	public double getArea() { return Math.pow(this.lado, 2);}
	public double getLado() { return this.lado;}
	
	public boolean equals(Quadrado outroQuad) { return ((this.centro.equals(outroQuad.centro))&&(this.lado==outroQuad.getLado())); }
	
	public String toString() {return ("Quadrado de lado "+this.lado+" e centrado no ponto "+centro.toString()+"."); }
}
