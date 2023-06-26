***Settings***
Library    SeleniumLibrary 

***Test Cases***

test1 
    Open Browser    https://www.ebay.com/    chrome
    Maximize Browser Window
    Input Text  //input[@type='text']  book
    Close Browser