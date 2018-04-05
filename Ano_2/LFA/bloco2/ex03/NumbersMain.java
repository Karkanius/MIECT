import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.lang.*;
import java.util.*;

public class NumbersMain {
  public static void main(String[] args) throws Exception {

    InputStream in_stream = null;
    try {
      in_stream = new FileInputStream(new File("numbers.txt"));
    } catch(FileNotFoundException e) {
      System.err.println("ERROR: File \"numbers.txt\" Not Found.")
      System.exit(1);
    }

    // create a CharStream that reads from standard input:
    ANTLRInputStream input = new ANTLRInputStream(in_stream);
    // create a lexer that feeds off of input CharStream:
    NumbersLexer lexer = new NumbersLexer(input);
    // create a buffer of tokens pulled from the lexer:
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    // create a parser that feeds off the tokens buffer:
    NumbersParser parser = new NumbersParser(tokens);
    // replace error listener:
    //parser.removeErrorListeners(); // remove ConsoleErrorListener
    //parser.addErrorListener(new ErrorHandlingListener());
    // begin parsing at file rule:
    ParseTree tree = parser.file();
    if (parser.getNumberOfSyntaxErrors() == 0) {
      ParseTreeWalker walker = new ParseTreeWalker();
      ConstructNumberMappings mappings = new ContructNumberMappings();
      walker.walk(mappings,tree);
      Scanner in = new Scanner(System.in);
      while(in.hasNextLine()) {
        String line = in.nextLine();
        String[] words = line.replace('-',' ').toLowerCase().split(" ");
        for(int i=0; i<words.length; i++) {
          if(i!=0)  System.out.println(" ");
          if mappings.exists(words[i])) System.out.print(mappings.value(words[i]).toString());
          else                          System.out.print(words[i]);
        }
        System.out.println();
      }
    }
  }
}
