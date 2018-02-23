package aula01;
import java.util.*;

public class ex03 {
	
	static Scanner sc = new Scanner (System.in);
	
	public static void main(String[] args) {
		int op=0;
		do {
			System.out.println("Pretende criar um:");
			System.out.println("(1) C�rculo");
			System.out.println("(2) Quadrado");
			System.out.println("(3) Ret�ngulo");
			try {
				op = Integer.parseInt(sc.nextLine());
				switch(op) {
					case 1:
						createCirculo();
					break;
					case 2:
						createQuadrado();
					break;
					case 3:
						createRetangulo();
					break;
				}
			}
			catch (InputMismatchException a) {
				System.out.println("Insira um n�mero inteiro de 1 a 3.");
			}
		}
		while ((op!=1)&&(op!=2)&&(op!=3));

	}
	
	
//--------------------------------------------------------------------------------
//--------------------------FUN��ES----AUXILIARES---------------------------------
//--------------------------------------------------------------------------------
	
	public static void createCirculo() {
		
		System.out.println("Insira as coordenadas do centro do c�rculo e o seu raio");
		System.out.print("Centro (x): ");
		double x = Double.parseDouble(sc.nextLine());
		System.out.print("Centro (y): ");
		double y = Double.parseDouble(sc.nextLine());
		System.out.print("Raio: ");
		double r = Double.parseDouble(sc.nextLine());
		
		Circulo c = new Circulo (x, y, r);
		
		System.out.println("Per�metro do c�rculo: "+c.getPerimeter());
		System.out.println("�rea do c�rculo: "+c.getArea());
	}
	
	
	public static void createQuadrado() {
		Ponto [] pts = new Ponto [4];
		System.out.println("Insira as coordenadas dos pontos do quadrado.");
		for (int i=0; i<4; i++) {
			System.out.println("Ponto "+i);
			System.out.print("x: ");
			double x = Double.parseDouble(sc.nextLine());
			System.out.print("y: ");
			double y = Double.parseDouble(sc.nextLine());
			pts [i] = new Ponto (x, y);
		}
		Quadrado q = new Quadrado (pts[0], pts[1], pts[2], pts[3]);
		System.out.println("Per�metro do quadrado: "+q.getPerimeter());
		System.out.println("�rea do quadrado: "+q.getArea());
	}

	
	public static void createRetangulo() {
		
		Ponto [] pts = new Ponto [4];
		System.out.println("Insira as coordenadas dos pontos do ret�ngulo.");
		for (int i=0; i<4; i++) {
			System.out.println("Ponto "+i);
			System.out.print("x: ");
			double x = Double.parseDouble(sc.nextLine());
			System.out.print("y: ");
			double y = Double.parseDouble(sc.nextLine());
			pts [i] = new Ponto (x, y);
		}
		
		Retangulo r = new Retangulo (pts[0], pts[1], pts[2], pts[3]);
		System.out.println("Per�metro do ret�ngulo: "+r.getPerimeter());
		System.out.println("�rea do ret�ngulo: "+r.getArea());
	}
}
