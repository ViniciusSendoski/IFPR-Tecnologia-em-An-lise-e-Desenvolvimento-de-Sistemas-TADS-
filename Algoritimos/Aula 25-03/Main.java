// A semantica <//> define um comentario
// Para executar se deve compilar e depois executar o arquivo compilado. Exemplo:
// user@user:~/Documentos$ javac Main.java
// user@user:~/Documentos$ java Main
// Ou tambem é possivel usar operadores para facilitar a compilação e a execução:
// user@user:~/Documentos$ javac Main.java && java Main

// Classe possui o nome do arquivo, uma classe é definido por um conjuto de funções
public class Main{
    // A função public static void main, define a primeira função a ser executada, ou sejá sera a função com prioridade inicial

    // No java não é aceito o uso de função dentro de funções, sendo possivel fazer uma chamada de função dentro de outra função
    public static void main(String[] args) {
        // Chamada da função para imprimir uma mensagem, sabendo que não é passado nenhum parametros
        imprimirMensagem();
        imprimirExpressao();
        imprimirComVariaveis();
    }

    // Criação de função secundaria, a qual vai realizar uma ação ou dar uma saida, de preferencia com um nome relacionado ao que a função realiza
    public static void imprimirMensagem(){
        // Estrutura responsavel por exibir uma mensagem no terminal.
        // Devido a não utilização de semanticas de separação, o que será exibido não tera espaçamento ao fim do texto, colando a saida ao inicio da chamada do terminal
        System.out.print("Hello Word");
        // Caracteres a serem exibidos devem estar em "" aspas duplas        
        // Exemplo com a saida usando o <System.out.print();> acima: Hello Wordviniciusd9s@viniciusd9s-nitro:~/Documentos/Algoritimos/Aula 25-03$ 

        // Ao adicionar <\n> a saida anterior muda
        System.out.print("\n");
        // Usando o semantica a <\n> força em uma 'quebra de linha', dependendo da possição em que estiver

        System.out.println("Hello Word");
        // Com a mudança na estrutura o print agora utiliza altomaticamente um <\n> ao fim da saida

        System.out.println("-----");
    }

    // Função secundaria para testar Operadores
    public static void imprimirExpressao(){
        // Ao utilizar a semantica de <"">, sua saida é uma mensagem
        System.out.println("8 + 20");

        // Ao utilizar diretamente um valor ou variavel a saida deve ser a soma por exemplo
        System.out.println(8 + 20);

        // É possivel usar tambem os Operadores Logicos
        System.out.println(8 < 20);
        System.out.println(8 == 20);
        System.out.println(8 != 20);

        // As regras de prioridade de operadores contam
        System.out.println(6 % 4 + 5);
        System.out.println((8 % 2 == 0) && true);

        System.out.println("-----");
    }

    public static void imprimirComVariaveis(){
        // A declaração <int> é relacionada a numeros no conjunto dos inteiros positivos e negativos
        int A = 5;
        int B = 10;
        int C = -8;

        // A declaração <Double>  é relacionada a numeros no conjunto dos reais positivos e negativos
        double D = 1.5;

        System.out.println(2 * A % 3 - C);

        System.out.println("#####");

        // Exemplo praticos com variaveis
        int P = 2;
        int Q = 3;
        int R = 12;
        double S = 4.5;

        System.out.println((100* Q)/ P + R);
        System.out.println(R % (P - 1) - Q * R);
        System.out.println(P * R % 5 - Q / 2);

        System.out.println("-----");
    }
}