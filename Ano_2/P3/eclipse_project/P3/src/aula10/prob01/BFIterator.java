package aula10.prob01;

public interface BFIterator {
	boolean hasPrevious();
	Object previous();
	boolean hasNext();
	Object next();
}