package MPEI;

import biblioteca.Data;
import biblioteca.Livro;
import biblioteca.Socio;

public class Generator {
	
	static String[] nomem = {"João", "José", "Mário","Tomé","António","Leonardo","Daniel","Tiago","Luís","Hugo", "Lourenço",
				            "Guilherme","André","Gonçalo","Francisco","Pedro","Fábio","Jorge","Gustavo","Rui","Gil",
				            "David","Miguel","Augusto","César","Paulo","Joel","Vasco","Alexandre","Bruno","Carlos",
				            "Diogo","Daniel","Gabriel","Sérgio","Simão","Nuno","Ricardo","Tomás","Sérgio","Marco"};

	static String[] nomef = {"Maria","Ana","Mariana","Margarida","Raquel","Susana","Helena","Diana","Carolina","Rosa",
						    "Sara","Patrícia","Dina","Lara","Clara","Iara","Ariel","Mara","Tatiana","Filipa","Soraia",
						    "Juliana","Carla","Rita","Beatriz","Cátia","Marlene","Catarina","Inês","Vera","Madalena",
						    "Verónica","Daniela","Francisca","Teresa","Berta","Paula","Nádia","Marta","Melissa"};
				
	static String[] apelido = {"Silva","Ferreira","Oliveira","Costa","Ramos","Dias","Passos","Azevedo","Teixeira", "Bastos",
						   	   "Martins","Coelho","Morgado","Cardoso","Lopes","Nunes","Resende","Freire","Vasconcelos","Ventura",
							   "Gomes","Sá","Monteiro","Simões","Santos","Sousa","Almeida","Fernandes","Rodrigues","Rocha",
							   "Andrade","Veloso","Pacheco","Aguiar","Seabra","Tavares","Mendes","Freitas","Correia"};
					
	static String[] adjf = {"duvidosa", "fantástica", "impensável", "grande", "pequena","esplendorosa", "irreverente", "feliz",
						    "enorme", "difícil", "inalcançável", "misteriosa", "súbita", "inigualável", "vitoriosa", "famosa",
						    "inúmera", "valente", "aventurosa", "magnânime", "perigosa", "soberba", "imponente", "mágica", "criativa",
						    "jovem", "superior", "única", "melhor", "corajosa", "longínqua", "eterna", "saudosa", "fluorescente",
						    "intermitente", "assombrada", "escura", "crescida", "admirável", "maravilhosa", "velha", "delicada",
						    "nova", "antiga", "forte", "simples", "certa", "importante", "triste", "pálida", "interessante"};

	static String[] substf = {"revolta", "aventura", "descoberta", "surpresa", "prisioneira","montanha","lagoa","jornada","causa",
						      "caminhada", "miúda", "criança", "garota", "subida", "descida", "heroína", "guerreira","chuva", "oportunidade",
						      "cavaleira", "ninja", "samurai", "lagarta", "cobra", "serpente", "águia", "fénix", "bruxa","flauta", "nuvem",
						      "feiticeira", "rapariga", "viagem", "sábia","canoa", "mota", "casa", "mancha", "mulher", "velha", "areia",
						      "bengala", "flor", "borboleta", "rainha", "princesa", "lágrima", "sereia", "árvore", "escritura", "praia",
						      "fada", "fruta", "maçã", "mala", "ampulheta", "prata", "jóia", "rosa", "relva", "caixa", "moeda", "pétala",
						      "pedra", "rocha", "adolescente", "bebé", "Nintendo", "probabilidade", "presidente", "vice-presidente", "andorinha",
						      "guitarra", "viola", "matemática", "batata", "laranja", "cinza","igreja","mesa", "cadeira", "janela", "telha",
						      "salvadora", "planca", "tática", "dor", "chuva", "seda", "bicicleta", "ferrugem"};
	
	static String[] adjm = {"imprescindível", "completo", "pesado", "principal", "breve", "último", "calado", "interessante", "perigoso",
						    "único", "bom", "grande", "novo", "pequeno", "velho", "longínquo", "oportuno", "inoportuno", "calmo", "insolente",
						    "ansioso", "débil", "aventureiro", "aventuroso", "real", "forte", "assombrado", "valente", "inúmero", "magnífico",
						    "súbito", "antigo", "consciente", "eterno", "raro", "só", "perfeito", "frio", "quente", "humano", "alto", "extraordinário",
						    "intermitente", "deslumbrante", "ofuscante", "maravilhoso", "pior", "escuro", "alegre", "melhor", "sério", 
						    "péssimo", "altivo", "incandescente", "diferente", "salgado", "máximo", "arrogante", "precioso", "soberbo",
						    "faminto", "glorioso", "raro", "precioso", "inocente", "fluorescente", "ignóbil"};
	
	static String[] substm = {"ferro", "gelo", "fogo", "vulcão", "ninja", "samurai", "cavaleiro", "cavalo", "pónei", "sapo", "condado",
							  "lagarto", "unicórnio", "dragão", "falcão", "bruxo", "feiticeiro", "bosque", "monte", "barco", "princípe",
							  "navio", "solstício", "eclipse", "elefante", "jaguar", "carro","lar", "carvalho", "orvalho","reino",
							  "livro", "poema", "banco", "cantil", "ouro", "relógio", "diamante", "bronze", "mar", "oceano", "diário",
							  "baú", "tesouro", "olho", "sorriso", "coelho", "homem", "miúdo", "garoto", "senhor", "escudo", "ultraje",
							  "cofre", "filho", "neto", "pio", "tambor", "piano", "ambar", "pintor", "militar", "chefe", "rei",
							  "balde", "copo", "prato", "bebé", "adolescente", "jovem", "piano", "saxofone", "laço", "meme", "presidente",
							  "vice-presidente", "inglês", "espanhol", "francês", "alemão", "puré", "vento", "problema", "sol", "cálculo",
							  "supermercado", "mato", "passeio", "vinho", "telhado"};
	
	static String[] paises = {"Portugal", "Espanha", "França", "Itália", "Alemanha", "Bélgica", "Irlanda", "China","Inglaterra", 
							"Escócia", "Japão", "Tailândia", "República Checa", "Argentina", "Brasil", "Austrália", "Nova Zelândia",
							"Canadá", "Estados Unidos", "Grécia", "Paraguai", "Nigéria", "Angola", "Moçambique", "Chile", "Rússia",
							"Israel", "Suécia", "Suíça", "Dinamarca"};
	
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
		double seed5 = Math.random(); //nome da lista ou próprio
		double seed6 = Math.random(); //nome
		double seed7 = Math.random(); //fim do título ou não
		double seed8 = Math.random(); //género do seguinte
		double seed9 = Math.random(); //e ou de
		double seed10 = Math.random();//tem mais adjetivo
		double seed11 = Math.random();//qual adjetivo
		double seed12 = Math.random();//nome da lista ou próprio
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
