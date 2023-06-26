***Settings***
Library    SeleniumLibrary 
*** Variables ***
${search_button}  //input[@type='submit']
${search_txt}  //input[@type='text']

***Test Cases***

test1 
    Open Browser    https://www.ebay.com/    chrome
    Maximize Browser Window
    Input Text  ${search_txt}   book
    Click Button  ${search_button}
    Close Browser