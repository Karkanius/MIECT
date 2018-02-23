package aula03;

public class Circulo extends Figura{
	
	private double raio;
	
	
	public Circulo (Ponto centro, double r) {
		super (centro);
		this.raio = r;
	}
	
	
	public Circulo (double x, double y, double r) {
		super (x, y);
		this.raio = r;
	}
	
	
	public Circulo (double r) {
		super (0, 0);
		this.raio = r;
	}
	
	
	public Circulo (Circulo outroCirc) {
		super(outroCirc.centro);
		this.raio = outroCirc.getRaio();
	}
	
	
	
	public Ponto getCentro() { return centro;}
	public double getRaio() { return raio;}
	
	public double getPerimetro() { return 2*Math.PI*this.raio;}
	public double getArea() { return Math.PI*Math.pow(this.raio, 2);}
	
	public String toString() {return ("C�rculo de raio "+raio+" e centro no ponto "+centro.toString()+".");}	
	
	public boolean equals(Circulo outroCirc) { return ((this.centro == outroCirc.getCentro()) && (this.raio == outroCirc.getRaio())); }
	
	
	public boolean intersects(Circulo outroCirc) {
		double raioMax = 0;
		double raioMin = 0;
		double raioSoma = this.raio + outroCirc.getRaio();
		double distancia = this.centro.distanceTo(outroCirc.getCentro());
		
		if (this.raio>outroCirc.getRaio()) {
			raioMax = this.raio;
			raioMin = outroCirc.getRaio();
		}
		else {
			raioMax = outroCirc.getRaio();
			raioMin = this.raio;
		}
		
		return ((distancia<raioSoma)&&(raioMax<distancia+raioMin));
	}
}
