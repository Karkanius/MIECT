package aula11.prob03;

public class PratoDieta extends Prato implements Comparable<Prato> {

	private double maxCalorias;

	
	public PratoDieta (String nome, double maxCalorias) {
		super(nome);
		this.maxCalorias = maxCalorias;
	}
	
	
	public boolean addAlimento (Alimento alimento) {
		if(alimento.calorias+super.calorias<=maxCalorias) {
			super.calorias+=alimento.calorias;
			composicao.add(alimento);
			return true;
		}
		else {
			System.out.println("ERROR: Não é possível adicionar "+alimento.toString()+" ao prato. Máximo de calorias ultrapassado.");
			return false;
		}
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		long temp;
		temp = Double.doubleToLongBits(maxCalorias);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		PratoDieta other = (PratoDieta) obj;
		if (Double.doubleToLongBits(maxCalorias) != Double.doubleToLongBits(other.maxCalorias))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "Prato Dieta (" + super.calorias + ") \"" + nome + "\" composto por " + composicao.size() + " ingredientes";
	}
	
}
