*** Settings ***
Documentation  Exemplo de uso do if e do For

*** Variables ***
# Exemplo de variavel como lista ou array
@{FRUTAS}       morango     banana      maça


*** Test Cases ***
Caso de testes if
    Rodando um keyword com condição = true
    Rodando um keyword com condição = false
    Armazendando valor keyword

Caso de testes loop
    Usando FOR com RANGE
    Usando FOR com LISTA
    Saindo de um FOR
    Usando REPEAT

*** Keywords ***
Rodando um keyword com condição = true
    Run keyword if  '${FRUTAS[0]}' == 'morango'  Log    O primeiro item é morango

Rodando um keyword com condição = false
    Run keyword if  '${FRUTAS[1]}' == 'morango'  Log    O segundo item não é morango é ${FRUTAS[1]}

Armazendando valor keyword
    ${VAR}  Set Variable  if   '${FRUTAS[0]}' == 'morango'    Eu gosto de morango
    Log     Minha variável é ${VAR}!!!

Usando FOR com RANGE
    FOR    ${COUNT}  IN RANGE  1  6
       Log     Meu contador é ${COUNT}
    END
Usando FOR com LISTA

    FOR    ${ITEM}    IN    @{FRUTAS}
        Log     Minha fruta ${ITEM}
    END
Saindo de um FOR
    FOR    ${ITEM}   IN  @{FRUTAS}
        Exit for loop if    '${ITEM}' == 'banana'
        Log     Minha fruta ${ITEM}
    END

Usando REPEAT
    Repeat Keyword     4   Log     Repete 4 vezes