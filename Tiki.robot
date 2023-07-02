*** Settings ***
Library  SeleniumLibrary
Library  String
Library    Collections
*** Variables ***
${dynamic_xpath}  //div[@class='styles__StyledListItem-sc-w7gnxl-0 cjqkgR']/a[@title="name"]
${locator_danhmuc}  //div[@class='styles__StyledListItem-sc-w7gnxl-0 cjqkgR']/a
${tiki_logo}  //div[@class='Middle__LeftContainer-sc-vop1h1-1 hBRVdJ']//a[@data-view-id='header_main_logo']
${dynamic_category_text}  //div[@class='SideBar__Root-sc-18bme9p-0 ctRRBS']/div/h4[text()="category_name"]
${dynamic_findmore}  //div[@data-view-label="desired_category"]/a[@class='toggler']
${dynamic_brand_list}  //div[@data-view-label='Thương hiệu']/div/label//div/span[contains(text(),"desired_brand")]
${dynamic_color_list}  //div[@data-view-label='Màu sắc']/div/label//div/span[text()="desired_color"]
${dynamic_size_list}    //div[@data-view-label='Kích cỡ']/div/label//div/span[text()="desired_size"]
${last_item}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]
${last_item_name_plp}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]//h3
${last_item_name_pdp}  //div[@class='styles__StyledProductContent-sc-1f8f774-0 ewqXRk']//h1
*** Test Cases ***
TC1
  Open Browser  https://tiki.vn  Chrome
  Maximize Browser Window
  ${locator}  String.Replace String  ${dynamic_xpath}  name  Giá Rẻ Mỗi Ngày
  Click Element  locator=${locator}
  Click Element    ${tiki_logo}
  Wait Until Element Is Visible  ${locator_danhmuc}
  @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${locator_danhmuc}
  ${list_danhmuc}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list_danhmuc}
    ${danhmuc}  SeleniumLibrary.Get Text    locator=${index}
    Append To List  ${list_danhmuc}  ${danhmuc}  
  END
  List Should Contain Value    ${list_danhmuc}    Giày - Dép nữ
  ${locator_giaydepnu}  String.Replace String  ${dynamic_xpath}  name  Giày - Dép nữ
  SeleniumLibrary.Scroll Element Into View  ${locator_giaydepnu}
  SeleniumLibrary.Click Element  ${locator_giaydepnu}  
  Sleep  5s
  ${title}=  SeleniumLibrary.Get Title
  BuiltIn.Should Contain  ${title}  Giày - Dép nữ chính hãng, giá tốt Tháng 7, 2023 | Tiki
  ${locator_brand_text}  String.Replace String  ${dynamic_category_text}  category_name  Thương hiệu
  Wait Until Element Is Visible  ${locator_brand_text}
  Scroll Element Into View  ${locator_brand_text}
  ${locator_brand_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Thương hiệu
  Click Element  ${locator_brand_findmore}
  Sleep  5s
  ${locator_desired_brand}  String.Replace String  ${dynamic_brand_list}  desired_brand  Biti
  Wait Until Element Is Visible    ${locator_desired_brand}
  Click Element  ${locator_desired_brand}
  sleep  5s
  ${locator_color_text}  String.Replace String  ${dynamic_category_text}  category_name  Màu sắc
  Wait Until Element Is Visible  ${locator_color_text}
  Scroll Element Into View  ${locator_color_text}
  ${locator_color_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Màu sắc
  Click Element  ${locator_color_findmore}
  Sleep  5s
  ${locator_desired_color}  String.Replace String   ${dynamic_color_list}   desired_color  Bạc
  Wait Until Element Is Visible  ${locator_desired_color}
  Scroll Element Into View  ${locator_desired_color}
  Click Element  ${locator_desired_color}
  sleep  5s
  ${locator_size_text}  String.Replace String  ${dynamic_category_text}  category_name  Kích cỡ
  Wait Until Element Is Visible  ${locator_size_text}
  Scroll Element Into View  ${locator_size_text}
  ${locator_size_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Kích cỡ
  Click Element  ${locator_size_findmore}
  Sleep  5s
  ${locator_desired_size}  String.Replace String   ${dynamic_size_list}   desired_size  36
  Wait Until Element Is Visible  ${locator_desired_size}
  Scroll Element Into View  ${locator_desired_size}
  Click Element  ${locator_desired_size}
  Sleep  3s
  ${get_text_last_item_plp}  Get Text    ${last_item_name_plp}
  Click Element    ${last_item}
  Sleep  3s
  Element Text Should Be  ${last_item_name_pdp}  ${get_text_last_item_plp}
  Sleep  5s