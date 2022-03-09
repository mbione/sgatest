Funcionalidade: Encerrar aposta
#Descrição
Como um jogador
Quero poder encerrar uma aposta que atenda os critérios da banca para encerramento
Para que eu possa resgatar uma parcela do prêmio antes do resultado final da aposta

    Regra: João pode encerrar a aposta

        Contexto: Pré-requisitos para tornar aposta possível de encerramento
            Dado Que a aposta é em um evento de uma liga destaque
              E a configuração de cashout da banca para a liga está ativa
              E o valor de cashout é maior que a metade do valor apostado
              E a aposta contém pelo menos um evento pendente
              E o valor de cashout é menor que o prêmio original da aposta

        Cenário: João pode encerrar uma aposta
            Dado Que a aposta satisfaz os requisitos para poder ser encerrada
             Quando João consultar a aposta
             Então João deve ver o desconto aplicado pela banca no valor a resgatar
              E conseguir encerrar a aposta
              E ter o saldo atualizado com a soma do valor de resgatado

        Cenário: Aposta simples em eventos ao vivo
            Dado Que João fez uma aposta simples em um evento ao vivo
              E A aposta foi realizada pela plataforma online
              E a odd está aberta
              E o evento possui um dos seguintes estados: "Não iniciado", "Progresso", "Finalizado" ou "Perto de começar"
             Quando João acessa a aba "Ao Vivo" no painel de apostas
             Então João deve conseguir encerrar sua aposta

        Cenário: Aposta múltipla com pelo menos um evento ganho
            Dado que João fez uma aposta em 4 odds de ligas destaque em uma banca que permite o cashout para estas ligas
             Quando pelo menos uma odd estiver como ganha
              E pelo menos uma odd estiver pendente
              E nenhuma das outras odds foi perdida
              E nenhuma odd da aposta foi suspensa
              E a aposta foi realizada a 7 dias ou menos
             Então João deve conseguir encerrar a aposta
              E a aposta deve aparecer na aba "Encerrar" dentro do painel de apostas
              E ter o saldo atualizado com a soma do valor de cashout

    Regra: João não pode encerrar a aposta

        Cenário: O valor de uma das odds da aposta atualmente é diferente do valor solicitado por João
            Dado que João possui uma aposta possível de encerrar
             Quando João solicita o cashout
              E alguma das odds teve seu valor alterado após a consulta da aposta
             Então João não deve conseguir encerrar a aposta

        Cenário: O valor de cashout da aposta de João ultrapassa o prêmio máximo da banca
            Dado que João fez uma aposta em 4 eventos de uma liga de destaque habilitada para cashout
             Quando o valor calculado para cashout desta aposta excede o prêmio máximo da banca
             Então João não deve conseguir encerrar a aposta

        Cenário: O Multiplicador do valor de cashout da aposta de João ultrapassa o multiplicador máximo da banca
            Dado que João fez uma aposta múltipla em 4 eventos de uma liga de destaque habilitada para cashout
             Quando o multiplicador do cashout ultrapassar o multiplicador máximo da banca
             Então João não deve conseguir encerrar a aposta

        Cenário: O valor de cashout da aposta de João é menor que 150% do valor que ele investiu na aposta
            Dado que João fez uma aposta múltipla em 4 eventos de uma liga de destaque habilitada para cashout
             Quando o valor do cashout for menor que 150% do valor apostado
             Então João não deve conseguir encerrar a aposta

        Cenário: O valor de cashout da aposta de João é maior que o prêmio original da aposta
            Dado que João fez uma aposta múltipla em 4 eventos de uma liga de destaque
             Quando o valor do cashout é maior que o prêmio original da aposta
             Então João não deve conseguir encerrar a aposta

        Cenário: João apostou em um evento que não pertence a uma liga de destaque
            Dado que João fez uma aposta em um evento de uma liga que não é de destaque
             Quando João consultar a aposta
             Então João não deve conseguir encerrar a aposta

        Cenário: A banca que João apostou não configurou o cashout para a liga que o evento apostado pertence
            Dado que João fez uma aposta em um evento que a banca não configurou como possível de encerrar
             Quando João consultar a aposta
             Então ele não deve conseguir encerrar a aposta

        Cenário: João fez uma aposta simples em pre-match
            Dado que João apostou em apenas um evento
             Quando o evento estiver pendente
             Então ele não deve conseguir encerrar a aposta

        Cenário: João fez uma aposta múltipla em 4 eventos e um deles foi perdido
            Dado que João fez uma aposta múltipla em 4 eventos de uma liga de destaque habilitada para cashout
             Quando um dos eventos apostados foi perdido
             Então ele não deve conseguir encerrar a aposta

        Cenário: O evento que João apostou foi adiado, interrompido ou abandonado
            Dado que João fez uma aposta qualquer
             Quando pelo menos um dos eventos da aposta possuir um dos seguintes estados: "Adiado", "Interrompido" ou "Abandonado"
             Então ele não deve conseguir encerrar a aposta

        Cenário: A odd de um evento apostado por João está suspensa
            Dado que João fez uma aposta múltipla com 4 eventos de uma liga de destaque habilitada para cashout
             Quando o provedor de odds ou administrador da banca suspender a odd de um ou mais eventos presentes na aposta
             Então ele não deve conseguir encerrar a aposta

        Cenário: João fez sua aposta em uma banca de "crédito 1"
            Dado que João fez a aposta qualquer por uma plataforma de crédito 1(Não é online)
             Quando João consultar a aposta
             Então ele não deve conseguir encerrar a aposta

        Cenário: João fez sua aposta a mais de 7 dias atrás
            Dado que João fez uma aposta qualquer
             Quando se passarem 7 dias ou mais
             Então João não deve conseguir encerrar a aposta