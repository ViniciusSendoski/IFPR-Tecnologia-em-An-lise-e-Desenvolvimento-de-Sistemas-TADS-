// Execução: user@user:~$ javac Main.java && java Main

// Import chama um metodo esterno para realizar uma ação
import java.util.Scanner; // Usado para receber uma entrada do terminal ao executar o programa

// Aula sobre tipos de dados
public class Main {
    
    // De forma geral permite o uso da variavel teclado
    public static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        int numero;
        
        // Chamada de função
        funsaoComVariaveisI();

        // O valor que sera processado na função é atribuido a uma variavel, essa variavel DEVE ser do mesmo tipo especificado na FUNÇÃO
        numero = lerInteiro();

        // Atribui um valor para ser usado dentro da função
        funsaoComVariaveisII(numero);

        // Recebe numero do usuario 
        numero = lerInteiroComEntrada();

        // Reutiliza a função de numero ao quadrado
        funsaoComVariaveisII(numero);

        numero = lerInicial();

        funsaoAnteriorSucessor(numero);
    }

    // Primeiro exemplo em aula
    public static void funsaoComVariaveisI(){
        // Variaveis
        int numero;
        int numero_quadrado;

        // Entradas
        numero = 25;
        
        // Processamento
        numero_quadrado = numero * numero;
        
        //Saida
        System.out.println(numero_quadrado);

        System.out.println("-----");
    }

    // Ler valor Inteiro
    public static int lerInteiro(){
        // Variaveis
        int valor;

        // Entradas
        valor = 5;

        // Processamento
        
        //Saida

        // vai retornar o valor informado para a função principal 
        return valor;
    }

    public static void funsaoComVariaveisII(int numero){
        // Variaveis
        int numero_quadrado;

        
        // Processamento
        numero_quadrado = numero * numero;
        
        //Saida
        System.out.println(numero_quadrado);

        System.out.println("-----");
    }

    public static int lerInteiroComEntrada(){
        // Variaveis
        int valor;

        // Entradas

        //Para facilitar a visualização pode ser usado um System.out.println(); O terminal ira parar esperando a entrada do usario, a mensagem pode avisar o usario deste fato.
        System.out.print("Digite o numero que quer ao quadrado:");

        // A  variavel ira receber numeros inseridos pelo usuario no terminal, para garantir que são numeros inteiros é utilizado o [.nextInt()]
        valor = teclado.nextInt();

        // Processamento
        
        //Saida

        // vai retornar o valor informado para a função principal 
        return valor;
    }

    // Sucessor e anterior
     public static int lerInicial(){
        // Variaveis
        int valor;

        // Entradas

        //Para facilitar a visualização pode ser usado um System.out.println(); O terminal ira parar esperando a entrada do usario, a mensagem pode avisar o usario deste fato.
        System.out.print("Digite o numero central:");

        // A  variavel ira receber numeros inseridos pelo usuario no terminal, para garantir que são numeros inteiros é utilizado o [.nextInt()]
        valor = teclado.nextInt();

        // Processamento
        
        //Saida

        // vai retornar o valor informado para a função principal 
        return valor;
    }

    // Demostra anterior e sucessor
    public static void funsaoAnteriorSucessor(int numero){
        // Variaveis
        int temp; // Variavel Temporaria
        
        // Processamento
        temp = numero - 1; 
    
        //Saida
        System.out.println("#####");

        System.out.println("Seu Antecessor:" + temp);

        System.out.println("Seu Numero:" + numero);

        // Processamento
        temp = numero + 1; 
    
        //Saida
        System.out.println("Seu Sucessor:" + temp);

        System.out.println("#####");

        // Forma elegante e para a saida sem usar uma variavel temporaria
        System.out.println("Seu Antecesor: " + (numero -1) + "; Seu Numero: " + numero + "; Seu Sucessor: " + (numero + 1));

        System.out.println("-----");
    }

    // Modelo para Ctrl+C Ctrl+V
    public static void funsaoComVariaveisModelo(){
        // Variaveis
        
        // Entradas
        
        // Processamento
        
        //Saida
        
        System.out.println("-----");
    }
}