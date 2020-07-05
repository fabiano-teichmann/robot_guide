*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE E LOCAL
Library     String

*** Variables ***
${GLOBAL_INSTANCIADA}   MINHA VARIAVEL GLOBAL
@{FRUTAS}       morango     banana      maça
# Example dict
&{PESSOA}    nome=Fabiano Teichmann   email=fabiano.geek@gmail.com  idade=37


*** Test Cases ***
Cenario exemplo 01
    Uma Keyword qualquer 01
    Uma Keyword qualquer 02

Cenario exemplo 02
    Uma Keyword qualquer 02

Cenario exemplo 03
    Uma Keyword qualquer 02
    Uma Keyword qualquer 03


*** Keywords ***

Uma Keyword qualquer 01
    # ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}      teste variavel

    # PODE SER UTILIZADA EM QUALQUER LOCAL DO TESTE
    Set Global Variable     ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}       teste feita em execução
    # somente na suit utilizada
    Set Suite Variable       ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}  Variável da suite
    # Pode ser utilizada em todas as keywords do teste em execução
    Set Test Variable       ${TESTE_01}     Variável do teste 01
    Log     ${TESTE_01}
    # PODE SER UTILIZADA NA KEYWORD EM EXECUÇÃO
    ${LOCAL}    Set Variable    Variavel local da keyword 01
    Uma Subkeyword com argumento  ${PESSOA.nome}  ${PESSOA.email}
    ${ALERTA}    Uma Subkeyword com retorno   ${PESSOA.nome}  ${PESSOA.idade}
    Log     ${ALERTA}

Uma Subkeyword com argumento
    [Arguments]    ${PESSOA.nome}  ${PESSOA.email}
    Log     Nome: ${PESSOA.nome}
    Log     Email: ${PESSOA.email}

Uma Subkeyword com retorno
    [Arguments]  ${NOME}    ${IDADE}
    ${MSG}  Set Variable if     ${IDADE}<18  Usuário ${NOME} Não autorizado
    [Return]  ${MSG}

Uma Keyword qualquer 02
    ${LOCAL}    Set Variable    Variavel local da keyword 02
    Log     ${LOCAL}
    Log     ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    Log     ${GLOBAL_INSTANCIADA} ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} ${LOCAL}
    # Não funciona por que é valido somente para o teste  que foi criada
    # Log     ${TESTE_01}

Uma Keyword qualquer 03
    ${LOCAL}    Set Variable    Variavel local da keyword 03


    Log     ${LOCAL}
    Log     ${LOCAL}
    Log     ${GLOBAL_INSTANCIADA}
    Log     ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    Log     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}
    Log     ${FRUTAS[0]}
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}