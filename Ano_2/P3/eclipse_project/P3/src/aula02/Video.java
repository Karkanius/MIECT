package aula02;
import java.util.LinkedList;

public class Video {
	
	private final int id;
	private final String title;
	private final String category;
	private final AgeRate rate;
	private int amount = 0;
	private int totalRating = 0;
	private double averageRating = 0;
	private int nEvaluations=0;
	private LinkedList<User> history = new LinkedList<User> ();
	
	Video (int id, String title, String category, AgeRate rate) {
		this.id = id;
		this.title = title;
		this.category = category;
		this.rate = rate;
		this.amount = 1;
		this.totalRating = 0;
		this.averageRating = 0;
		this.nEvaluations = 0;
	}
	
	
	Video (int id, String title, String category, AgeRate rate, int amount) {
		this.id = id;
		this.title = title;
		this.category = category;
		this.rate = rate;
		this.amount = amount;
		this.totalRating = 0;
		this.averageRating = 0;
		this.nEvaluations = 0;
	}
	
	
	public boolean inStock () { return this.amount != 0; }
	
	public void checkOut () {
		if (this.inStock()) {
			this.amount--;
			System.out.println("Video "+this.title+" checked out.");
		}
		else {
			System.out.println("No copy of "+this.title+" in stock.");
		}
	}
	
	public void checkIn () {
		this.amount++;
		System.out.println("Video "+this.title+" checked in.");
	}
	
	public void rate (int rate) {
		this.totalRating += rate;
		this.nEvaluations++;
		this.averageRating = this.totalRating/this.nEvaluations;
		System.out.println("Video rating updated.");
	}
	
	
	public String getTitle () { return this.title; }
	public int getTotalRating () { return this.totalRating; }
	public double getAverageRating () { return this.averageRating; }
}
