*** Settings ***
Documentation    Suite description
Resource  ../resource/ResourceAPI.robot
Suite Setup     Conectar API



*** Test Cases ***
Buscar a listagem de todos os livros
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retornou uma lista com "200" livros


Buscar um Livro
    Requisitar o livro "1"
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retorna todos os dados corretos do livro 1


Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se cadastrou o livro


Excluir um Livro
    Deletar o livro "1"
    Conferir o status code  200
    Confere se a resposta e vazia


Atualizar Livro
    Atualizaro o livro "1"
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se atualizou o livro


*** Keywords ***
Conferir se atualizou o livro
    Conferir se cadastrou o livro


