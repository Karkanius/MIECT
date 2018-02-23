package aula04.prob02;
import java.util.LinkedList;

public class ColecaoFiguras {

	private LinkedList<Figura> figuras = new LinkedList<Figura> ();
	private double areaTotal = 0;
	private double maxArea = Double.MAX_VALUE;
	
	
	
	public ColecaoFiguras(Figura [] fig) {
		for (int i=0; i<fig.length; i++) {
			figuras.add(fig[i]);
		}
		for (int i=0; i<fig.length; i++) {
			this.areaTotal += fig[i].getArea();
		}
	}
	
	public ColecaoFiguras(double area) {
		this.maxArea = area;
	}
	
	
	
	public Figura [] getFiguras() {
		Figura [] fig = new Figura [figuras.size()];
		for (int i=0; i<figuras.size(); i++) {
			fig[i] = figuras.get(i);
		}
		return fig;
	}
	
	public double areaTotal() { return areaTotal; }
	
	public Ponto [] getCentros() {
		Ponto [] centros = new Ponto [figuras.size()];
		for (int i=0; i<figuras.size(); i++) {
			centros[i] = figuras.get(i).centro;
		}
		return centros;
	}
	
	public boolean addFigura(Figura f) {
		if ((f.getArea()+this.areaTotal <= this.maxArea) && (!figuras.contains(f))) {
			figuras.add(f);
			areaTotal+=f.getArea();
			return true;
		}
		else { return false; }
	}
	
	public boolean delFigura(Figura f) {
		if (figuras.contains(f)) {
			figuras.remove(f);
			areaTotal-=f.getArea();
			return true;
		}
		else { return false; }
	}
	
	public boolean exists(Figura f) { return figuras.contains(f); }
	
	@Override
	public String toString () {
		return "Coleção de Figuras";
	}
}
