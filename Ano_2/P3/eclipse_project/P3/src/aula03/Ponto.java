package aula03;

public class Ponto {
	
	private double x;
	private double y;
	
	Ponto (double x, double y) {
		this.x = x;
		this.y = y;
	}
	
	public double getX() {return this.x;}
	public double getY() {return this.y;}
	
	public double distanceTo(Ponto otherP) { return Math.sqrt(Math.pow((this.x-otherP.getX()),2) + Math.pow((this.y-otherP.getY()),2)); }
	
	public String toString() {
		return("("+this.x+", "+this.y+")");
	}
}
