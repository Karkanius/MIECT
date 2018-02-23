package aula01;

public class Quadrado {
	private Ponto [] pts = new Ponto [4];
	
	Quadrado (Ponto p1, Ponto p2, Ponto p3, Ponto p4) {
		pts[0] = p1;
		pts[1] = p2;
		pts[2] = p3;
		pts[3] = p4;
	}
	
	private double calcSide() {
		double d1 = pts[0].distanceTo(pts[1]);
		double d2 = pts[0].distanceTo(pts[2]);
		double d3 = pts[0].distanceTo(pts[3]);
		double side = 0;
		if (d1 == d2) {side = d1;}
		else {
			if (d1 == d3) {side = d1;}
			else if (d2 == d3) {side = d2;}
			}
		return side;
	}
	
	public double getPerimeter() { return 4*calcSide();}
	public double getArea() { return Math.pow(calcSide(), 2);}
	
	public String toString() {return ("Quadrado de lado "+calcSide()+" e pontos "+pts[0].toString()+", "+pts[1].toString()+", "+pts[2].toString()+", "+pts[3].toString()+".");}
}
