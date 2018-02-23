package MPEI;

import biblioteca.Data;
import biblioteca.Livro;
import biblioteca.Socio;

public class Generator {
	
	static String[] nomem = {"Jo�o", "Jos�", "M�rio","Tom�","Ant�nio","Leonardo","Daniel","Tiago","Lu�s","Hugo", "Louren�o",
				            "Guilherme","Andr�","Gon�alo","Francisco","Pedro","F�bio","Jorge","Gustavo","Rui","Gil",
				            "David","Miguel","Augusto","C�sar","Paulo","Joel","Vasco","Alexandre","Bruno","Carlos",
				            "Diogo","Daniel","Gabriel","S�rgio","Sim�o","Nuno","Ricardo","Tom�s","S�rgio","Marco"};

	static String[] nomef = {"Maria","Ana","Mariana","Margarida","Raquel","Susana","Helena","Diana","Carolina","Rosa",
						    "Sara","Patr�cia","Dina","Lara","Clara","Iara","Ariel","Mara","Tatiana","Filipa","Soraia",
						    "Juliana","Carla","Rita","Beatriz","C�tia","Marlene","Catarina","In�s","Vera","Madalena",
						    "Ver�nica","Daniela","Francisca","Teresa","Berta","Paula","N�dia","Marta","Melissa"};
				
	static String[] apelido = {"Silva","Ferreira","Oliveira","Costa","Ramos","Dias","Passos","Azevedo","Teixeira", "Bastos",
						   	   "Martins","Coelho","Morgado","Cardoso","Lopes","Nunes","Resende","Freire","Vasconcelos","Ventura",
							   "Gomes","S�","Monteiro","Sim�es","Santos","Sousa","Almeida","Fernandes","Rodrigues","Rocha",
							   "Andrade","Veloso","Pacheco","Aguiar","Seabra","Tavares","Mendes","Freitas","Correia"};
					
	static String[] adjf = {"duvidosa", "fant�stica", "impens�vel", "grande", "pequena","esplendorosa", "irreverente", "feliz",
						    "enorme", "dif�cil", "inalcan��vel", "misteriosa", "s�bita", "inigual�vel", "vitoriosa", "famosa",
						    "in�mera", "valente", "aventurosa", "magn�nime", "perigosa", "soberba", "imponente", "m�gica", "criativa",
						    "jovem", "superior", "�nica", "melhor", "corajosa", "long�nqua", "eterna", "saudosa", "fluorescente",
						    "intermitente", "assombrada", "escura", "crescida", "admir�vel", "maravilhosa", "velha", "delicada",
						    "nova", "antiga", "forte", "simples", "certa", "importante", "triste", "p�lida", "interessante"};

	static String[] substf = {"revolta", "aventura", "descoberta", "surpresa", "prisioneira","montanha","lagoa","jornada","causa",
						      "caminhada", "mi�da", "crian�a", "garota", "subida", "descida", "hero�na", "guerreira","chuva", "oportunidade",
						      "cavaleira", "ninja", "samurai", "lagarta", "cobra", "serpente", "�guia", "f�nix", "bruxa","flauta", "nuvem",
						      "feiticeira", "rapariga", "viagem", "s�bia","canoa", "mota", "casa", "mancha", "mulher", "velha", "areia",
						      "bengala", "flor", "borboleta", "rainha", "princesa", "l�grima", "sereia", "�rvore", "escritura", "praia",
						      "fada", "fruta", "ma��", "mala", "ampulheta", "prata", "j�ia", "rosa", "relva", "caixa", "moeda", "p�tala",
						      "pedra", "rocha", "adolescente", "beb�", "Nintendo", "probabilidade", "presidente", "vice-presidente", "andorinha",
						      "guitarra", "viola", "matem�tica", "batata", "laranja", "cinza","igreja","mesa", "cadeira", "janela", "telha",
						      "salvadora", "planca", "t�tica", "dor", "chuva", "seda", "bicicleta", "ferrugem"};
	
