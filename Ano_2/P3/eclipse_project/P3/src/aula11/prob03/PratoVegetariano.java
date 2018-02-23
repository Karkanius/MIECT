package aula11.prob03;

public class PratoVegetariano extends Prato implements Comparable<Prato>, Vegetariano {
	
	
	public PratoVegetariano (String nome) {
		super(nome);
	}
	
	
	public boolean addAlimento (Alimento alimento) {
		if(alimento instanceof Vegetariano) {
			composicao.add(alimento);
			return true;
		}
		else { return false; }
	}


	@Override
	public String toString() {
		return "Prato Vegetariano \"" + nome + "\" composto por " + composicao.size() + " ingredientes";
	}
}
