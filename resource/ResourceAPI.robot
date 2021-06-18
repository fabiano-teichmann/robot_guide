*** Settings ***
Documentation    Suite description
Library   RequestsLibrary
Library   Collections

*** Variables ***
${URL}    https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_1}   ID=1
...         Title=Book 1
...         Description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\n
...         PageCount=100
...         Excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\r\n

&{NEW_BOOK}   ID=1000
...           Title=Test Robot
...           Description=Test Robot API
...           PageCount=0
...           Excerpt=Test Robot



*** Keywords ***
Conectar API
    Create Session      fakeApi  ${URL}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}


Requisitar todos os livros
    ${RESPOSTA}     Get Request  fakeApi    Books
    Log      ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}


Cadastrar um novo livro
    ${RESPOSTA}    Post Request   fakeAPI    Books
    ...                           data={"ID": 1000, "Title": "Test Robot", "Description": "Test Robot API","PageCount": 0, "Excerpt": "Test Robot", "PublishDate": "2020-03-21T19:17:33.917Z"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID}"
    ${RESPOSTA}     Get Request  fakeApi    Books/${ID}
    Log      ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}


Deletar o livro "${ID}"
    ${RESPOSTA}     Delete Request  fakeApi    Books/${ID}
    Log      ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Atualizaro o livro "${ID}"
    ${RESPOSTA}     Put Request  fakeApi    Books/${ID}
    ...                                     data={"ID": 1000, "Title": "Test Robot", "Description": "Test Robot API","PageCount": 0, "Excerpt": "Test Robot", "PublishDate": "2020-03-21T19:17:33.917Z"}
    ...                                     headers=${HEADERS}
    Log      ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

# Conferencias
Conferir o status code
    [Arguments]     ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings   ${RESPOSTA.status_code}  ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]  ${REASON_DESEJADO}
    Should Be Equal As Strings   ${RESPOSTA.reason}  ${REASON_DESEJADO}

Conferir se retornou uma lista com "${QTD_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}  ${QTD_LIVROS}

Conferir se retorna todos os dados corretos do livro 1
    Dictionary Should Contain Item      ${RESPOSTA.json()}  id  ${BOOK_1.ID}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  title  ${BOOK_1.Title}
        

Conferir se cadastrou o livro
    Dictionary Should Contain Item      ${RESPOSTA.json()}  id  ${NEW_BOOK.ID}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  title  ${NEW_BOOK.Title}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  description  ${NEW_BOOK.Description}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  pageCount  ${NEW_BOOK.PageCount}
    Dictionary Should Contain Item      ${RESPOSTA.json()}  excerpt  ${NEW_BOOK.Excerpt}
   


Confere se a resposta e vazia
     Should Be Empty      ${RESPOSTA.content}