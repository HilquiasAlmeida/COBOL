* Divisão obrigatória que identifica o início do programa
IDENTIFICATION DIVISION.
      * Define o nome oficial e único do programa como SISTEMA-BANCARIO
       PROGRAM-ID. SISTEMA-BANCARIO.
       
      * Inicia a divisão dedicada à declaração de variáveis e estruturas de dados
       DATA DIVISION.
      * Inicia a seção de armazenamento de trabalho para variáveis locais
       WORKING-STORAGE SECTION.
      * Declara a variável WS-SALDO com 6 dígitos inteiros, 2 casas decimais e valor inicial de 1500.50
       01 WS-SALDO           PIC 9(6)V99 VALUE 1500.50.
      * Declara a variável WS-VALOR-SAQUE com 6 dígitos inteiros, 2 casas decimais e valor inicial 0
       01 WS-VALOR-SAQUE     PIC 9(6)V99 VALUE 0.
      * Declara a variável de caractere (tamanho 1) para armazenar a escolha do usuário, inicialmente em branco
       01 WS-OPCAO           PIC X VALUE SPACE.
       
      * Inicia a divisão de procedimentos, onde fica toda a lógica executável do programa
       PROCEDURE DIVISION.
      * Define o parágrafo ou bloco principal de execução chamado INICIO
       INICIO.
      * Imprime uma linha de caracteres de igual para fins visuais e estéticos
           DISPLAY "====================================".
      * Imprime o cabeçalho descritivo do sistema no console
           DISPLAY "   SISTEMA BANCARIO COBOL - SIMPLES ".
      * Imprime outra linha de fechamento para o cabeçalho
           DISPLAY "====================================".
      * Exibe o texto estático combinado com o valor monetário atual guardado na variável WS-SALDO
           DISPLAY "Saldo Atual: R$ " WS-SALDO.
      * Exibe a pergunta orientando o usuário a escolher entre Sim ou Não para o saque
           DISPLAY "Deseja realizar um saque? (S/N): ".
      * Captura o caractere digitado pelo teclado e o armazena na variável WS-OPCAO
           ACCEPT WS-OPCAO.
           
      * Estrutura condicional que verifica se a opção escolhida pelo usuário é 'S' ou 's'
           IF WS-OPCAO = 'S' OR WS-OPCAO = 's' THEN
      *        Exibe a mensagem solicitando que o usuário digite o valor que deseja sacar
               DISPLAY "Digite o valor do saque: "
      *        Captura o número digitado pelo teclado e o armazena na variável WS-VALOR-SAQUE
               ACCEPT WS-VALOR-SAQUE
      *        Valida se o valor solicitado para o saque é menor ou igual ao saldo disponível em conta
               IF WS-VALOR-SAQUE <= WS-SALDO THEN
      *            Subtrai matematicamente o valor do saque diretamente do saldo atual
                   SUBTRACT WS-VALOR-SAQUE FROM WS-SALDO
      *            Exibe a mensagem de confirmação de que a transação foi bem-sucedida
                   DISPLAY "Saque realizado com sucesso!"
      *            Exibe o saldo restante atualizado após a dedução do saque
                   DISPLAY "Novo Saldo: R$ " WS-SALDO
               ELSE
      *            Caso o valor do saque seja maior que o saldo, executa este bloco alternativo
                   DISPLAY "Erro: Saldo insuficiente!"
      *            Encerra o bloco da estrutura condicional interna (verificação de limite de saldo)
               END-IF
           ELSE
      *        Caso o usuário tenha digitado qualquer coisa diferente de 'S' ou 's'
               DISPLAY "Operacao cancelada."
      *        Encerra o bloco da estrutura condicional principal (escolha do usuário)
           END-IF.
           
      * Comando final que encerra a execução do programa e devolve o controle ao sistema operacional
           STOP RUN.
