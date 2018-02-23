package aula01;

public class Circulo {
	
	private double radius;
	private Ponto center;
	
	
	public Circulo(double x, double y, double r) {
		radius = r;
		center = new Ponto (x, y);
	}
	
	public Circulo(Ponto centro, double r) {
		radius = r;
		center = centro;
	}
	
	
	public Ponto getCenter() { return center;}
	public double getRadius() { return radius;}
	
	public double getPerimeter() { return 2*Math.PI*this.radius;}
	public double getArea() { return Math.PI*Math.pow(this.radius, 2);}
	
	public String toString() {return ("Círculo de raio "+radius+" e centro no ponto "+center.toString()+".");}
	
	public boolean equalTo(Circulo otherC) {
		if ((this.center == otherC.getCenter()) && (this.radius == otherC.getRadius())) {return true;}
		else {return false;}
	}
	
	public boolean intersects(Circulo otherC) {
		double maxRadius = 0;
		double minRadius = 0;
		double radiusSum = this.radius + otherC.getRadius();
		double distance = this.center.distanceTo(otherC.getCenter());
		
		if (this.radius>otherC.getRadius()) {
			maxRadius = this.radius;
			minRadius = otherC.getRadius();
		}
		else {
			maxRadius = otherC.getRadius();
			minRadius = this.radius;
		}
		
		if ((distance<radiusSum)&&(maxRadius<distance+minRadius)) {return true;}
		else {return false;}
	}
}
