import static java.lang.System.*;
import java.io.*;
import java.util.Scanner;
// import java.util.*;   // => "error: reference to LinkedList is ambiguous"
// java.util.LinkedList colide com p2utils.LinkedList!
import p2utils.*;

public class P71
{
  public static void main(String[] args) throws IOException
  {
    if (args.length != 1) {
      err.printf("Usage: java -ea P71 text-file\n");
      exit(1);
    }
    File fil = new File(args[0]);

	LinkedList <String> l1 = new LinkedList();
	LinkedList <String> l2 = new LinkedList();
	LinkedList <String> l3 = new LinkedList();

    Scanner sf = new Scanner(fil);
    // exceções poderiam ser intercetadas e mostrar mensagem de erro.
    while (sf.hasNextLine()) {
		String line = sf.nextLine();
      
		if (line.length() < 20)
			l1.addLast(line);
		else if (line.length() <= 40)
			l2.addLast(line);
		else
			l3.addLast(line);

    }
    sf.close();

    // Escrever conteúdo das listas...
    out.println("Curtas---|---------|---------|---------|---------");
    l1.print();

    out.println("Médias---|---------|---------|---------|---------");
    l2.print();

    out.println("Longas---|---------|---------|---------|---------");
    l3.print();
  }

}
