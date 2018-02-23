package aula01;

public class Ponto {
	
	private double x;
	private double y;
	
	Ponto (double x, double y) {
		this.x = x;
		this.y = y;
	}
	
	public Ponto getPonto() {return this;}
	public double getX() {return this.x;}
	public double getY() {return this.y;}
	
	public double distanceTo(Ponto otherP) {
		double d=Math.sqrt(Math.pow((this.x-otherP.getX()),2) + Math.pow((this.y-otherP.getY()),2));
		return d;
	}
	
	public String toString() {
		return("("+x+", "+y+")");
	}
}
