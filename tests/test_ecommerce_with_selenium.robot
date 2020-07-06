*** Settings ***
Documentation  This is example test acceptance with use Selenium
Resource  ../resource/Resouce_Selenium.robot
Suite Setup     Abrir navegador
Library     FakerLibrary
Suite Teardown  Fechar navegador

*** Variables ***

${URL}  http://automationpractice.com
${BROWSER}  chrome
${CITY} =  FakerLibrary.city
${ZIPCODE} =  FakerLibrary.zipcode
&{PESSOA}    customer_firstname=Fabiano   customer_lastname=Teichmann   password=!3#d!@Gddwd12*dsfDD  address1=Street Show, 20  city=Soledade   zip_code=99330   phone_mobile=99999 9999 9999

@{SUB_CATEGORIA}      Summer Dresses    Printed Summer Dress  Printed Summer Dress  Printed Chiffon Dress

*** Test Cases ***
Faker_profile
        ${address} =  FakerLibrary.address
        ${country} =  FakerLibrary.country
        ${EMAIL} =  FakerLibrary.email
        ${first_name} =  FakerLibrary.first_name
        ${last_name} =  FakerLibrary.last_name
        ${phone_number} =  FakerLibrary.phone_number


Cenario 01: Pesquisar produto existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca


Cenário 02: Pesquisar produto não existente

    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Produto não existe"
    Então a página deve exibir a mensagem "No results were found for your search "Produto não existe""

# Cenário 03: Listar Produtos
#     Dado que estou na página home do site
#     Quando passar o mouse na categoria "WOMEN"
#     Então as sub categorias devem ser exibidas
#     Quando clicar na sub categoria "${SUB_CATEGORIA}"
#     Então uma página com os produtos da sub categoria "${SUB_CATEGORIA}" deve ser exibida

Cenário 04: Adicionar Produtos no Carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    Então o produto "Faded Short Sleeve T-shirts" deve ser listado na página de resultado da busca
    E ao clicar no botão "Add to cart" do produto
    Então uma tela de confirmação deve ser exibida
    Quando clicar no botão "Proceed to checkout"
    Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

Cenário 05: Remover Produtos
    Dado que estou na página home do site

    Quando clicar no ícone carrinho de compras no menu superior direito
    E ao clicar no botão de remoção de produtos (delete) no produto do carrinho
    Então o sistema deve exibir a mensagem "Your shopping cart is empty."

Cenário 06: Adicionar Cliente
    Dado que estou na página home do site
    Quando clicar no botão superior direito “Sign in”
    ${EMAIL} =  FakerLibrary.email
    log to console  ${EMAIL}
    E inserir um email "${EMAIL}" válido
    E ao clicar no botão "Create na account"
    Log    Nome: ${PESSOA.customer_firstname}

    E preencher os campos obrigatórios "${PESSOA}"
    E clicar em "Register" para finalizar o cadastro
    Então a página de gerenciamento da conta deve ser exibida



*** Keywords ***

E Adicionar produto carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    Então o produto "Faded Short Sleeve T-shirts" deve ser listado na página de resultado da busca
    E ao clicar no botão "Add to cart" do produto
    Então uma tela de confirmação deve ser exibida
    Quando clicar no botão "Proceed to checkout"
    Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Clicar no botão "submit_search"

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

E ao clicar no botão "${BUTTON}" do produto
    Clicar no botão carrinho
