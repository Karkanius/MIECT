package aula06.prob01;

public enum DiaSemana {
	domingo(0),
	segunda(1),
	terça(2),
	quarta(3),
	quinta(4),
	sexta(5),
	sabado(6);
	
	private final int value;

    DiaSemana(final int value) {
        this.value = value;
    }

    public int getValue() { return this.value; }
    
    public static DiaSemana rand() {
    	DiaSemana [] arr = DiaSemana.values();
    	return arr[(int)(7*Math.random())]; }
    
}
