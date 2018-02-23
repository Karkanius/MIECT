package aula03;

public class Test1 {
	
	int nextNMec = 100;
	
	public static void main(String[] args)  {
		
		Estudante est = new Estudante ("Andreia", 9855678, new Data(18, 7, 1974));
		Bolseiro bls = new Bolseiro ("Maria", 8976543, new Data(11, 5, 1976));
		bls.setBolsa(745);
		System.out.println("Estudante: "+est.getNome());
		System.out.println(est);
		System.out.println();
		System.out.println("Bolseiro: "+bls.getNome()+", NMec: "+bls.getNMec()+", Bolsa:"+ bls.getBolsa());
		System.out.println(bls);
	
	}
}