	static String[] adjm = {"imprescind�vel", "completo", "pesado", "principal", "breve", "�ltimo", "calado", "interessante", "perigoso",
						    "�nico", "bom", "grande", "novo", "pequeno", "velho", "long�nquo", "oportuno", "inoportuno", "calmo", "insolente",
						    "ansioso", "d�bil", "aventureiro", "aventuroso", "real", "forte", "assombrado", "valente", "in�mero", "magn�fico",
						    "s�bito", "antigo", "consciente", "eterno", "raro", "s�", "perfeito", "frio", "quente", "humano", "alto", "extraordin�rio",
						    "intermitente", "deslumbrante", "ofuscante", "maravilhoso", "pior", "escuro", "alegre", "melhor", "s�rio", 
						    "p�ssimo", "altivo", "incandescente", "diferente", "salgado", "m�ximo", "arrogante", "precioso", "soberbo",
						    "faminto", "glorioso", "raro", "precioso", "inocente", "fluorescente", "ign�bil"};
	
	static String[] substm = {"ferro", "gelo", "fogo", "vulc�o", "ninja", "samurai", "cavaleiro", "cavalo", "p�nei", "sapo", "condado",
							  "lagarto", "unic�rnio", "drag�o", "falc�o", "bruxo", "feiticeiro", "bosque", "monte", "barco", "princ�pe",
							  "navio", "solst�cio", "eclipse", "elefante", "jaguar", "carro","lar", "carvalho", "orvalho","reino",
							  "livro", "poema", "banco", "cantil", "ouro", "rel�gio", "diamante", "bronze", "mar", "oceano", "di�rio",
							  "ba�", "tesouro", "olho", "sorriso", "coelho", "homem", "mi�do", "garoto", "senhor", "escudo", "ultraje",
							  "cofre", "filho", "neto", "pio", "tambor", "piano", "ambar", "pintor", "militar", "chefe", "rei",
							  "balde", "copo", "prato", "beb�", "adolescente", "jovem", "piano", "saxofone", "la�o", "meme", "presidente",
							  "vice-presidente", "ingl�s", "espanhol", "franc�s", "alem�o", "pur�", "vento", "problema", "sol", "c�lculo",
							  "supermercado", "mato", "passeio", "vinho", "telhado"};
	
	static String[] paises = {"Portugal", "Espanha", "Fran�a", "It�lia", "Alemanha", "B�lgica", "Irlanda", "China","Inglaterra", 
							"Esc�cia", "Jap�o", "Tail�ndia", "Rep�blica Checa", "Argentina", "Brasil", "Austr�lia", "Nova Zel�ndia",
							"Canad�", "Estados Unidos", "Gr�cia", "Paraguai", "Nig�ria", "Angola", "Mo�ambique", "Chile", "R�ssia",
							"Israel", "Su�cia", "Su��a", "Dinamarca"};
	
	public static String nome(){
		String tmp1 = "";
		String tmp2 = "";
		double gender= Math.random();
	
		 
		if (gender >= 0.5) {	//homem
			tmp1 = nomem[(int)Math.floor(Math.random()*(nomem.length))];
			tmp2 = nomem[(int)Math.floor(Math.random()*(nomem.length))];
			//} while (tmp2 == tmp1);
			return tmp1 + " " + tmp2 + " " + apelido[(int)Math.floor(Math.random()*(apelido.length))];
		}
			tmp1 = nomef[(int)Math.floor(Math.random()*(nomef.length))];
			tmp2 = nomef[(int)Math.floor(Math.random()*(nomef.length))];
			//} while (tmp2 == tmp1);
			return tmp1 + " " + tmp2 + " " + apelido[(int)Math.floor(Math.random()*(apelido.length))];
	}
	
