IDENTIFICATION DIVISION.
       PROGRAM-ID. SISTEMA-BANCARIO.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SALDO           PIC 9(6)V99 VALUE 1500.50.
       01 WS-VALOR-SAQUE     PIC 9(6)V99 VALUE 0.
       01 WS-OPCAO           PIC X VALUE SPACE.
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "====================================".
           DISPLAY "   SISTEMA BANCARIO COBOL - SIMPLES ".
           DISPLAY "====================================".
           DISPLAY "Saldo Atual: R$ " WS-SALDO.
           DISPLAY "Deseja realizar um saque? (S/N): ".
           ACCEPT WS-OPCAO.
           
           IF WS-OPCAO = 'S' OR WS-OPCAO = 's' THEN
               DISPLAY "Digite o valor do saque: "
               ACCEPT WS-VALOR-SAQUE
               IF WS-VALOR-SAQUE <= WS-SALDO THEN
                   SUBTRACT WS-VALOR-SAQUE FROM WS-SALDO
                   DISPLAY "Saque realizado com sucesso!"
                   DISPLAY "Novo Saldo: R$ " WS-SALDO
               ELSE
                   DISPLAY "Erro: Saldo insuficiente!"
               END-IF
           ELSE
               DISPLAY "Operacao cancelada."
           END-IF.
           
           STOP RUN.
