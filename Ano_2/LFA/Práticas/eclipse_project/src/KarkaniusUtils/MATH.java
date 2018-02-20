package KarkaniusUtils;

public abstract class MATH {
	
	public static double randBetween(double min, double max) { return Math.random()*Math.abs(max-min)+min; }

	public static double log(int base, double x) { return Math.log(x)/Math.log(base); }
	
}
