package aula09.prob01;

import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Scanner;

public class ScannerAbeirense implements Iterator<String>, Closeable {

	Scanner sc;

	public ScannerAbeirense() {
		sc = new Scanner(System.in);
	}
	
	public ScannerAbeirense(InputStream i){
		sc = new Scanner(i);
	}
	
	public ScannerAbeirense(File f) throws FileNotFoundException{
		sc = new Scanner(f);
	}
	
	public void close() throws IOException {
		sc.close();
	}

	public boolean hasNext() {
		return sc.hasNext();
	}

	public boolean hasNextLine() {
		return sc.hasNextLine();
	}
	
	public String next() {
		String str = sc.next();
		str = str.replace("v", "b");
		str = str.replace("V", "B");
		return str;
	}
	
	public String nextLine(){
		String line = sc.nextLine();
		line = line.replace("v", "b");
		line = line.replace("V", "B");
		return line;
	}
	
	
}