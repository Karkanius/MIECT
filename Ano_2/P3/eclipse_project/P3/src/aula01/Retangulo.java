package aula01;

public class Retangulo {
	private Ponto [] pts = new Ponto [4];
	private double sideBig, sideSmall;
	
	Retangulo (Ponto p1, Ponto p2, Ponto p3, Ponto p4) {
		pts[0] = p1;
		pts[1] = p2;
		pts[2] = p3;
		pts[3] = p4;
		
		double d1 = pts[0].distanceTo(pts[1]);
		double d2 = pts[0].distanceTo(pts[2]);
		double d3 = pts[0].distanceTo(pts[3]);
		
		if ((d1>d2)&&(d1>d3)) {
			if (d2>d3) {
				sideBig = d2;
				sideSmall = d3;
			}
			else {
				sideBig = d3;
				sideSmall = d2;
			}
		}
		else if ((d2>d1)&&(d2>d3)) {
			if (d1>d3) {
				sideBig = d1;
				sideSmall = d3;
			}
			else {
				sideBig = d3;
				sideSmall = d1;
			}
		}
		else {
			if (d1>d2) {
				sideBig = d1;
				sideSmall = d2;
			}
			else {
				sideBig = d2;
				sideSmall = d1;
			}
		}
	}
	
	
	public double getPerimeter() { return 2*(sideBig+sideSmall);}
	public double getArea() { return sideBig*sideSmall;}
	
	public String toString() {return ("Retângulo definido pelos pontos "+pts[0].toString()+", "+pts[1].toString()+", "+pts[2].toString()+", "+pts[3].toString()+".");}
}