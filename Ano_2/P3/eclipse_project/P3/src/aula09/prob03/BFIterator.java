package aula09.prob03;

public interface BFIterator {
	boolean hasPrevious();
	Object previous();
	boolean hasNext();
	Object next();
}