	public static String titulo() {
		String tmp = "";
		
		
		double seed1 = Math.random(); //feminino ou masculino
		double seed2 = Math.random(); //tem "o" ou "a"
		double seed3 = Math.random(); //tem adjetivo precedente
		double seed4 = Math.random(); //adjetivo
		double seed5 = Math.random(); //nome da lista ou pr�prio
		double seed6 = Math.random(); //nome
		double seed7 = Math.random(); //fim do t�tulo ou n�o
		double seed8 = Math.random(); //g�nero do seguinte
		double seed9 = Math.random(); //e ou de
		double seed10 = Math.random();//tem mais adjetivo
		double seed11 = Math.random();//qual adjetivo
		double seed12 = Math.random();//nome da lista ou pr�prio
		double seed13 = Math.random();//nome
		
		if (seed1 >= 0.45) {				//masculino
			if (seed2 >= 0.90) 			
				tmp += "o ";
			if (seed3 >= 0.55)
				tmp += adjm[(int)Math.floor(seed4*(adjm.length))] + " ";
			if (seed5 >= 0.93)
				tmp += nomem[(int)Math.floor(seed6*(nomem.length))];
			else
				tmp += substm[(int)Math.floor(seed6*(substm.length))];
			if (seed7 >= 0.65) {
				if (seed8 >= 0.45) {		//masculino
					if (seed9 >=0.75) 	 	
						tmp += " do";
					else tmp+= " e o";
					if (seed10 >= 0.70)
						tmp += " " + adjm[(int)Math.floor(seed11*(adjm.length))];
					if (seed12 > 0.95)
						tmp += " " + nomem[(int)Math.floor(seed13*(nomem.length))];
					else
						tmp += " " + substm[(int)Math.floor(seed13*(substm.length))];
					}
				else {
					if (seed9 >=0.75) 	 	
						tmp += " da";
					else tmp+= " e a";
					if (seed10 >= 0.75)
						tmp += " " + adjf[(int)Math.floor(seed11*(adjf.length))];
					if (seed12 > 0.95)
						tmp += " " + nomef[(int)Math.floor(seed13*(nomef.length))];
					else
						tmp += " " + substf[(int)Math.floor(seed13*(substf.length))];
				}
			}
		}
		
		else {				
			if (seed2 >= 0.90) 			
				tmp += "a ";
			if (seed3 >= 0.55)
				tmp += adjf[(int)Math.floor(seed4*(adjf.length))] + " ";
			if (seed5 >= 0.93)
				tmp += nomef[(int)Math.floor(seed6*(nomef.length))];
			else
				tmp += substf[(int)Math.floor(seed6*(substf.length))];
			if (seed7 >= 0.65) {
				if (seed8 >= 0.45) {		
					if (seed9 >=0.75) 	 	
						tmp += " do";
					else tmp+= " e o";
					if (seed10 >= 0.70)
						tmp += " " + adjm[(int)Math.floor(seed11*(adjm.length))];
					if (seed12 > 0.95)
						tmp += " " + nomem[(int)Math.floor(seed13*(nomem.length))];
					else
						tmp += " " + substm[(int)Math.floor(seed13*(substm.length))];
					}
				else {
					if (seed9 >=0.75) 	 	
						tmp += " da";
					else tmp+= " e a";
					if (seed10 >= 0.75)
						tmp += " " + adjf[(int)Math.floor(seed11*(adjf.length))];
					if (seed12 > 0.95)
						tmp += " " + nomef[(int)Math.floor(seed13*(nomef.length))];
					else
						tmp += " " + substf[(int)Math.floor(seed13*(substf.length))];
				}
			}
		}
		
		String nome = "";
		for (int i=0; i<tmp.length(); i++) {
			if (i == 0)
				nome += Character.toUpperCase(tmp.charAt(i));
			else
				nome += tmp.charAt(i);
		}
		
		return nome;
	}
	
	public static Data data() {
		int ano = (int)Math.floor(1930+Math.random()*80);
		int mes = (int)Math.floor(1+Math.random()*12);
		int dia;
		if (mes == 2) {
			if (Data.bissexto(ano))
				dia = (int)Math.floor(1+Math.random()*29);
			else
				dia = (int)Math.floor(1+Math.random()*28);
		}
		else if (mes == 4 || mes == 6 || mes == 9 || mes == 11 )
			dia = (int)Math.floor(1+Math.random()*30);
		else 
			dia = (int)Math.floor(1+Math.random()*31);
		
		return new Data(dia, mes, ano);
	}
	
	public static Socio socio() {
		return new Socio(nome(), data());
	}
	
	public static String[] autores(int n) {
		String[] autores = new String[n];
		for (int i=0; i<n; i++) {
			autores[i] = nome();
		}
		return autores;
	}
	
	public static Livro livro(String[] autores) {
		String titulo = titulo();
		String autor = autores[(int)Math.floor(Math.random()*(autores.length))];
		Livro l = new Livro(titulo, autor);
		return l;
	}
	
	public static String string(int length) {
		String str="";
		for (int i=0; i<length; i++) {
			int index = 97+(int)+Math.floor(Math.random()*26);
			str += (char)index;
		}
		return str;
	}
	
	public static String pais() {
		return paises[(int)Math.round(Math.random()*(paises.length-1))];
	}
}
