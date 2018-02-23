package aula03;

public class Retangulo extends Figura{
	
	private double comprimento, largura;
	
	public Retangulo (Ponto p, double c, double l) {
		super(p);
		this.comprimento = c;
		this.largura = l;
	}
	
	
	public Retangulo (double x, double y, double c, double l) {
		super(x, y);
		this.comprimento = c;
		this.largura = l;
	}
	
	
	public Retangulo (double c, double l) {
		super(0, 0);
		this.comprimento = c;
		this.largura = l;
	}
	
	
	public Retangulo (Retangulo outroRet) {
		super(outroRet.centro);
		this.comprimento = outroRet.getComp();
		this.largura = outroRet.getLarg();
	}
	
	
	
	
	public double getPerimetro() { return 2*this.comprimento + 2*this.largura; }
	public double getArea() { return this.comprimento * this.largura; }
	public double getComp() { return this.comprimento; }
	public double getLarg() { return this.largura; }
	
	public boolean equals(Retangulo outroRet) { return ((this.centro.equals(outroRet.centro))&&(this.comprimento==outroRet.getComp())&&(this.largura==outroRet.getLarg())); }
	
	public String toString() {return ("Retângulo de comprimento "+this.comprimento+", largura "+this.largura+" e centrado no ponto "+this.centro.toString()+"."); }

}