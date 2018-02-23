package Project;

public class Crime {
	
	//ATTRIBUTES
	
	private String name;
	
	
	//CONSTRUCTORES
	
	public Crime(String name) {
		this.name = name.toLowerCase();
	}
	
	
	//METHODS
	
	public String getCrimeName() { return this.name; }
	
	@Override
	public String toString() { return name.substring(0, 1).toUpperCase()+name.substring(1); }
}
