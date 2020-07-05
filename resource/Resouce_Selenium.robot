*** Settings ***
Documentation    Example resource for automation test acceptance test driven development (ATDD)
Library  SeleniumLibrary

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  chrome

*** Keywords ***
Abrir navegador
    Open Browser    about:blank   ${BROWSER}


Fechar navegador
    Close Browser

Acessar página home do site
    Go To               ${URL}
    Title Should be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisar
    Input Text  id=search_query_top  ${PRODUTO}

Clicar no botão "${NAME}"
    Click Element   name=${NAME}

Clicar no botão carrinho
    Click Element   xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

Quando clicar no botão "Proceed to checkout"
    Click Element   xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a


Conferir se o produto "${PRODUTO}" foi listado no site
    wait until Element Is visible   css=#center_column > h1
    Title Should Be     Search - My Store
    Page Should Contain Link    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}
    Element Text Should Be          xpath=//*[@id="center_column"]/h1/span      0 results have been found.

Quando passar o mouse na categoria "${CATEGORIA}"
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Set Focus To Element            xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Element Text Should Be          xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]    ${CATEGORIA}

Então as sub categorias devem ser exibidas
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul//a[contains(text(),"Women")]
    Element Should Be Visible    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul//a[contains(text(), "Tops")]

Quando clicar na sub categoria "${SUB_CATEGORIA}"
    Wait Until Element is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul//a[contains(text(), "Tops")]
    Click Link  xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a[contains(text(),"${SUB_CATEGORIA[0]}")]

Então uma página com os produtos da sub categoria "${SUB CATEGORIA}" deve ser exibida
    Element Text Should Be  class=category-name    ${SUB_CATEGORIA[0]}
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[contains(text(), "${SUB_CATEGORIA[1]}")]
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[contains(text(), "${SUB_CATEGORIA[2]}")]
    Page Should Contain Element     xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[contains(text(), "${SUB_CATEGORIA[3]}")]


Então uma tela de confirmação deve ser exibida
    Wait Until Element is Visible    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span[contains(text(), "Proceed to checkout")]
    Element Text Should Be  xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span    Proceed to checkout

Então a tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores
    Wait Until Element is Visible       xpath=//*[@id="center_column"]/p[2]/a[1]/span
    Element Text Should Be      class=heading-counter   Your shopping cart contains: 1 Product
    Element Text Should Be      xpath=//*[@id="product_1_1_0_0"]/td[2]/p/a   Faded Short Sleeve T-shirts
    Element Text Should Be      id=total_price   $18.51

Quando clicar no ícone carrinho de compras no menu superior direito
    Wait Until Element is Visible   class=shopping_cart
    Click Link      xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

E ao clicar no botão de remoção de produtos (delete) no produto do carrinho
    Wait Until Element is Visible      id=cart_title
    Click Link  xpath=//*[@id="1_1_0_0"]


Então o sistema deve exibir a mensagem "${MSG}"
    Wait Until Element is Visible      xpath=//*[@id="center_column"]/p
    Element Text Should Be      xpath=//*[@id="center_column"]/p    ${MSG}

Quando clicar no botão superior direito “Sign in”
    Click Element   xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

E inserir um email "${EMAIL}" válido
    Wait Until Element is Visible   id=email_create
    Input Text   id=email_create    ${EMAIL}

E ao clicar no botão "Create na account"
    Click Element  id=SubmitCreate

E preencher os campos obrigatórios "${PESSOA}"
    Wait Until Element is Visible   id=submitAccount
    Input Text  id=customer_firstname   ${PESSOA.customer_firstname}
    Input Text  id=customer_lastname    ${PESSOA.customer_lastname}
    Input Text  id=passwd   ${PESSOA.password}
    Input Text  id=address1    ${PESSOA.address1}
    Input Text  id=city     ${PESSOA.city}
    Input Text  id=postcode     ${PESSOA.zip_code}
    Click Element  xpath=//*[@id="id_state"]/option[2]
    Input Text  id=phone_mobile     ${PESSOA.phone_mobile}
    Input Text  id=alias    Cs06
    Input Text  id=other    bla

E clicar em "Register" para finalizar o cadastro
    Click Element   id=submitAccount

Então a página de gerenciamento da conta deve ser exibida
    Element Text Should Be  class=page-heading  MY ACCOUNT
    Element Text Should Be  xpath=//*[@id="center_column"]/div/div[1]/ul/li[1]/a/span   ORDER HISTORY AND DETAILS
    Element Text Should Be  xpath=//*[@id="center_column"]/div/div[1]/ul/li[4]/a/span   MY PERSONAL INFORMATION
