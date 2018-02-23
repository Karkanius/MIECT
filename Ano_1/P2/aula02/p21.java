/*************************************************************************
 * Compilation: javac j21.java 
 * Execution: java j21
 *************************************************************************/
import static java.lang.System.*;

public class p21
{
  // Exemplo simples de utilização da class Complex
  public static void main(String[] args)
  {
    Complexo a = new Complexo(5.0, 6.0);

    // Vamos usar métodos de 'a'
    out.println("(" + a.real() + " + " + a.imag() + "i)");
    out.println("  parte real = " + a.real());
    out.println("  parte imaginaria = " + a.imag());
    out.println("  modulo = " + a.abs());
    out.printf("  fase   =  %2.2f\n", a.phase());
  }

}
