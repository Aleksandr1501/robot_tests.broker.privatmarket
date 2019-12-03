*** Settings ***
Library  String
Library  DateTime
Library  Selenium2Library
Library  Collections
Library  DebugLibrary
Library  privatmarket_service.py
Library  op_robot_tests.tests_files.service_keywords


*** Variables ***
${COMMONWAIT}  60s
${locator_tenderSearch.searchInput}  css=input#search-query-input
${locator_tender.switchToDemo}  css=a#test-model-switch
${locator_tender.switchToDemoMessage}  css=.test-mode-popup-content.ng-binding
${locator_tenderSearch.addTender}  css=button[data-id='createNewTenderBtn']
${locator_lotAdd.postalCode}  css=input[data-id='postalCode']
${locator_lotAdd.countryName}  css=input[data-id='countryName']
${locator_lotAdd.region}  css=input[data-id='region']
${locator_lotAdd.locality}  css=input[data-id='locality']
${locator_lotAdd.streetAddress}  css=input[data-id='streetAddress']
${locator_tenderAdd.btnSave}  css=button[data-id='actSave']
${locator_tenderCreation.buttonSend}  css=button[data-id='actSend']
${locator_tenderClaim.buttonCreate}  css=button[data-id='editProcBtn']

${tender_data_title}  css=.tender-or-plan-title
${tender_data_description}  css=#tenderDescription
${tender_data_procurementMethodType}  css=#tenderType
${tender_data_status}  css=#tenderStatus
${tender_data_value.amount}  css=#tenderBudget
${tender_data_value.currency}  css=#tenderBudgetCcy
${tender_data_value.valueAddedTaxIncluded}  css=#tenderBudgetTax
${tender_data_tenderID}  css=#tenderId
${tender_data_procuringEntity.name}  css=[ng-click*='commonActions.openCard']
${tender_data_enquiryPeriod.startDate}  id=active.enquiries-bd
${tender_data_enquiryPeriod.endDate}  id=active.enquiries-ed
${tender_data_tenderPeriod.startDate}  id=active.tendering-bd
${tender_data_tenderPeriod.endDate}  id=active.tendering-ed
${tender_data_auctionPeriod.startDate}  xpath=//span[@id='active.auction-bd']
${tender_data_auctionPeriod.endDate}  xpath=//span[@id='active.auction-ed']
${tender_data_minimalStep.amount}  css=div#lotMinStepAmount
${tender_data_documentation.title}  xpath=//div[contains(@class, 'doc-file-title')]
${tender_data_documents[0].title}  xpath=//div[contains(@class, 'doc-file-title')]
${tender_data_qualificationPeriod.endDate}  id=active.pre-qualification-ed
${tender_data_causeDescription}  css=#tenderType div.question-div>div:nth-of-type(1)
${tender_data_cause}  css=#tenderType>.action-element

${tender_data_tender.procurementMethodType}  css=span[data-id='tender-type']
${tender_data_budget.amount}  css=#tenderBudget
${tender_data_budget.description}  css=div[data-id='lot-description']

${tender_data_item.description}  //div[@class='description']//span)
${tender_data_item.deliveryDate.startDate}  //div[@ng-if='adb.deliveryDate.startDate']/div[2])
${tender_data_item.deliveryDate.endDate}  //div[@ng-if='adb.deliveryDate.endDate']/div[2])
${tender_data_item.deliveryLocation.latitude}  //span[contains(@class, 'latitude')])
${tender_data_item.deliveryLocation.longitude}  //span[contains(@class, 'longitude')])
${tender_data_item.deliveryAddress.countryName}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.countryName_ru}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.countryName_en}  //span[@id='countryName'])
${tender_data_item.deliveryAddress.postalCode}  //span[@id='postalCode'])
${tender_data_item.deliveryAddress.region}  //span[@id='region'])
${tender_data_item.deliveryAddress.locality}  //span[@id='locality'])
${tender_data_item.deliveryAddress.streetAddress}  //span[@id='streetAddress'])
${tender_data_item.classification.scheme}  //span[contains(@class, 'cl-scheme')])[1]
${tender_data_item.classification.id}  //span[contains(@class, 'cl-id')])[1]
${tender_data_item.classification.description}  //span[contains(@class, 'cl-name')])[1]
${tender_data_item.additionalClassifications[0].scheme}  //span[contains(@class, 'cl-scheme')])[2]
${tender_data_item.additionalClassifications[0].id}  //span[contains(@class, 'cl-id')])[2]
${tender_data_item.additionalClassifications[0].description}  //span[contains(@class, 'cl-name')])[2]
${tender_data_item.unit.name}  //div[@ng-if='adb.quantity']/div[2]/span[2])
${tender_data_item.unit.code}  //div[@ng-if='adb.quantity']/div[2]/span[2])
${tender_data_item.quantity}  //div[@ng-if='adb.quantity']/div[2]/span)
${tender_data_items[0].deliveryDate.endDate}  xpath=//div[@data-id='deliveryDate.endDate']
${tender_data_items[0].deliveryDate.startDate}  xpath=//div[@data-id='deliveryDate.startDate']
${tender_data_items[0].description}  xpath=//div[@class='description']
${tender_data_items[0].quantity}  xpath=(//div[@ng-if='adb.quantity']/div[2]/span)[1]
${tender_data_lots[0].value.amount}  xpath=//div[@id='lotAmount']
${tender_data_lots[0].minimalStep.amount}  xpath=//div[@id='lotMinStepAmount']

${tender_data_lot.title}  //div[@id='lot-title'])
${tender_data_lot.description}  //section[contains(@class, 'description marged')])
${tender_data_lot.value.amount}  //div[@id='lotAmount'])
${tender_data_lot.value.currency}  //div[@id='lotCcy'])
${tender_data_lot.value.valueAddedTaxIncluded}  //div[@id='lotTax'])
${tender_data_lot.minimalStep.amount}  //div[@id='lotMinStepAmount'])
${tender_data_lot.minimalStep.currency}  //div[@id='lotMinStepCcy'])
${tender_data_lot.minimalStep.valueAddedTaxIncluded}  //div[@id='lotMinStepTax'])

${tender_data_question.title}  //span[contains(@class, 'question-title')])
${tender_data_question.description}  //div[@class='question-div']/div[1])
${tender_data_question.answer}  //div[@data-id='tender-question-answer']//div[@class='question-div']/div[1])
${tender_data_lot_question.title}  //span[contains(@class, 'question-title')]
${tender_data_lot_question.description}  //div[@class='question-div']/div[1]
${tender_data_lot_question.answer}  //div[@data-id='lot-question-answer']//div[@class='question-div']/div[1]
${tender_data_lot_question.questions[0].title}  //span[contains(@class, 'question-title')]
${tender_data_lot_question.questions[0].description}  (//div[@class='question-div']/div[1])[1]
${tender_data_lot_question.questions[0].answer}  (//div[@class='question-div']/div[1])[2]
${tender_data_lot_question.questions[2].answer}  //div[@data-id='lot-question-answer']//div[@class='question-div']/div[1]
${tender_data_lot_question.questions[1].answer}  //div[@data-id='lot-question-answer']//div[contains(@class,'question-div')]/div[1]

${tender_data_feature.featureOf}  /../../../*[1]
${tender_data_features[0].featureOf}  xpath=(//div[contains(@class, 'feature name')]/../../../*[1])[1]
${tender_data_features[1].featureOf}  xpath=(//div[contains(@class, 'feature name')]/../../../*[1])[2]

${tender_data_features[0].description}  //div[@data-id='feature.description']
${tender_data_features[1].description}  xpath=(//div[@data-id='feature.description'])[2]

${tender_data_complaint.complaintID}  //span[@data-id='complaint-id']
${tender_data_complaint.status}  //span[contains(@id, 'cmplStatus')]
${tender_data_complaint.resolutionType}  //div[contains(@ng-if,"resolutionType")]
${tender_data_complaint.resolution}  //div[@class="question-answer title ng-scope"]//div[@class="question-div"]/div[1]
${tender_data_complaint.satisfied}  //span[contains(@data-id, 'satisfied') and contains(text(),'так')]
${tender_data_complaint.cancellationReason}  //*[@description='q.cancellationReason']/div/div[1]
${tender_data_complaint.title}  //span[contains(@class, 'claimHead')]
${tender_data_complaint.description}  //*[@description='q.description']//div[@class='question-div']/div[1]
${tender_data_complaintPeriod.endDate}  css=#cmplPeriodEnd

${tender_data_procuringEntity.address.countryName}  css=.delivery-info-container [data-id='address.countryName']
${tender_data_procuringEntity.address.locality}  css=.delivery-info-container [data-id='address.locality']
${tender_data_procuringEntity.address.postalCode}  css=.delivery-info-container [data-id='address.postalCode']
${tender_data_procuringEntity.address.region}  css=.delivery-info-container [data-id='address.region']
${tender_data_procuringEntity.address.streetAddress}  css=.delivery-info-container [data-id='address.streetAddress']
${tender_data_procuringEntity.contactPoint.name}  css=[data-id='contactPoint.name']
${tender_data_procuringEntity.contactPoint.telephone}  css=[data-id='contactPoint.telephone']
${tender_data_procuringEntity.contactPoint.url}  css=[data-id='contactPoint.url']
${tender_data_procuringEntity.identifier.legalName}  css=[data-id='identifier.legalName']
${tender_data_procuringEntity.identifier.scheme}  css=[data-id='identifier.scheme']
${tender_data_procuringEntity.identifier.id}  css=[data-id='identifier.id']

${tender_data_awards[0].documents[0].title}  css=.participant-info-block .doc-file-title
${tender_data_awards[0].status}  xpath=//div[@data-id='status']
${tender_data_awards[0].suppliers[0].address.countryName}  css=.participant-info-block [data-id='address.countryName']
${tender_data_awards[0].suppliers[0].address.locality}  css=.participant-info-block [data-id='address.locality']
${tender_data_awards[0].suppliers[0].address.postalCode}  css=.participant-info-block [data-id='address.postalCode']
${tender_data_awards[0].suppliers[0].address.region}  css=.participant-info-block [data-id='address.region']
${tender_data_awards[0].suppliers[0].address.streetAddress}  css=.participant-info-block [data-id='address.streetAddress']
${tender_data_awards[0].suppliers[0].contactPoint.telephone}  css=.participant-info-block [data-id='contactPoint.telephone']
${tender_data_awards[0].suppliers[0].contactPoint.name}  css=.participant-info-block [data-id='contactPoint.name']
${tender_data_awards[0].suppliers[0].contactPoint.email}  css=.participant-info-block [data-id='contactPoint.email']
${tender_data_awards[0].suppliers[0].identifier.scheme}  css=.participant-info-block [data-id='identifier.scheme']
${tender_data_awards[0].suppliers[0].identifier.legalName}  css=.participant-info-block [data-id='identifier.legalName']
${tender_data_awards[0].suppliers[0].identifier.id}  css=.participant-info-block [data-id='identifier.id']
${tender_data_awards[0].suppliers[0].name}  css=.participant-info-block [data-id='identifier.legalName']
${tender_data_awards[0].value.valueAddedTaxIncluded}  css=.participant-info-block [data-id='value.valueAddedTaxIncluded']
${tender_data_awards[0].value.currency}  css=.participant-info-block [data-id='value.currency']
${tender_data_awards[0].value.amount}  css=.participant-info-block [data-id='value.amount']
${tender_data_awards[1].value.amount}  css=.participant-info-block [data-id='value.amount']
${tender_data_contracts[0].value.amount}  css=#contractAmount
${tender_data_contracts[1].value.amount}  css=#contractAmount
${tender_data_contracts[0].value.amountNet}  xpath=//*[@id='contractAmount']/../../following-sibling::dl/dd
${tender_data_contracts[1].value.amountNet}  xpath=//*[@id='contractAmount']/../../following-sibling::dl/dd
${tender_data_contracts[0].status}  xpath=//span[@id='contractStatus']
${tender_data_contracts[1].status}  xpath=//span[@id='contractStatus']
${tender_data_contracts[1].dateSigned}  xpath=//div[contains(@class,'contracts info')]//*[text()='Договiр №:']/following-sibling::*/span
${tender_data_contracts[1].period.startDate}  xpath=//div[contains(@class,'contracts info')]//*[text()='Дата початку:']/following-sibling::*/span
${tender_data_contracts[1].period.endDate}  xpath=//div[contains(@class,'contracts info')]//*[text()='Дата кiнця:']/following-sibling::*/span
${tender_data_contracts[0].dateSigned}  xpath=//div[contains(@class,'contracts info')]//*[text()='Договiр №:']/following-sibling::*/span
${tender_data_contracts[0].period.startDate}  xpath=//div[contains(@class,'contracts info')]//*[text()='Дата початку:']/following-sibling::*/span
${tender_data_contracts[0].period.endDate}  xpath=//div[contains(@class,'contracts info')]//*[text()='Дата кiнця:']/following-sibling::*/span
${tender_data_features[0].title}  css=div.no-price span[data-id='feature.title']
${tender_data_features[1].title}  xpath=(//div[contains(@class, 'no-price')]//span[@data-id='feature.title'])[2]

${tender_data_funders[0].name}  xpath=//span[@data-id='founder-name']
${tender_data_funders[0].address.countryName}  xpath=//div[@data-id='funders-block']//span[@data-id='address.countryName']
${tender_data_funders[0].address.locality}  xpath=//div[@data-id='funders-block']//span[@data-id='address.locality']
${tender_data_funders[0].address.postalCode}  xpath=//div[@data-id='funders-block']//span[@data-id='address.postalCode']
${tender_data_funders[0].address.region}  xpath=//div[@data-id='funders-block']//span[@data-id='address.region']
${tender_data_funders[0].address.streetAddress}  xpath=//div[@data-id='funders-block']//span[@data-id='address.streetAddress']
${tender_data_funders[0].contactPoint.url}  xpath=//span[@data-id='founder-contact-point-url']
${tender_data_funders[0].identifier.id}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-id']
${tender_data_funders[0].identifier.legalName}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-legalName']
${tender_data_funders[0].identifier.scheme}  xpath=//div[@data-id='funders-block']//td[@data-id='funder-identifier-scheme']

${tender_data_lots[0].auctionPeriod.startDate}  id=active.auction-bd
${tender_data_lots[0].auctionPeriod.endDate}  id=active.auction-ed
${tender_data_tender.tenderPeriod.startDate}  xpath=//div[@data-id='plan-purchase-beg']

${tender_data_classification.description}  xpath=//*[@data-id='item-classif-description']  # //*[@data-id='common-classif-description']
${tender_data_classification.scheme}  xpath=//*[@data-id='item-classif-scheme']  # //*[@data-id='common-classif-scheme']
${tender_data_classification.id}  xpath=//*[@data-id='item-classif-id']  # //*[@data-id='common-classif-id']

${tender_data_agreementDuration}  xpath=//div[@class='agreement-duration']
${tender_data_maxAwardsCount}  xpath=//div[@data-id='maxAwardsCount']
${tender_data_mainProcurementCategory}  xpath=//div[contains(text(),'Вид предмету закупівлі')]/following-sibling::div

${tender_data_minimalStepPercentage}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[1]
${tender_data_NBUdiscountRate}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[2]
${tender_data_yearlyPaymentsPercentageRange}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[3]
${tender_data_fundingKind}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[4]

${tender_data_lots[0].minimalStepPercentage}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[1]
${tender_data_lots[0].fundingKind}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[4]
${tender_data_lots[0].yearlyPaymentsPercentageRange}  xpath=(//div[@ng-include='page.financialItems']//following-sibling::div[contains(@class,'descript')])[3]

${tender_data_milestones[0].code}  xpath=//milestone[1]//div[contains(text(),'Тип оплати')]//following-sibling::div
${tender_data_milestones[0].title}  xpath=//milestone[1]//div[contains(text(),'Подія')]//following-sibling::div
${tender_data_milestones[0].percentage}  xpath=//milestone[1]//div[contains(text(),'Розмір платежу')]//following-sibling::div
${tender_data_milestones[0].duration.days}  xpath=//milestone[1]//div[contains(text(),'Період оплати')]//following-sibling::div
${tender_data_milestones[0].duration.type}  xpath=//milestone[1]//div[contains(text(),'Тип днів')]//following-sibling::div

${tender_data_milestones[1].code}  xpath=//milestone[2]//div[contains(text(),'Тип оплати')]//following-sibling::div
${tender_data_milestones[1].title}  xpath=//milestone[2]//div[contains(text(),'Подія')]//following-sibling::div
${tender_data_milestones[1].percentage}  xpath=//milestone[2]//div[contains(text(),'Розмір платежу')]//following-sibling::div
${tender_data_milestones[1].duration.days}  xpath=//milestone[2]//div[contains(text(),'Період оплати')]//following-sibling::div
${tender_data_milestones[1].duration.type}  xpath=//milestone[2]//div[contains(text(),'Тип днів')]//following-sibling::div

${tender_data_milestones[2].code}  xpath=//milestone[3]//div[contains(text(),'Тип оплати')]//following-sibling::div
${tender_data_milestones[2].title}  xpath=//milestone[3]//div[contains(text(),'Подія')]//following-sibling::div
${tender_data_milestones[2].percentage}  xpath=//milestone[3]//div[contains(text(),'Розмір платежу')]//following-sibling::div
${tender_data_milestones[2].duration.days}  xpath=//milestone[3]//div[contains(text(),'Період оплати')]//following-sibling::div
${tender_data_milestones[2].duration.type}  xpath=//milestone[3]//div[contains(text(),'Тип днів')]//following-sibling::div

${contract_data_changes[0].rationale}  xpath=//div[contains(@class,'change-info')]//div[6]/div[2]
${contract_data_terminationDetails}  xpath=//div[text()='Причини розiрвання:']/following-sibling::div/span
${contract_data_rationale}  //div[contains(@class,'change-info')]//span[contains(@ng-repeat,'rationaleTypes')]/span[1]
${contract_data_title}  xpath=//dt[text()='Назва договору:']/following-sibling::dd
${contract_data_description}  xpath=//*[@data-id='contractDescription']
${contract_data_amountPaid.amount}  xpath=//div[contains(@ng-repeat,'currentContr.pays')]/div[2]
${contract_data_period.startDate}  xpath=//dt[text()='Дата початку:']/following-sibling::dd/span
${contract_data_period.endDate}  xpath=//dt[text()='Дата кiнця:']/following-sibling::dd/span

${tender_data_agreements[0].agreementID}  xpath=//div[@parent-agreement-id] | //*[@data-id="agreement-id"]


*** Keywords ***
Підготувати дані для оголошення тендера
    [Arguments]  ${username}  ${tender_data}  ${role_name}
    ${tender_data.data}=  privatmarket_service.modify_test_data  ${tender_data.data}
    ${adapted.data}=  privatmarket_service.modify_test_data  ${tender_data.data}
    [Return]  ${tender_data}


Підготувати клієнт для користувача
    [Arguments]  ${username}
    [Documentation]  Відкрити брaвзер, створити обєкт api wrapper, тощо
    ${service args}=  Create List  --ignore-ssl-errors=true  --ssl-protocol=tlsv1
    ${browser}=  Convert To Lowercase  ${USERS.users['${username}'].browser}
    ${disabled}  Create List  Chrome PDF Viewer
    ${prefs}  Create Dictionary  download.default_directory=${OUTPUT_DIR}  plugins.plugins_disabled=${disabled}
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method  ${chrome_options}  add_argument  --allow-running-insecure-content
    Call Method  ${chrome_options}  add_argument  --disable-web-security
    Call Method  ${chrome_options}  add_argument  --nativeEvents\=false
    Call Method  ${chrome_options}  add_experimental_option  prefs  ${prefs}
    #Для Viewer'а нужен хром, т.к. на хром настроена автоматическая закачка файлов

    ${alias}=   Catenate   SEPARATOR=   browser  ${username}
    Set Global Variable  ${ALIAS_NAME}  ${alias}
    Create WebDriver  Chrome  chrome_options=${chrome_options}  alias=${ALIAS_NAME}
    Go To  ${USERS.users['${username}'].homepage}

    #Open Browser  ${USERS.users['${username}'].homepage}  ${browser}  alias=${username}
    Set Window Size  @{USERS.users['${username}'].size}
    Set Selenium Implicit Wait  10s
    Run Keyword Unless  '${username}' == 'PrivatMarket_Viewer'  Login  ${username}


Пошук тендера по ідентифікатору
    [Arguments]  ${username}  ${tenderId}  ${second_stage_data}=${Empty}
    Go To  ${USERS.users['${username}'].homepage}
    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}

    Check Current Mode New Realisation

    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    ${tender_id2}=  Remove String Using Regexp  ${tender_id}  \\.\\d$
    ${tender_id}=  Set Variable If  'тендер другого етапу' in '${TEST_NAME}' or 'на другому етапі' in '${TEST_NAME}'  ${tender_id2}  ${tender_id}

    Wait For Tender  ${tenderId}  ${education_type}
    Wait Visibility And Click Element  xpath=//a[@id='${tenderId}']
    Sleep  5s
#    Run Keyword If  'тендер другого етапу' in '${TEST_NAME}' or 'на другому етапі' in '${TEST_NAME}'
#    ...  Wait Visibility And Click Element  xpath=//a[@ng-click='act.move2NextStage()']
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}
    Log To Console  ${tenderId}


Пошук договору по ідентифікатору
    [Arguments]  ${username}  ${contract_uaid}
    ${tenderId}=  Remove String Using Regexp  ${contract_uaid}  -\\w+\\d$
    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tenderId}
    Відкрити детальну інформацію про контракт
    Page Should Contain  ${contract_uaid}


Пошук угоди по ідентифікатору
    [Arguments]  ${username}  ${agreement_uaid}
    ${agreementId}=  Remove String Using Regexp  ${agreement_uaid}  -\\w+\\d$
    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${agreementId}
    Відкрити детальну інформацію про рамкові угоди
    Page Should Contain  ${agreement_uaid}


Пошук плану по ідентифікатору
  [Arguments]  ${username}  ${tenderId}
    Go To  ${USERS.users['${username}'].homepage}
    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}

    Check Current Mode New Realisation

    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    ${type}=  Set Variable  plan
    Wait For Tender  ${tenderId}  ${education_type}  ${type}

    Wait Visibility And Click Element  xpath=//a[@id='${tenderId}']
    Sleep  5s
    Wait Until Element Is Visible  ${tender_data_tenderID}  ${COMMONWAIT}


Оновити сторінку з планом
    [Arguments]  ${username}  ${tenderId}
    Switch Browser  ${ALIAS_NAME}
    Reload Page
    Sleep  2s


Пошук тендера за кошти донора
     [Arguments]  ${username}  ${funder_id}
    ${tenderId}=  Get text  ${tender_data_tenderID}
    Go To  ${USERS.users['${username}'].homepage}

    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  timeout=${COMMONWAIT}
    ${suite_name}=  Convert To Lowercase  ${SUITE_NAME}
    ${education_type}=  Run Keyword If  'negotiation' in '${suite_name}'  Set Variable  False
    ...  ELSE  Set Variable  True

    Wait For Tender  ${tenderId}  ${education_type}
    Run Keyword If  ${funder_id} == '44000'  Wait Visibility And Click Element  xpath=//select[@ng-model='template.funder']/option[contains(., 'Світовий Банк')]
    Sleep  5s
    Wait Visibility And Click Element  xpath=//div[@id='${tenderId}']
    Sleep  5s
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}


Створити план
    [Arguments]  ${username}  ${tender_data}

    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  lots
    @{lots}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  lots
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  items
    @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  features
    @{features}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  features
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data.budget}  breakdown
    @{breakdowns}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data.budget}  breakdown

    Check Current Mode New Realisation
    Wait Visibility And Click Element  ${locator_tenderSearch.addTender}
    Wait Visibility And Click Element  xpath=(//a[@data-toggle='tab'])[2]

    Run Keyword If
    ...  '${MODE}' == 'reporting'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanReporting']
    ...  ELSE IF  '${MODE}' == 'closeFrameworkAgreementUA'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanCloseFrameworkAgreementUA']
    ...  ELSE IF  '${MODE}' == 'esco'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanEsco']
    ...  ELSE IF  '${MODE}' == 'negotiation'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanNegotiation']
    ...  ELSE IF  '${MODE}' == 'negotiation.quick'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanNegotiationQuick']
    ...  ELSE IF  '${MODE}' == 'aboveThresholdUA'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanAboveThresholdUA']
    ...  ELSE IF  '${MODE}' == 'aboveThresholdEU'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanAboveThresholdEU']
    ...  ELSE IF  '${MODE}' == 'aboveThresholdUA.defense'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanAboveThresholdUADefense']
    ...  ELSE IF  '${MODE}' == 'competitiveDialogueUA'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanCompetitiveDialogueUA']
    ...  ELSE IF  '${MODE}' == 'competitiveDialogueEU'  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanCompetitiveDialogueEU']
    ...  ELSE  Wait Visibility And Click Element  xpath=//a[@data-id='choosedPrzPlanBelowThreshold']

    Input Text  xpath=//input[@data-id='procurementName']  ${tender_data.data.budget.description}
    Input Text  xpath=//textarea[@data-id='procurementDescription']  ${tender_data.data.budget.description}
    Click Element  xpath=(//a[@data-id='actChoose'])[1]

    Search By Query  css=input[data-id='query']  ${tender_data.data.classification.id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Set Date  tenderPeriod  startDate  ${tender_data.data.tender.tenderPeriod.startDate}

    ${amount}=  convert_float_to_string  ${tender_data.data.budget.amount}

    Run Keyword Unless  '${MODE}' == 'esco'  Input Text  xpath=//input[@data-id='valueAmount']  ${amount}

    ${breakdowns_count}=  Get Length  ${breakdowns}

    : FOR  ${index}  IN RANGE  0  ${breakdowns_count}
    \  ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  ${breakdown_type}=  Run Keyword  privatmarket_service.get_budgetBreakdown  ${breakdowns[${index}].title}
    \  log many  ${breakdowns[${index}].value.amount}  ${breakdowns[${index}].value}
    \  log many  ${tender_data.data.budget.breakdown[${index}].value.amount}  ${tender_data.data.budget.breakdown[${index}].value}
    \  ${amount}=  privatmarket_service.convert_float_to_string  ${breakdowns[${index}].value.amount}
    \  Wait Visibility And Click Element  xpath=//button[@data-id='actAddBreakdown']
    \  Wait Element Visibility And Input Text  xpath=(//section[@data-id='breakdowns']//input[@data-id='valueAmount'])[${${index_xpath}}]  ${amount}
    \  Wait Element Visibility And Input Text  xpath=(//*[@data-id='breakdownDescription'])[${index_xpath}]  ${breakdowns[${index}].description}
    \  Wait Visibility And Click Element  xpath=(//budget-breakdown//button)[${index_xpath}]
    \  Wait Visibility And Click Element  xpath=(//div[contains(@class,'procuring-entity-select')])[${index_xpath}]//li[text()='${breakdown_type}']

    Click Element  xpath=//button[@data-id='actSave']

    Wait Visibility And Click Element  xpath=//label[@for='plan_items_yes']

    ${status}  ${type}=  Run Keyword And Ignore Error  Set Variable  '${tender_data.data.tender.procurementMethodType}'
    ${type}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${type}
    ...  ELSE  Set Variable  ''

    #Заповнити лоти та предмети закупівлі
    Додати предмети закупівлі в план  ${items}  ${type}

    Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Sleep  30s
    Reload Page
    Wait Visibility And Click Element  css=div#noEcp
    Run Keyword  Завантажити ЕЦП
    Sleep  45s
    Reload Page
    Page Should Contain Element  xpath=//span[@id='tenderId']
    ${plan_id}  Get Text  xpath=//span[@id='tenderId']
    [Return]  ${plan_id}


Дочекатися зміни статусу
     [Arguments]  ${date}
     Wait Until Keyword Succeeds  10min  1s  Перевірити зміну статусу  xpath=//span[@id='tenderId'][contains(text(),'${date}')]


Перевірити зміну статусу
     [Arguments]  ${locator}
     Reload Page
     Sleep  2s
     Wait Until Element Is Enabled  ${locator}


Додати предмети закупівлі в план
    [Arguments]  ${items}  ${type}
    ${items_count}=  Get Length  ${items}
    Wait For Ajax

    ${item_block_count}=  Get Matching Xpath Count  xpath=//div[@data-id='item']
    : FOR  ${index}  IN RANGE  ${item_block_count}  ${items_count}
    \  Click Element  xpath=//button[@data-id='actAddItem']

    : FOR  ${index}  IN RANGE  0  ${items_count}
    \  ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Visibility And Click Element  xpath=(//div[@data-id='basicClassification'])[${index_xpath}]//a
    \  Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    \  Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    \  Search By Query  css=input[data-id='query']  ${items[${index}].classification.id}
    \  Wait Visibility And Click Element  css=button[data-id='actConfirm']
    \  ${classif_xpath}=  Set Variable  xpath=(//div[@data-id='mozAtcClassification'])[${index_xpath}]//a[@data-id='actChoose']
    \  ${classif_id}=  Set Variable If  '336' in '${items[${index}].classification.id}'  ${items[${index}].additionalClassifications[1].id}
    \  Run Keyword If  '336' in '${items[${index}].classification.id}'
    \  ...  Run Keywords
    \  ...  Wait Visibility And Click Element  ${classif_xpath}
    \  ...  AND  Wait Element Visibility And Input Text  xpath=//input[@data-id='query']  ${classif_id}
    \  ...  AND  Wait Visibility And Click Element  xpath=//div[@data-id='foundItem']//label[contains(text(),'${classif_id}')]
    \  ...  AND  Wait Visibility And Click Element  xpath=//button[@data-id='actConfirm']
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='description'])[${index_xpath}]  ${items[${index}].description}
    \  ${mainProcurementCategory}=  Run Keyword If  'створити звіт' in '${TEST_NAME}'  privatmarket_service.get_mainProcurementCategory  ${TENDER_DATA.data.mainProcurementCategory}
    \  Run Keyword If  'створити звіт' in '${TEST_NAME}'
    \  ...  Run Keywords
    \  ...  Wait Visibility And Click Element  xpath=(//div[@data-id='item']//span[contains(text(), '${mainProcurementCategory}')])[${index_xpath}]/preceding-sibling::input[1]
    \  ...  AND  Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//button[@data-id='modalOkBtn']
    \  ${item_quantity}=  Convert To String  ${items[${index}].quantity}
    \  Run Keyword Unless  '${MODE}' == 'esco'  Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${item_quantity}
    \  Run Keyword Unless  '${MODE}' == 'esco'  Select From List By Label  xpath=(//select[@data-id='unit'])[${index_xpath}]  ${items[${index}].unit.name}
    \  Run Keyword If  'створити звіт' in '${TEST_NAME}'
    \  ...  Run Keywords
    \  ...  Wait Visibility And Click Element  xpath=(//span[contains(text(), 'точна адреса')])[${index_xpath}]//preceding-sibling::input
    \  ...  AND  Wait Element Visibility And Input Text  xpath=(//input[@data-id='postalCode'])[${index_xpath}]  ${items[${index}].deliveryAddress.postalCode}
    \  ...  AND  Wait Element Visibility And Input Text  xpath=(//input[@data-id='countryName'])[${index_xpath}]  ${items[${index}].deliveryAddress.countryName}
    \  ...  AND  Wait Element Visibility And Input Text  xpath=(//input[@data-id='region'])[${index_xpath}]  ${items[${index}].deliveryAddress.region}
    \  ...  AND  Wait Element Visibility And Input Text  xpath=(//input[@data-id='locality'])[${index_xpath}]  ${items[${index}].deliveryAddress.locality}
    \  ...  AND  Wait Element Visibility And Input Text  xpath=(//input[@data-id='streetAddress'])[${index_xpath}]  ${items[${index}].deliveryAddress.streetAddress}
    \  Set Date In Item  ${index}  deliveryDate  endDate  ${items[${index}].deliveryDate.endDate}


Вказати вид предмету закупівлі
    [Arguments]  ${value}  ${index_xpath}  ${lot_index}
    ${type}=  Run Keyword  privatmarket_service.get_mainProcurementCategory  ${TENDER_DATA.data.mainProcurementCategory}
    Wait Visibility And Click Element  xpath=((//div[@data-id='lot'])[${lot_index}]//span[contains(text(), '${type}')])[${index_xpath}]/preceding-sibling::input[1]
    Run Keyword And Ignore Error  Click Element  xpath=//button[@data-id='modalOkBtn']


Внести зміни в план
    [Arguments]  ${user_name}  ${tenderId}  ${parameter}  ${value}
    Дочекатися зміни статусу  ${tenderId}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]

    ${index}=  privatmarket_service.get_match_from_string  ${parameter}  items\\[(.+?)\\]  1
    ${status}=  Set Variable If  '${index}' == 'null'  'false'  'true'
    Run Keyword And Return If  ${status} == 'true'  Внести зміни в план item  ${index}  ${parameter}  ${value}
    Run Keyword If  '${parameter}' == 'budget.description'  Input Text  xpath=//input[@data-id='procurementName']  ${value}

    ${amount}=  Run Keyword If  '${parameter}' == 'budget.amount'  convert_float_to_string  ${value}
    Run Keyword If  '${parameter}' == 'budget.amount'  Input Text  xpath=//input[@data-id='valueAmount']  ${amount}

    ${budget.startDate}=  Run Keyword If  '${parameter}' == 'budget.period'  Get From Dictionary  ${value}  startDate
    ${budget.endDate}=  Run Keyword If  '${parameter}' == 'budget.period'  Get From Dictionary  ${value}  endDate

    Run Keyword If  '${parameter}' == 'budget.period'
    ...  Run Keywords
    ...  Execute JavaScript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.budget.period = {}; s.$root.$apply();
    ...  AND  Set Date  budget.period  startDate  ${budget.startDate}
    ...  AND  Set Date  budget.period  endDate  ${budget.endDate}

    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//input[@data-id='description'])
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Sleep  45s
    Reload Page
    Wait Visibility And Click Element  css=div.expired-ecp-label
#    Wait Visibility And Click Element  css=button.c-card-eds-sign-btn
#    Wait Visibility And Click Element  css=button#checkBidSignBtn
    Run Keyword  Завантажити ЕЦП
    Sleep  45s
    Reload Page


Внести зміни в план item
    [Arguments]  ${index}  ${parameter}  ${value}
    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Sleep  2s
    ${date}=  Run Keyword If  'deliveryDate.endDate' in '${parameter}'  privatmarket_service.change_fake_date
    ${quantity}=  Run Keyword If  'quantity' in '${parameter}'  Convert To String  ${value}
    ${value}=  Set Variable If
        ...  'deliveryDate.endDate' in '${parameter}'  ${date}
        ...  'quantity' in '${parameter}'  ${quantity}
        ...  ${value}
    Run Keyword If  '${parameter}' == 'items[${index}].deliveryDate.endDate'
    ...  Run Keywords
    ...  Wait Until Element Is Visible  xpath=(//input[@data-id='deliveryDateEnd'])[${index_xpath}]
    ...  AND  Set Date In Item  ${index}  deliveryDate  endDate  ${value}
    Run Keyword If  '${parameter}' == 'items[${index}].quantity'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${value}
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Sleep  45s
    Reload Page
    Wait Visibility And Click Element  css=div.expired-ecp-label
#    Wait Visibility And Click Element  css=button.c-card-eds-sign-btn
#    Wait Visibility And Click Element  css=button#checkBidSignBtn
    Run Keyword  Завантажити ЕЦП
    Sleep  45s
    Reload Page


Додати предмет закупівлі в лот
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${lot_id}  ${item}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tender_uaid}
    Reload Page
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    ${type}=  Отримати інформацію з procurementMethodType
    ${type}=  Set Variable  '${type}'
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Sleep  5s
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${tender_owner}
    Wait Visibility And Click Element  css=#tab_1 a
    ${lot_count}=  Get Matching Xpath Count  xpath=//div[@data-id='lot']/div/a
    Run Keyword If  ${lot_count}>1  Wait Visibility And Click Element  xpath=(//div[@data-id='lot']/div/a)[last()]
    Wait Visibility And Click Element  xpath=(//div[@data-id='lot'])[last()]//button[@data-id='actAddItem']

    ${count}=  Get Matching Xpath Count  xpath=(//div[@data-id='lot'])[last()]//div[@data-id='item']
    Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])//input[@data-id='description'])[${count}]  ${item.description}
    ${item_quantity}=  Convert To String  ${item.quantity}
    Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])//input[@data-id='quantity'])[${count}]  ${item_quantity}
    Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])//select[@data-id='unit'])[${count}]/option[text()='${item.unit.name}']

    #CPV
    Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//a[@data-id='actChoose'])[1]
    Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    Search By Query  css=input[data-id='query']  ${item.classification.id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']

    Run Keyword If  '336' in '${item.classification.id}'  Обрати додатковий класифікатор для item  ${item}  ${count}

    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='postalCode']  ${item.deliveryAddress.postalCode}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='countryName']  ${item.deliveryAddress.countryName}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='region']  ${item.deliveryAddress.region}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='locality']  ${item.deliveryAddress.locality}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='streetAddress']  ${item.deliveryAddress.streetAddress}

    Wait Until Element Is Visible  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='deliveryDateEnd']  ${COMMONWAIT}

    ${items}=  Get Matching Xpath Count  xpath=//div[@data-id='lot']//div[@data-id='item']
    ${item_index}=  Evaluate  ${items}-1

    Set Date In Item  ${item_index}  deliveryDate  startDate  ${item.deliveryDate.startDate}
    Set Date In Item  ${item_index}  deliveryDate  endDate  ${item.deliveryDate.endDate}

    #Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementUA'
    Run Keyword And Ignore Error
    ...  Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${count}]//input[@data-id='descriptionEn']  ${item.description_en}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Sleep  5s
    Wait Visibility And Click Element  xpath=//div[contains(@id,'tab')][last()]
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  120s


Обрати додатковий класифікатор для item
    [Arguments]  ${item}  ${item_index}
    @{additionalClassifications}=  Get From Dictionary  ${item}  additionalClassifications
    ${classifications_count}=  Get Length  ${additionalClassifications}

    : FOR  ${index}  IN RANGE  0  ${classifications_count}
    \  ${id}=  Set Variable  ${item.additionalClassifications[${index}].id}
    \  ${scheme}=  Set Variable  ${item.additionalClassifications[${index}].scheme}
    \  Run Keyword If  '${scheme}' == 'INN'  Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${item_index}]//a[@data-id='actChoose'])[2]
    \  ...  ELSE  Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[last()]//div[@data-id='item'])[${item_index}]//a[@data-id='actChoose'])[3]
    \  Sleep  5s
    \  Search By Query  css=input[data-id='query']  ${id}
    \  Wait Visibility And Click Element  css=button[data-id='actConfirm']
    \  Sleep  1s


Додати предмет закупівлі в план
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${item}

    privatmarket.Пошук плану по ідентифікатору  ${tender_owner}  ${tender_uaid}
    Дочекатися зміни статусу  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]
    Sleep  2s
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//select[@data-id='unit'])
    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count}=  Get_Length  ${elements}
    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${count}  1

    Wait Visibility And Click Element  xpath=//button[@data-id='actAddItem']
    Wait Element Visibility And Input Text  xpath=(//input[@data-id='description'])[${index_xpath}]  ${item.description}
    ${item_quantity}=  Convert To String  ${item.quantity}
    Input Text  xpath=(//input[@data-id='quantity'])[${index_xpath}]  ${item_quantity}
    Select From List By Label  xpath=(//select[@data-id='unit'])[${index_xpath}]  ${item.unit.name}
    Set Date In Item  ${count}  deliveryDate  endDate  ${item.deliveryDate.endDate}

    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_add}=  Get_Length  ${elements}
    Should Be True  ${count_add} == ${index_xpath}

    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Sleep  45s
    Reload Page
    Wait Visibility And Click Element  css=div.expired-ecp-label
#    Wait Visibility And Click Element  css=button.c-card-eds-sign-btn
#    Wait Visibility And Click Element  css=button#checkBidSignBtn
    Run Keyword  Завантажити ЕЦП
    Sleep  45s
    Reload Page


Видалити предмет закупівлі плану
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${item}

    privatmarket.Пошук плану по ідентифікатору  ${tender_owner}  ${tender_uaid}
    Дочекатися зміни статусу  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'editPlan')]
    Sleep  2s
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Until Element Is Visible  xpath=(//select[@data-id='unit'])
    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_before}=  Get_Length  ${elements}

    :FOR  ${i}  In Range  0  ${count_before}
    \  ${index_xpath}=  privatmarket_service.sum_of_numbers  ${i}  1
    \  ${text_value}=  Get Value  xpath=(//input[@data-id='description'])[${index_xpath}]
    \  ${item_delete}=  Get Regexp Matches  ${text_value}  ${item}
    \  ${count_item}=  Get_Length  ${item_delete}
    \  Run Keyword If  ${count_item} >0  Click Element  xpath=(//button[@data-id='actRemove'])[${index_xpath}]

    ${elements}=  Get Webelements  xpath=(//input[@data-id='description'])
    ${count_delete}=  Get_Length  ${elements}
    Should Be True  ${count_before} > ${count_delete}
    Wait Visibility And Click Element  xpath=//button[@data-id='actSave']
    Wait Visibility And Click Element  xpath=//button[@data-id='actSend']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Sleep  45s
    Reload Page
    Wait Visibility And Click Element  css=div.expired-ecp-label
    Run Keyword  Завантажити ЕЦП
    Sleep  45s
    Reload Page


Видалити предмет закупівлі
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${item_id}  ${lot_id}
    Fail  Ключевое слово не реализовано
#    privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tender_uaid}
#    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
#    Sleep  5s
#    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']    # unexpected behavior
#    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
#    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${tender_owner}
#    Wait Visibility And Click Element  css=#tab_1 a



Створити тендер
    [Arguments]  ${username}  ${tender_data}
    Set Global Variable  ${TENDER_DATA}  ${tender_data}
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  lots
    @{lots}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  lots
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  items
    @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  features
    @{features}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  features
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  milestones
    @{milestones}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  milestones

    Wait Until Element Is Visible  ${locator_tenderSearch.searchInput}  ${COMMONWAIT}
    Check Current Mode New Realisation

    ${scenarios_name}=  privatmarket_service.get_scenarios_name

    ${plan_path}=  Get Variable Value  ${ARTIFACT_FILE}  artifact_plan.yaml
    ${ARTIFACT}=  load_data_from  ${plan_path}

    ${status}  ${type}=  Run Keyword And Ignore Error  Set Variable  '${tender_data.data.procurementMethodType}'
    ${type}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${type}
    ...  ELSE  Set Variable  ''

    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'  privatmarket.Пошук плану по ідентифікатору  ${username}  ${ARTIFACT.tender_uaid}
    #go to form
    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  xpath=//button[contains(@ng-click,'switchToTender')]
    #submissionMethodDetails
    ${submissionMethod}  ${mode}=  Run Keyword And Ignore Error  Set Variable  '${tender_data.data.submissionMethodDetails}'
    ${mode}=  Run Keyword If
    ...  '${submissionMethod}' == 'PASS'  Set Variable  ${mode}
    ...  ELSE  Set Variable  ''

    Run Keyword IF  ${type} == 'closeFrameworkAgreementSelectionUA'  Перейти до створення другого етапу рамок  ${username}  ${TENDER.TENDER_UAID}

    Wait For Ajax
    Run Keyword If
    ...  'openua_award_complaint' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1080')]
    ...  ELSE IF  ${type} == '' and 'before_resolved_award_complaint' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '720')]
    ...  ELSE IF  ${type} == '' and 'after_resolved_award_complaint' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '144')]
    ...  ELSE IF  ${type} == ''  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1440')]
    ...  ELSE IF  ${type} == 'reporting'  no operation
    ...  ELSE IF  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '720')]
    ...  ELSE  Wait Visibility And Click Element  xpath=//select[@data-id='accelerator-select']/option[contains(., '1440')]

#step 0
    #we should add choosing of procurementMethodType
    Wait For Ajax
    Wait Element Visibility And Input Text  css=input[data-id='procurementName']  ${tender_data.data.title}
    Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescription']  ${tender_data.data.description}

    #Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'esco' or 'FrameworkAgreement' in ${type}
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Element Visibility And Input Text  css=input[data-id='procurementNameEn']  ${tender_data.data.title_en}
    ...  AND  Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescriptionEn']  ${tender_data.data.description_en}

    #Who is donor?
    Run Keyword If  'below_funders' in '${scenarios_name}'  Wait Visibility And Click Element  xpath=//select[@data-id='funder']/option[@label='${tender_data.data.funders[0].name}']

    Run Keyword If  ${type} == 'closeFrameworkAgreementUA'
    ...  Run Keywords
    ...  Wait Element Visibility And Input Text  xpath=//input[@data-id='maxAwardsCount']  ${tender_data.data.maxAwardsCount}
    ...  AND  Заповнити срок дії рамкової угоди  ${tender_data.data.agreementDuration}

    Run Keyword If  ${type} == 'esco'  Wait Visibility And Click Element  xpath=//input[@value='${tender_data.data.fundingKind}']
    Run Keyword If  ${type} == 'esco'  Встановити облікову ставку НБУ  ${tender_data.data.NBUdiscountRate}

    ${value_amount}=  Set Variable If  ${type} != 'esco' and ${type} != 'closeFrameworkAgreementSelectionUA'  ${tender_data.data.value.amount}  ''
    ${amount}=  convert_float_to_string  ${value_amount}

    Run Keyword If  ${type} == 'reporting'  Input Text  xpath=//input[@data-id='valueAmount']  ${amount}

    #date
    Wait For Ajax
    Run Keyword Unless  ${type} == 'aboveThresholdEU' or ${type} == 'aboveThresholdUA' or ${type} == 'aboveThresholdUA.defense' or ${type} == 'negotiation' or ${type} == 'competitiveDialogueEU' or ${type} == 'competitiveDialogueUA' or ${type} == 'reporting' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'closeFrameworkAgreementSelectionUA'  Set Enquiry Period  ${tender_data.data.enquiryPeriod.startDate}  ${tender_data.data.enquiryPeriod.endDate}
    Run Keyword If  ${type} == ''  Set Start Tender Period  ${tender_data.data.tenderPeriod.startDate}
    Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'reporting' or ${type} == 'closeFrameworkAgreementSelectionUA'  Set End Tender Period  ${tender_data.data.tenderPeriod.endDate}
    #skipAuction
    Run Keyword If  'quick(mode:fast-forward)' in ${mode}  Wait Visibility And Click Element  css=label[data-id='skip_auction']

    #cause
    Run Keyword If  ${type} == 'negotiation'
    ...  Run Keywords
    ...  Обрати підставу вибору переговорної процедури  ${tender_data}
    ...  AND  Wait Element Visibility And Input Text  css=textarea[data-id='causeDescription']  ${tender_data.data.causeDescription}

    #procuringEntityAddress
    Wait Element Visibility And Input Text  ${locator_lotAdd.postalCode}  ${tender_data.data.procuringEntity.address.postalCode}
    Wait Element Visibility And Input Text  ${locator_lotAdd.countryName}  ${tender_data.data.procuringEntity.address.countryName}
    Wait Element Visibility And Input Text  ${locator_lotAdd.region}  ${tender_data.data.procuringEntity.address.region}
    Wait Element Visibility And Input Text  ${locator_lotAdd.locality}  ${tender_data.data.procuringEntity.address.locality}
    Wait Element Visibility And Input Text  ${locator_lotAdd.streetAddress}  ${tender_data.data.procuringEntity.address.streetAddress}

    #contactPoint
    Wait Element Visibility And Input Text  css=[data-id='contactPoint'] input[data-id='fullNameUa']  ${tender_data.data.procuringEntity.contactPoint.name}
#    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'closeFrameworkAgreementSelectionUA'
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  css=[data-id='contactPoint'] input[data-id='fullNameEn']  ${tender_data.data.procuringEntity.contactPoint.name_en}
    ${modified_phone}=  Привести номер телефону до відповідного формату  ${tender_data.data.procuringEntity.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[data-id='phone']  ${modified_phone}
    Wait Element Visibility And Input Text  css=input[data-id='email']  ${USERS.users['${username}'].email}
    Wait Element Visibility And Input Text  css=input[data-id='url']  ${tender_data.data.procuringEntity.contactPoint.url}

#    Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'closeFrameworkAgreementSelectionUA'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='fullNameUa']  ${tender_data.data.procuringEntity.contactPoint.name}
    ...  AND  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='phone']  ${modified_phone}
    ...  AND  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='email']  ${USERS.users['${username}'].email}
    ...  AND  Wait Element Visibility And Input Text  css=[data-id='addContactPoint'] input[data-id='fullNameEn']  ${tender_data.data.procuringEntity.contactPoint.name_en}
    ...  AND  Wait Element Visibility And Input Text  css=input[data-id='legalNameEn']  ${tender_data.data.procuringEntity.name_en}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

    ${lots_count}=  Run Keyword Unless  ${type} == 'reporting'  Get Length  ${lots}

#Заповнити лоти та предмети закупівлі для процедури 'reporting'
    Run Keyword IF  ${type} == 'reporting'  Додати предмети закупівлі в план  ${items}  ${type}

#step 1
    Run Keyword Unless  ${type} == 'reporting'  Додати lots  ${lots}  ${items}  ${type}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

#Заповнити умови оплати для закупівлі

    Run Keyword Unless  ${type} == 'esco' or ${type} == 'closeFrameworkAgreementSelectionUA'
    ...  Додати milestones  ${milestones}  ${type}
    sleep  5s
    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

    Run Keyword If  ${type} == 'negotiation'  Wait Until Element Is Visible  css=label[for='documentation_tender_yes']  ${COMMONWAIT}
    ...  ELSE IF  ${type} == 'reporting'  Wait Until Element Is Visible  css=section[data-id='step4']  ${COMMONWAIT}
    ...  ELSE IF  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Until Element Is Visible  css=section[data-id='step5']  ${COMMONWAIT}
    ...  ELSE  Wait Until Element Is Visible  css=section[data-id='step3']  ${COMMONWAIT}

#step 3
    Wait For Ajax
    ${exist_features}=  Run Keyword And Return Status  Should not be empty  ${features}

    Run Keyword IF
    ...  ${type} == 'aboveThresholdEU'  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  ${type} == 'aboveThresholdUA' and ${exist_features}  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  ${type} == 'aboveThresholdUA.defense' and ${exist_features}  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  'competitiveDialogue' in ${type} and ${exist_features}  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  'closeFrameworkAgreementUA' in ${type} and ${exist_features}  Додати нецінові показники  ${features}  ${type}
    ...  ELSE IF  'esco' in ${type} and ${exist_features}  Додати нецінові показники  ${features}  ${type}

    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

#step 4
    Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'reporting' or ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Until Element Is Visible  css=section[data-id='step4']  ${COMMONWAIT}
    Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'reporting' or ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}

#step 5
    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Until Element Is Visible  xpath=//span[@title='Документація']  ${COMMONWAIT}
    Sleep  3s

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.

    Run Keyword IF
    ...  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'aboveThresholdUA' or ${type} == 'competitiveDialogueUA'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'aboveThresholdUA.defense' or ${type} == 'competitiveDialogueUA'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'closeFrameworkAgreementUA'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE IF  ${type} == 'negotiation' or ${type} == 'reporting'  Wait For Element With Reload  css=[data-tender-status='active']  1
    ...  ELSE IF  ${type} == 'esco'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1
    ...  ELSE  Wait For Element With Reload  css=[data-tender-status^='active.enquiries']  1
    ${tender_id}=  Get Text  ${tender_data_tenderID}
    Log To Console  ${tender_id}
    [Return]  ${tender_id}


Створити тендер другого етапу
     [Arguments]  ${username}  ${adapted_data}
     ${tender_id}=  privatmarket.Створити тендер  ${username}  ${adapted_data}
     [Return]  ${tender_id}


Перейти до створення другого етапу рамок
    [Arguments]  ${username}  ${tender_uaid}
    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[@data-id='createCfasDraft']
    Wait Until Element Is Visible  xpath=//div[text()='Відбір для закупівлі за рамковою угодою']


Додати lots
    [Arguments]  ${lots}  ${items}  ${type}
    ${lots_count}=  Get Length  ${lots}
    Wait For Ajax
    : FOR  ${index}  IN RANGE  0  ${lots_count}
    \  ${lot_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Run Keyword IF  ${type} == 'esco' and '${lot_index}' == '1'  Wait Visibility And Click Element  css=#lot_choosed~label
    \  Run Keyword Unless  '${lot_index}' == '1'  Wait Visibility And Click Element  css=button[data-id='actAddLot']
    \  ${lot_count}=  Get Matching Xpath Count  xpath=//input[@data-id='lotTitle']
    \  ${lot_index}=  Set Variable If  'Можливість створення лоту' in '${TEST_NAME}'  ${lot_count}  ${lot_index}
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='lotTitle'])[${lot_index}]  ${lots[${index}].title}
    \  Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='lotDescription'])[${lot_index}]  ${lots[${index}].description}
    \  ${amount}=  Set Variable If  ${type} != 'esco'  ${lots[${index}].value.amount}  ''
    \  ${value_amount}=  privatmarket_service.convert_float_to_string  ${amount}
    \  Run Keyword Unless  ${type} == 'esco' or ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='valueAmount'])[${lot_index}]  ${value_amount}
    \  Sleep  3s
    \  Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementSelectionUA'  Ввести мінімальний крок  ${lots}  ${index}  ${lot_index}
    \  Run Keyword If  ${type} == 'esco'  Встановити облікову ставку НБУ  ${tender_data.data.NBUdiscountRate}
    \  Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementSelectionUA'
    \  ...  Wait Visibility And Click Element  xpath=(//label[contains(@for,'guarantee')])[${lot_index}]
    \  Run Keyword Unless  ${type} == 'negotiation' or ${type} == 'esco' or ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Element Visibility And Input Text  xpath=(//input[@data-id='guaranteeAmount'])[${lot_index}]  1
  #  \ Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementSelectionUA' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    \  Run Keyword And Ignore Error
    \  ...  Run Keywords
    \  ...  Wait Until Element Is Visible  xpath=(//input[@data-id='procurementNameEn'])[${lot_index}]  5s
    \  ...  AND  Input Text  xpath=(//input[@data-id='procurementNameEn'])[${lot_index}]  ${lots[${index}].title_en}
    \  ...  AND  Wait Until Element Is Visible  xpath=(//textarea[@data-id='lotDescriptionEn'])[${lot_index}]  5s
    \  ...  AND  Input Text  xpath=(//textarea[@data-id='lotDescriptionEn'])[${lot_index}]  ${lots[${index}].description}
    \  ${auction_step}=  Set Variable If  ${type} == 'esco'  ${lots[${index}].minimalStepPercentage}  ''
    \  ${auction_step}=  Run Keyword IF  ${type} == 'esco'  Привести до відсотків  ${auction_step}
    \  ${yearly_payments}=  Set Variable If  ${type} == 'esco'  ${lots[${index}].yearlyPaymentsPercentageRange}  ''
    \  ${yearly_payments}=  Run Keyword IF  ${type} == 'esco'  Привести до відсотків  ${yearly_payments}
    \  Run Keyword IF  ${type} == 'esco'  Wait Element Visibility And Input Text  xpath=(//input[contains(@ng-model,'minimalStepPercentage')])[${lot_index}]  ${auction_step}
    \  Run Keyword IF  ${type} == 'esco'  Wait Element Visibility And Input Text  xpath=(//input[contains(@ng-model,'yearlyPaymentsPercentageRange')])[${lot_index}]  ${yearly_payments}

    \  ${count}=  Get Length  ${items}
    \  Run Keyword If  ${count} > 0 and '${TEST_NAME}' != 'Можливість створення лоту із прив’язаним предметом закупівлі'  Додати items  ${items}  ${lot_index}  ${lots[${index}].id}  ${type}
    \  Run Keyword If  'Можливість створення лоту' in '${TEST_NAME}'  Додати item до лоту   ${items}  ${count}  ${lot_index}  0  ${type}


Додати items
    [Arguments]  ${items}  ${lot_index}  ${lot_id}  ${type}
    ${lot_items}=  privatmarket_service.get_items_from_lot  ${items}  ${lot_id}
    ${items_count}=  Get Length  ${lot_items}
    ${item_plans_count}=  Get Matching Xpath Count  xpath=//div[@data-id='item']
    ${diff}=  evaluate  ${item_plans_count}-${items_count}
    : FOR  ${index}  IN RANGE  0  ${diff}
    \  Wait Visibility And Click Element  xpath=(//button[@data-id='actRemove'])[last()]
    Wait For Ajax
    : FOR  ${index}  IN RANGE  0  ${items_count}
    \  Додати item до лоту  ${lot_items}  ${items_count}  ${lot_index}  ${index}  ${type}


Додати item до лоту
    [Arguments]  ${items}  ${items_count}  ${lot_index}  ${index}  ${type}
    ${item_index}=  privatmarket_service.sum_of_numbers  ${index}  1

    ${is_click}=  is_click_button  ${item_index}  ${items_count}  ${lot_index}
    Run Keyword If  '${is_click}' == 'true' and ${type} == 'negotiation'  Wait Visibility And Click Element  xpath=(//button[@data-id='actAddItem'])[${lot_index}]
    Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//input[@data-id='description'])[${item_index}]  ${items[${index}].description}

    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA' or ${type} == 'esco'  Вказати вид предмету закупівлі  ${TENDER_DATA.data.mainProcurementCategory}  ${item_index}  ${lot_index}

    ${item_quantity}=  Convert To String  ${items[${index}].quantity}

    Run Keyword Unless  ${type} == 'esco'  Wait Element Visibility And Input Text  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//input[@data-id='quantity'])[${item_index}]  ${item_quantity}

    ${unitName}=  Run Keyword If
    ...  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU'  privatmarket_service.get_unit_name  ${items[${index}].unit.name}
    ...  ELSE IF  ${type} == 'esco'  No Operation
    ...  ELSE  privatmarket_service.get_unit_name  ${items[${index}].unit.name}

    Run Keyword Unless  ${type} == 'esco'  Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])//select[@data-id='unit'])[${item_index}]/option[text()='${unitName}']

    #CPV
    Run Keyword Unless  ${type} == 'closeFrameworkAgreementSelectionUA'
    ...  Run Keywords
    ...  Wait Visibility And Click Element  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//a[@data-id='actChoose']
    ...  AND  Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    ...  AND  Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    ...  AND  Search By Query  css=input[data-id='query']  ${items[${index}].classification.id}
    ...  AND  Wait Visibility And Click Element  css=button[data-id='actConfirm']

    ${status}  ${classification_id}=  Run Keyword And Ignore Error  Set Variable  ${items[${index}].classification.id}
    ${classification_id}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${classification_id}
    ...  ELSE  Set Variable  ''
    ${classification_id}=  Get Substring  ${classification_id}  0  5
    ${pre_classification_id}=  Get Substring  ${classification_id}  0  3
    ${classification_status}=  Set Variable If  '${pre_classification_id}' == '33695'  ${False}  ${True}
    Run Keyword If  '${classification_status}' == 'True' and ${pre_classification_id} == '336' and ${type} != 'closeFrameworkAgreementSelectionUA'  Обрати додаткові класифікатори для лікарських засобів  ${items}  ${index}  ${item_index}  ${lot_index}

    ${status}  ${deliveryStartDate}=  Run Keyword And Ignore Error  Set Variable  ${items[${index}].deliveryDate.startDate}
    ${deliveryStartDate}=  Run Keyword If
    ...  '${status}' == 'PASS'  Run Keyword  Отримати період для номенклатури  ${deliveryStartDate}
    ...  ELSE  Set Variable  ''

    ${status}  ${deliveryEndDate}=  Run Keyword And Ignore Error  Set Variable  ${items[${index}].deliveryDate.endDate}
    ${deliveryEndDate}=  Run Keyword If
    ...  '${status}' == 'PASS'  Run Keyword  Отримати період для номенклатури  ${deliveryEndDate}
    ...  ELSE  Set Variable  ''

    Run Keyword If  ${type} == 'closeFrameworkAgreementSelectionUA'  Wait Visibility And Click Element  xpath=//a[contains(@ng-click,'changeItemDeliveryOptions')]
    Run Keyword Unless  ${type} == 'esco'
    ...  Wait Visibility And Click Element  xpath=((//div[@data-id='lot'])[${lot_index}]//span[contains(text(), 'точна адреса')])[${item_index}]//preceding-sibling::input

    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='postalCode']  ${items[${index}].deliveryAddress.postalCode}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='countryName']  ${items[${index}].deliveryAddress.countryName}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='region']  ${items[${index}].deliveryAddress.region}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='locality']  ${items[${index}].deliveryAddress.locality}
    Wait Element Visibility And Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='streetAddress']  ${items[${index}].deliveryAddress.streetAddress}

    Run Keyword Unless  ${type} == 'esco'  Wait Until Element Is Visible  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='deliveryDateEnd']  ${COMMONWAIT}

    ${abs_item_index}=  privatmarket_service.get_abs_item_index  ${lot_index}  ${index}  ${items_count}
    Run Keyword Unless  ${type} == 'esco'
    ...  Run Keywords
    ...  Set Date In Item  ${abs_item_index}  deliveryDate  startDate  ${items[${index}].deliveryDate.startDate}
    ...  AND  Set Date In Item  ${abs_item_index}  deliveryDate  endDate  ${items[${index}].deliveryDate.endDate}

   # Run Keyword IF  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'closeFrameworkAgreementSelectionUA' or ${type} == 'esco'
   Run Keyword And Ignore Error
   ...  Run Keywords
   ...  Wait Until Element Is Visible  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='descriptionEn']  5s
   ...  AND  Input Text  xpath=((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${item_index}]//input[@data-id='descriptionEn']  ${items[${index}].description_en}


Отримати період для номенклатури
    [Arguments]  ${date}
    ${deliveryDate}=  Get Regexp Matches  ${date}  (\\d{4}-\\d{2}-\\d{2})
    ${deliveryDate}=  Convert Date  ${deliveryDate[0]}  result_format=%d-%m-%Y
    [Return]  ${deliveryDate}


Встановити облікову ставку НБУ
    [Arguments]  ${value}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.NBUdiscountRate = ${value}; s.$root.$apply();


Додати milestones
    [Arguments]  ${milestones}  ${type}
    ${milestones_count}=  Get Length  ${milestones}
    Wait For Ajax
     :FOR   ${index}   IN RANGE  0  ${milestones_count}
    \  ${elem_index}=  Evaluate  ${index}+1
    \  Wait Visibility And Click Element  xpath=//button[@data-id='actAdd']
    \  Wait Visibility And Click Element  xpath=(//select[@data-id='financing-milestone-code'])[${elem_index}]/option[contains(@value,'${milestones[${index}].code}')]
    \  Wait Visibility And Click Element  xpath=(//select[@data-id='financing-milestone-title'])[${elem_index}]/option[contains(@value,'${milestones[${index}].title}')]
    \  ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${milestones[${index}]}  description
    \  Run Keyword If  ${presence}  Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='financing-milestone-description'])[${elem_index}]  ${milestones[${index}].description}
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='financing-milestone-duration-days'])[${elem_index}]  ${milestones[${index}].duration.days}
    \  Wait Visibility And Click Element  xpath=(//select[@data-id='financing-milestone-duration-type'])[${elem_index}]/option[contains(@value,'${milestones[${index}].duration.type}')]
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='financing-milestone-percentage'])[${elem_index}]  ${milestones[${index}].percentage}


Додати нецінові показники
    [Arguments]  ${features}  ${type}
    ${features_length}=   Get Length   ${features}
    :FOR   ${index}   IN RANGE  0  ${features_length}
    \  Run Keyword If  '${features[${index}].featureOf}' == 'tenderer'  Заповнити нецінові показники по закупівлі  ${features[${index}]}  ${type}
    \  Run Keyword If  '${features[${index}].featureOf}' == 'item'  Заповнити нецінові показники по предмету  ${features[${index}]}  ${type}
    \  Run Keyword If  '${features[${index}].featureOf}' == 'lot'  Заповнити нецінові показники по лоту  ${features[${index}]}  ${type}


# Додавання лоту в існуючий тендер
Створити лот із предметом закупівлі
    [Arguments]  ${tender_owner}  ${tender_uaid}  ${lot}  ${item}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tender_uaid}

    ${type}=  Отримати інформацію з procurementMethodType
    ${type}=  Set Variable  '${type}'
    @{lots}=    Create List    ${lot.data}
    @{items}=    Create List    ${item}

    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Visibility And Click Element  css=#tab_1 a
    Wait Visibility And Click Element  css=button[data-id='actAddLot']

    Додати lots  ${lots}  ${items}  ${type}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Sleep  5s
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  120s


Заповнити нецінові показники по закупівлі
    [Arguments]  ${features}  ${type}
    Wait For Ajax
    Wait Visibility And Click Element  css=label[for='features_tender_yes']
    Run Keyword If  ${type} == 'esco'  Run Keywords
    ...  Wait Visibility And Click Element  xpath=//section[@data-id='ptrFeatures']//button[@data-id='actAdd']
    ...  AND  Wait Visibility And Click Element  xpath=(//section[@data-id='ptrFeatures']//button[@data-id='actRemove'])[1]
    Wait Element Visibility And Input Text  css=[data-id='ptrFeatures'] [data-id='title']  ${features.title}
    #Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='ptrFeatures'] [data-id='titleEn']  5s
    ...  AND  Input Text  css=[data-id='ptrFeatures'] [data-id='titleEn']  ${features.title_en}
    Wait Element Visibility And Input Text  css=textarea[data-id='description']  ${features.description}
#    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='ptrFeatures'] textarea[data-id='descriptionEn']  5s
    ...  AND  Input Text  css=[data-id='ptrFeatures'] textarea[data-id='descriptionEn']  ${features.description}

    @{tender_enums}=  Get From Dictionary  ${features}  enum
    ${tender_criterion_count}=  Get Length  ${tender_enums}

    : FOR  ${index}  IN RANGE  0  ${tender_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='criteria'] button[data-id='actAdd']
    \  ${tender_criterion_value}=  privatmarket_service.get_percent  ${tender_enums[${index}].value}
    \  ${tender_criterion_value}=  Convert to String  ${tender_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='criterionValue'])[${elem_index}]  ${tender_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//input[@data-id='criterionTitle'])[${elem_index}]  ${tender_enums[${index}].title}
   # \  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    \  Run Keyword And Ignore Error
    \  ...  Run Keywords
    \  ...  Wait Until Element Is Visible  xpath=(//section[@data-id='ptrFeatures']//input[@data-id='criterionTitleEn'])[${elem_index}]  5s
    \  ...  AND  Input Text  xpath=(//section[@data-id='ptrFeatures']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${tender_enums[${index}].title}


Заповнити нецінові показники по предмету
    [Arguments]  ${features}  ${type}
    Wait For Ajax
    Wait Visibility And Click Element  css=label[for='features_items_yes']
    Wait Visibility And Click Element  css=[data-id='item'] button[data-id='actAdd']
    Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='title']  ${features.title}
    #Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='item'] [data-id='titleEn']  5s
    ...  AND  Input Text  css=[data-id='item'] [data-id='titleEn']  ${features.title_en}
    Wait Element Visibility And Input Text  css=[data-id='item'] [data-id='description']  ${features.description}
 #  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='item'] [data-id='descriptionEn']  5s
    ...  AND  Input Text  css=[data-id='item'] [data-id='descriptionEn']  ${features.description}

    @{item_enums}=  Get From Dictionary  ${features}  enum
    ${item_criterion_count}=  Get Length  ${item_enums}

    : FOR  ${index}  IN RANGE  0  ${item_criterion_count}

    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='item'] [data-id='criteria'] button[data-id='actAdd']
    \  ${item_criterion_value}=  privatmarket_service.get_percent  ${item_enums[${index}].value}
    \  ${item_criterion_value}=  Convert to String   ${item_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionValue'])[${elem_index}]  ${item_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitle'])[${elem_index}]  ${item_enums[${index}].title}
    #\  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    \  Run Keyword And Ignore Error
    \  ...  Run Keywords
    \  ...  Wait Until Element Is Visible  xpath=(//div[@data-id='item']//input[@data-id='criterionTitleEn'])[${elem_index}]  5s
    \  ...  AND  Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${item_enums[${index}].title}


Заповнити нецінові показники по лоту
    [Arguments]  ${features}  ${type}
    Wait For Ajax
    Wait Visibility And Click Element  css=label[for='features_lots_yes']
    Wait Visibility And Click Element  css=[data-id='lot'] button[data-id='actAdd']
    Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='title']  ${features.title}
    #Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='lot'] [data-id='titleEn']  5s
    ...  AND  Input Text  css=[data-id='lot'] [data-id='titleEn']  ${features.title_en}
    Wait Element Visibility And Input Text  css=[data-id='lot'] [data-id='description']  ${features.description}
#    Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=[data-id='lot'] [data-id='descriptionEn']  5s
    ...  AND  Input Text  css=[data-id='lot'] [data-id='descriptionEn']  ${features.description}

    @{lot_enums}=  Get From Dictionary  ${features}  enum
    ${lot_criterion_count}=  Get Length  ${lot_enums}

    : FOR  ${index}  IN RANGE  0  ${lot_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  css=[data-id='lot'] [data-id='criteria'] button[data-id='actAdd']
    \  ${lot_criterion_value}=  privatmarket_service.get_percent  ${lot_enums[${index}].value}
    \  ${lot_criterion_value}=  Convert to String   ${lot_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionValue'])[${elem_index}]  ${lot_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitle'])[${elem_index}]  ${lot_enums[${index}].title}
  #  \  Run Keyword If  ${type} == 'aboveThresholdEU' or ${type} == 'competitiveDialogueEU' or ${type} == 'closeFrameworkAgreementUA' or ${type} == 'esco'
    \  Run Keyword And Ignore Error
    \  ...  Run Keywords
    \  ...  Wait Until Element Is Visible  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitleEn'])[${elem_index}]  5s
    \  ...  AND  Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitleEn'])[${elem_index}]  ${lot_enums[${index}].title}


Заповнити срок дії рамкової угоди
    [Arguments]  ${duration}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.agreementDuration = '${duration}'; s.$root.$apply();
#    ${matches}=  Get Regexp Matches  ${duration}  \\d+
#    ${year}=  Set Variable If  ${matches[0]} > 0  ${matches[0]}  ${EMPTY}
#    ${month}=  Set Variable If  ${matches[1]} > 0  ${matches[1]}  ${EMPTY}
#    ${day}=  Set Variable If  ${matches[2]} > 0  ${matches[2]}  ${EMPTY}
#    ${hour}=  Set Variable If  ${matches[3]} > 0  ${matches[3]}  ${EMPTY}
#    ${minute}=  Set Variable If  ${matches[4]} > 0  ${matches[4]}  ${EMPTY}
#    ${second}=  Set Variable If  ${matches[5]} > 0  ${matches[5]}  ${EMPTY}
#    Wait Element Visibility And Input Text  xpath=//input[@data-id='agreementDurationY']  ${year}
#    Wait Element Visibility And Input Text  xpath=//input[@data-id='agreementDurationM']  ${month}
#    Wait Element Visibility And Input Text  xpath=//input[@data-id='agreementDurationD']  ${day}


Обрати додаткові класифікатори для лікарських засобів
    [Arguments]  ${items}  ${item_index}  ${xpath_index}  ${lot_index}
    @{additionalClassifications}=  Get From Dictionary  ${items[${item_index}]}  additionalClassifications
    ${classifications_count}=  Get Length  ${additionalClassifications}

    : FOR  ${index}  IN RANGE  0  ${classifications_count}
    \  ${id}=  Set Variable  ${items[${item_index}].additionalClassifications[${index}].id}
    \  ${scheme}=  Set Variable  ${items[${item_index}].additionalClassifications[${index}].scheme}
    \  Run Keyword  Додати класифікатор  ${id}  ${scheme}  ${xpath_index}  ${lot_index}


Додати класифікатор
    [Arguments]  ${id}  ${scheme}  ${xpath_index}  ${lot_index}
    Sleep  10s
    Run Keyword If  '${scheme}' == 'INN'  Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${xpath_index}]//a[@data-id='actChoose'])[2]
    ...  ELSE  Wait Visibility And Click Element  xpath=(((//div[@data-id='lot'])[${lot_index}]//div[@data-id='item'])[${xpath_index}]//a[@data-id='actChoose'])[3]
    Sleep  5s
    Search By Query  css=input[data-id='query']  ${id}
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Sleep  1s


Обрати підставу вибору переговорної процедури
    [Arguments]  ${tender_data}
    Wait Visibility And Click Element  xpath=//a[contains(text(),'Обрати')]
    Wait For Ajax
    Wait Visibility And Click Element  css=input[value='${tender_data.data.cause}']
    Wait Visibility And Click Element  css=button[data-id='actConfirm']
    Wait For Ajax


Ввести мінімальний крок
    [Arguments]  ${lots}  ${index}  ${elem_index}
    ${minimalStep_amount}=  Convert to String  ${lots[${index}].minimalStep.amount}
    Click Element  xpath=(//input[@data-id='minimalStepAmount'])[${elem_index}]
    Wait Until Element Is Enabled  xpath=(//input[@data-id='minimalStepAmount'])[${elem_index}]
    Wait Element Visibility And Input Text  xpath=(//input[@data-id='minimalStepAmount'])[${elem_index}]  ${minimalStep_amount}


Оновити сторінку з тендером
    [Arguments]  @{ARGUMENTS}
    [Documentation]
    ...  ${ARGUMENTS[0]} == username
    ...  ${ARGUMENTS[1]} == tenderId
    Switch Browser  ${ALIAS_NAME}
    Reload Page
    Sleep  2s


Внести зміни в тендер
    [Arguments]  ${user_name}  ${tenderId}  ${parameter}  ${value}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}

#    ${status}=  Run Keyword And Return Status  Page Should Contain  Закінчення періоду прийому пропозицій не повинно бути ближче  10s
#    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tender_uaid}

    Run Keyword And Return If  'Неможливість редагувати однопредметний тендер менше ніж за 2 дні' in '${TEST_NAME}'  Перевірити неможливість внесення змін в тендер

#    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Run Keyword And Ignore Error
    ...  Run Keywords
    ...  Wait Until Element Is Visible  css=button[data-id='modal-close']  5s
    ...  AND  Click Element  css=button[data-id='modal-close']

    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Run Keyword If  '${parameter}' == 'tenderPeriod.endDate'  Set Date  tenderPeriod  endDate  ${value}
    Run Keyword If  '${parameter}' == 'description'  Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescription']  ${value}
    Run Keyword If  '${parameter}' == 'maxAwardsCount'  Wait Element Visibility And Input Text  css=input[data-id='maxAwardsCount']  ${value}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    sleep  5s
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  120s


Перевірити неможливість внесення змін в тендер
    ${status}=  Run Keyword And Return Status  Page Should Contain  Закінчення періоду прийому пропозицій не повинно бути ближче  10s
    Run Keyword If  '${status}' == 'True'  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Run Keyword If  '${status}' == 'True'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Run Keyword If  '${status}' == 'True'  Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Run Keyword If  '${status}' == 'True'  Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Run Keyword If  '${status}' == 'True'  Fail


Змінити лот
    [Arguments]  ${user_name}  ${tenderId}  ${lot_id}  ${field}  ${value}
    Run Keyword And Return If  'value.amount' == '${field}'  Змінити ${field} лоту  ${value}
    Run Keyword And Return If  'minimalStep.amount' == '${field}'  Змінити ${field} лоту  ${value}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait Element Visibility And Input Text  xpath=(//textarea[@data-id='lotDescription'])[1]  ${value}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  30s


Змінити value.amount лоту
    [Arguments]  ${value}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Лоти та предмети закупівлі']
    ${value_amount}=  privatmarket_service.convert_float_to_string  ${value}
    Wait Element Visibility And Input Text  css=input[data-id='valueAmount']  ${value_amount}
    Sleep  3s


Змінити minimalStep.amount лоту
    [Arguments]  ${value}
    ${minimalStep_amount}=  Convert to String  ${value}
    Wait Element Visibility And Input Text  css=input[data-id='minimalStepAmount']  ${minimalStep_amount}
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//div[contains(@id,'tab')][last()]
    Wait For Ajax
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  30s


Додати неціновий показник на тендер
    [Arguments]  ${user_name}  ${tenderId}  ${feature}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    ${type}=  Отримати інформацію з procurementMethodType
    ${type}=  Set Variable  '${type}'
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//span[@title='Нецінові показники']
    Sleep  2s
    Wait Visibility And Click Element  xpath=//*[@data-id='ptrFeatures']//button[contains(., 'Додати показник')]
    Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='title'])[last()]  ${feature.title}
#    Run Keyword If  ${type} != 'aboveThresholdUA'  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='titleEn'])[last()]  ${feature.title_en}
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='titleEn'])[last()]  ${feature.title_en}
    Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//textarea[@data-id='description'])[last()]  ${feature.description}
 #   Run Keyword If  ${type} != 'aboveThresholdUA'
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//textarea[@data-id='descriptionEn'])[last()]  ${feature.description}

    @{tender_enums}=  Get From Dictionary  ${feature}  enum
    ${tender_criterion_count}=  Get Length  ${tender_enums}

    : FOR  ${index}  IN RANGE  0  ${tender_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  xpath=(//*[@data-id='ptrFeatures']//section[@data-id='criteria']//button)[last()]
    \  ${tender_criterion_value}=  privatmarket_service.get_percent  ${tender_enums[${index}].value}
    \  ${tender_criterion_value}=  Convert to String   ${tender_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='criterionValue'])[last()]  ${tender_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='criterionTitle'])[last()]  ${tender_enums[${index}].title}
   # \  Run Keyword If  ${type} != 'aboveThresholdUA'
    \  Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//*[@data-id='ptrFeatures']//input[@data-id='criterionTitleEn'])[last()]  ${tender_enums[${index}].title}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Додати неціновий показник на лот
    [Arguments]  ${user_name}  ${tenderId}  ${feature}  ${lot_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    ${type}=  Отримати інформацію з procurementMethodType
    ${type}=  Set Variable  '${type}'
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//span[@title='Нецінові показники']
    Sleep  2s
    Wait Visibility And Click Element  xpath=//div[@data-id='lot']//button[contains(., 'Додати показник')]
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='title'])[last()]  ${feature.title}
#    Run Keyword If  ${type} != 'aboveThresholdUA'  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='titleEn'])[last()]  ${feature.title_en}
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='titleEn'])[last()]  ${feature.title_en}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//textarea[@data-id='description'])[last()]  ${feature.description}
#    Run Keyword If  ${type} != 'aboveThresholdUA'  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//textarea[@data-id='descriptionEn'])[last()]  ${feature.description}
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//textarea[@data-id='descriptionEn'])[last()]  ${feature.description}

    @{lot_enums}=  Get From Dictionary  ${feature}  enum
    ${lot_criterion_count}=  Get Length  ${lot_enums}

    : FOR  ${index}  IN RANGE  0  ${lot_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  xpath=(//div[@data-id='lot']//section[@data-id='criteria']//button)[last()]
    \  ${lot_criterion_value}=  privatmarket_service.get_percent  ${lot_enums[${index}].value}
    \  ${lot_criterion_value}=  Convert to String   ${lot_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionValue'])[last()]  ${lot_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitle'])[last()]  ${lot_enums[${index}].title}
   # \  Run Keyword If  ${type} != 'aboveThresholdUA'
    \  Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='lot']//input[@data-id='criterionTitleEn'])[last()]  ${lot_enums[${index}].title}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Додати неціновий показник на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${feature}  ${item_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    ${type}=  Отримати інформацію з procurementMethodType
    ${type}=  Set Variable  '${type}'
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//span[@title='Нецінові показники']
    Sleep  3
    Wait Visibility And Click Element  xpath=//div[@data-id='item']//button[contains(., 'Додати показник')]
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='title'])[last()]  ${feature.title}
#    Run Keyword If  ${type} != 'aboveThresholdUA'  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='titleEn'])[last()]  ${feature.title}
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='titleEn'])[last()]  ${feature.title}
    Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//textarea[@data-id='description'])[last()]  ${feature.description}
  #  Run Keyword If  ${type} != 'aboveThresholdUA'
    Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//textarea[@data-id='descriptionEn'])[last()]  ${feature.description}

    @{item_enums}=  Get From Dictionary  ${feature}  enum
    ${item_criterion_count}=  Get Length  ${item_enums}

    : FOR  ${index}  IN RANGE  0  ${item_criterion_count}
    \  Run Keyword Unless  '${index}' == '0'  Wait Visibility And Click Element  xpath=(//div[@data-id='item']//section[@data-id='criteria']//button)[last()]
    \  ${item_criterion_value}=  privatmarket_service.get_percent  ${item_enums[${index}].value}
    \  ${item_criterion_value}=  Convert to String   ${item_criterion_value}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionValue'])[last()]  ${item_criterion_value}
    \  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitle'])[last()]  ${item_enums[${index}].title}
   # \  Run Keyword If  ${type} != 'aboveThresholdUA'
    \  Run Keyword And Ignore Error  Wait Element Visibility And Input Text  xpath=(//div[@data-id='item']//input[@data-id='criterionTitleEn'])[last()]  ${item_enums[${index}].title}

    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Видалити неціновий показник
    [Arguments]  ${user_name}  ${tenderId}  ${feature_id}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//span[@title='Нецінові показники']
    Run Keyword If
    ...  'на тендер' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=(//*[@data-id='ptrFeatures']//button[@data-id='actRemove'])[last()]
    ...  ELSE IF  'на лот' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=(//div[@data-id='lot']//button[@data-id='actRemove'])[last()]
    ...  ELSE IF  'на предмет' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=(//*[@data-id='item']//button[@data-id='actRemove'])[last()]
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Видалити донора
    [Arguments]  ${user_name}  ${tenderId}  ${funders_index}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tender_uaid}

    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//select[@data-id='funder']/option[@value='none']
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Додати донора
    [Arguments]  ${user_name}  ${tenderId}  ${funders_data}
    privatmarket.Пошук тендера по ідентифікатору  ${tender_owner}  ${tenderId}
    Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}
    Wait For Ajax
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Wait Visibility And Click Element  xpath=//select[@data-id='funder']/option[@value='${funders_data.identifier.id}']
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.


Завантажити документ
    [Arguments]  ${user_name}  ${filepath}  ${tenderId}
    #перейдем к редактированию
    Run Keyword If
    ...  'Неможливість' in '${TEST_NAME}'  Wait Until Element Is Visible  ${locator_tenderClaim.buttonCreate}  1s
    ...  ELSE  Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}

    Sleep  2s
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    #откроем нужную вкладку
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Документація']

    #загрузим файл
    Wait Visibility And Click Element  css=label[for='documentation_tender_yes']
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//div[@data-id='ptrDocuments']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//div[@data-id='ptrDocuments']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("div[data-id='ptrDocuments'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=div[data-id='ptrDocuments'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Until Element Is Visible  xpath=//span[@title='Перевірка та публікація']  ${COMMONWAIT}
    Sleep  1s

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    #Дождемся подтверждения и обновим страницу, поскольку тут не выходит его закрыть
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Завантажити документ в лот
    [Arguments]  ${user_name}  ${filepath}  ${tenderId}  ${lot_id}
    Run Keyword If
    ...  'Неможливість' in '${TEST_NAME}'  Wait Until Element Is Visible  ${locator_tenderClaim.buttonCreate}
    ...  ELSE  Wait For Element With Reload  ${locator_tenderClaim.buttonCreate}  1
    Execute JavaScript    window.scrollTo(${0},${0})

    Wait Visibility And Click Element  ${locator_tenderClaim.buttonCreate}

    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  2s
    Wait Until Element Is Visible  css=input[data-id='procurementName']  ${COMMONWAIT}
    Wait Until Keyword Succeeds  1min  10s  Звiрити value of title на сторінці редагуванння  ${user_name}
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//span[@title='Документація']
    Sleep  2s
    Wait Visibility And Click Element  css=label[for='documentation_lot_yes']
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@data-id='lotDocuments']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@data-id='lotDocuments']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("div[data-id='lotDocuments'] input[data-id='input-file']").style = ''
    Sleep  1s
    Choose File  css=div[data-id='lotDocuments'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Wait Visibility And Click Element  ${locator_tenderAdd.btnSave}
    Wait For Ajax
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Until Element Is Visible  xpath=//span[@title='Перевірка та публікація']  ${COMMONWAIT}
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${locator_tenderCreation.buttonSend}  5s
    Run Keyword If  '${status}' == 'False'  Wait Visibility And Click Element  xpath=//span[@title='Перевірка та публікація']

    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}

    #Дождемся подтверждения и обновим страницу, поскольку тут не выходит его закрыть
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Sleep  180s


Завантажити документ у кваліфікацію
    [Arguments]  ${user_name}  ${filePath}  ${tenderId}  ${bid_index}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    ${bid_index}=  privatmarket_service.abs_number  ${bid_index}
    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1

    ${elements}=  Get Webelements  //table[@class='bids']//tbody//tr
    ${count}=  Get_Length  ${elements}

    Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[${index}]//a[@ng-click='act.openQualification(q)']

    Wait For Ajax
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
    Sleep  1s
    Choose File  xpath=//div[@class='files-upload']//input[@type='file']  ${filePath}
    Sleep  180s


Підтвердити кваліфікацію
    [Arguments]  ${user_name}  ${tenderId}  ${bid_index}
    Reload Page
    Wait For Ajax
    Sleep  10s
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    ${bid_index}=  privatmarket_service.abs_number  ${bid_index}
    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1

    ${elements}=  Get Webelements  //table[@class='bids']//tbody//tr
    ${count}=  Get_Length  ${elements}

    ${pending_bids}=  Get Webelements  //table[@class='bids']//tbody//tr//td[2]//a[@ng-click='act.openQualification(q)']
    ${count_pending}=  Get_Length  ${pending_bids}
    ${confirmed_bids}=  Get Matching Xpath Count  xpath=//table[@class='bids']//tbody//tr//td[2]//span[@ng-click='act.openCancelQualificationWindow(q.id)']

    ${count_active}=  Evaluate  ${count_pending}+${confirmed_bids}
    ${diff}=  Evaluate  ${count}-${count_active}

    Run Keyword If  ${count} == 1  Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])
    Run Keyword If  ${count} > 1 and ${diff} == 0  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[${index}]//a[@ng-click='act.openQualification(q)']
    Run Keyword If  ${count} > 1 and ${diff} > 0 and ${count_pending} == 1  Wait Visibility And Click Element  xpath=//a[@ng-click='act.openQualification(q)']
    Run Keyword If  ${count} > 1 and ${diff} > 0 and ${count_pending} > 1  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[last()]//a[@ng-click='act.openQualification(q)']
    Wait For Ajax

    Wait Visibility And Click Element  xpath=//label[@for='chkSelfQualified']
    Wait Visibility And Click Element  xpath=//label[@for='chkSelfEligible']
#    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
#    Sleep  1s
#    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
#    Sleep  1s
#
#    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
#    Run Keyword And Ignore Error  Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
#    Sleep  1s
#    Choose File  xpath=//div[@class='files-upload']//input[@type='file']  ${file_path}
#    Sleep  5s

    #Допустити до аукциону
    Wait Visibility And Click Element  xpath=//button[@data-id='setQualStatusActive']
    Sleep  1s
    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}
#    Підписати ЕЦП  ${index}
    Sleep  180s


Відхилити кваліфікацію
    [Arguments]  ${user_name}  ${tenderId}  ${bid_index}
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${bid_index}=  privatmarket_service.abs_number  ${bid_index}
    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1

    ${elements}=  Get Webelements  //table[@class='bids']//tbody//tr
    ${count}=  Get_Length  ${elements}

    Run Keyword If  ${count} == 1  Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])
    Run Keyword If  ${count} > 1  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[${index}]//a[@ng-click='act.openQualification(q)']

#    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
#
#    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
#    Sleep  1s
#    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
#    Sleep  1s
#    Run Keyword And Ignore Error  Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
#    Sleep  1s
#    Choose File  xpath=//div[@class='files-upload']//input[@type='file']  ${file_path}
    Sleep  5s
    Wait Visibility And Click Element  xpath=//button[@data-id='setQualStatusUnsuccessful']
    ${comment}=  create_fake_sentence
    Wait Element Visibility And Input Text  xpath=//textarea[@data-id='decline-description']  ${comment}
    Wait Visibility And Click Element  xpath=//label[@for='chk-dr0']
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-ok']
    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-close']
#    Sleep  5s
#    Підписати ЕЦП  ${index}
    Sleep  120s


Видалити лот
    [Arguments]  ${user_name}  ${tenderId}  ${lot_id}
    Reload Page
    Wait Visibility And Click Element  xpath=(//div[@id='lotStatus']//a[text()='Скасувати лот'])[last()]
    Wait Visibility And Click Element  xpath=//button[@id='singlebutton' and text()='Так']
    Wait Until Element Is Visible  xpath=//h3[contains(text(),'Скасування лоту')]  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//select[contains(@ng-model,'cancelleted')]//option[2]
    ${causes_list_count}=  Get Matching Xpath Count  xpath=//ul[@class='cancelleted-cases-list']//li
    ${cause}=  Get Text  xpath=//ul[@class='cancelleted-cases-list']//li[1]
    Wait Element Visibility And Input Text  xpath=//textarea[@id='questionDescription']  ${cause}
    Wait Visibility And Click Element  xpath=//button[@id='singlebutton' and contains(text(),'Опублікувати')]
    Wait Visibility And Click Element  xpath=//button[@id='singlebutton' and text()='Ок']
    Sleep  120s


Скасувати кваліфікацію
    [Arguments]  ${user_name}  ${tenderId}  ${bid_index}

    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${bid_index}=  privatmarket_service.abs_number  ${bid_index}
    ${index}=  privatmarket_service.sum_of_numbers  ${bid_index}  1

    ${elements}=  Get Webelements  //table[@class='bids']//tbody//tr
    ${count}=  Get_Length  ${elements}

    Run Keyword If  ${count} == 1  Wait Visibility And Click Element  xpath=(//span[@ng-click='act.openCancelQualificationWindow(q.id)'])
    Run Keyword If  ${count} > 1  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[${index}]//span[@ng-click='act.openCancelQualificationWindow(q.id)']
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-cancel-qualification-or-award']

    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}

    Wait Visibility And Click Element  xpath=(//button[@data-id='btn-close'])[last()]
    Sleep  240s


Підписати ЕЦП
    [Arguments]  ${bid_index}
    Reload Page
    Wait For Element With Reload  xpath=//span[@data-id="status" and contains(text(), 'Очікує ЕЦП')]  1

    ${elements}=  Get Webelements  //table[@class='bids']//tbody//tr
    ${count}=  Get_Length  ${elements}

    ${pending_bids}=  Get Webelements  //table[@class='bids']//tbody//tr//td[2]//a[@ng-click='act.openQualification(q)']
    ${count_pending}=  Get_Length  ${pending_bids}

    ${confirmed_bids}=  Get Matching Xpath Count  xpath=//table[@class='bids']//tbody//tr//td[2]//span[@ng-click='act.openCancelQualificationWindow(q.id)']
    ${count_active}=  Evaluate  ${count_pending}+${confirmed_bids}

    ${diff}=  Evaluate  ${count}-${count_active}

    Run Keyword If  ${count} == 1  Wait Visibility And Click Element  xpath=(//a[@ng-click='act.openQualification(q)'])
    Run Keyword If  ${count} > 1 and ${diff} == 0  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[${bid_index}]//a[@ng-click='act.openQualification(q)']
    Run Keyword If  ${count} > 1 and ${diff} > 0 and ${count_pending} == 1  Wait Visibility And Click Element  xpath=//a[@ng-click='act.openQualification(q)']
    Run Keyword If  ${count} > 1 and ${diff} > 0 and ${count_pending} > 1  Wait Visibility And Click Element  xpath=(//table[@class='bids']//tbody//tr)[last()]//a[@ng-click='act.openQualification(q)']
    Wait For Ajax

    Wait Visibility And Click Element  xpath=//button[@data-id='addQualFileEcp']
    Sleep  2s
    Select Window  name=signWin
    Wait Until Keyword Succeeds  2min  20s  Дочекатися завантаження сторінки підписання ЕЦП
    Wait Until Element Is Visible  id=CAsServersSelect  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//select[@id='CAsServersSelect']//option[8]
    ${path}=   get_ECP_key  src/robot_tests.broker.privatmarket/11141802_11141802.jks
    Choose File  id=PKeyFileInput  ${path}
    Wait Element Visibility And Input Text  id=PKeyPassword  11111111
    Wait Visibility And Click Element  id=PKeyReadButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'Ключ успішно завантажено')]  ${COMMONWAIT}
    Wait Visibility And Click Element  id=SignDataButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'Ок')]  ${COMMONWAIT}
    Close Window
    Select Window


Затвердити остаточне рішення кваліфікації
    [Arguments]  ${user_name}  ${tenderId}
    Wait For Element With Reload  css=button[data-id='finishPreQualBtn']  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  css=button[data-id='finishPreQualBtn']
    Wait For Element With Reload  css=[data-tender-status='active.pre-qualification.stand-still']  1


Отримати інформацію із тендера
    [Arguments]  ${user_name}  ${tender_uaid}  ${field_name}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${user_name}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  ${tender_data_title}  ${COMMONWAIT}
    Run Keyword Unless  'award_view' in @{TEST_TAGS} or 'add_contract' in @{TEST_TAGS} or 'contract_view' in @{TEST_TAGS} or 'stage2_pending_status_view' in @{TEST_TAGS} or 'plan_view' in @{TEST_TAGS}
    ...  Відкрити детальну інформацію по позиціям
    #get information
    ${result}=  Run Keyword If
    ...  'award_view' in @{TEST_TAGS} or 'add_contract' in @{TEST_TAGS}  Отримати інформацію про постачальника  ${tender_uaid}  ${field_name}
    ...  ELSE IF  'contract_value' in @{TEST_TAGS} or 'contract_view' in @{TEST_TAGS} or 'doc_to_contract' in @{TEST_TAGS}  Отримати інформацію з контракту  ${tender_uaid}  ${field_name}
    ...  ELSE  Отримати інформацію зі сторінки  ${user_name}  ${tender_uaid}  ${field_name}
    [Return]  ${result}


Відкрити детальну інформацію по позиціям
    Відкрити детальну інформацію по лотам
    Wait Until Element Is Visible  css=.lot-info .description a
    ${elements}=  Get Webelements  css=.lot-info .description a
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//div[@class='lot-info']//div[@class='description']/a)[${item}]@class
    \  Run Keyword Unless  'checked-item' in '${class}'  Click Element  xpath=(//div[@class='lot-info']//div[@class='description']/a)[${item}]


Відкрити інформацію по запитанням на всі лоти
    ${elements}=  Get Webelements  xpath=//a[contains(@ng-class, 'lot-faq')]
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-faq')])[${item}]@class
    \  Run Keyword Unless  'checked-item' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-faq')])[${item}]
    \  Run Keyword If  'відповіді на запитання' in '${TEST_NAME}'  Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=(//div[contains(@class, 'question-answer')]//div[contains(@class, 'question-expand-div')]/a[1])[${item}]


Відкрити інформацію про вкладені файли вимоги
    ${elements}=  Get Webelements  xpath=//a[@data-id='toggle-file-section']
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  Scroll To Element  xpath=(//a[@data-id='toggle-file-section'])[${item}]
    \  Click Element  xpath=(//a[@data-id='toggle-file-section'])[${item}]


Відкрити повну відповідь на запитання
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=.question-answer .question-expand-div>a:nth-of-type(1)


Відкрити детальну інформацію по лотам
    ${elements}=  Get Webelements  xpath=//a[contains(@ng-class, 'description')]
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'description')])[${item}]@class
    \  Sleep  1s
    \  Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'description')])[${item}]


Створити постачальника, додати документацію і підтвердити його
    [Arguments]  ${username}  ${tender_uaid}  ${supplier_data}  ${document}
    Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait For Ajax
    Run Keyword And Ignore Error  Click Button  css=button[data-id='addParticipant']
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAwardDraftEditWnd(b.psId)"]
    Wait Until Element Is Visible  css=.modal.fade.in  ${COMMONWAIT}
    Wait For Ajax
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.identifier.legalName']  ${supplier_data.data.suppliers[0].identifier.legalName}
    Wait Visibility And Click Element  xpath=//select[contains(@class,'company-scale')]/option[@value='string:${supplier_data.data.suppliers[0].scale}']
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.identifier.id']  ${supplier_data.data.suppliers[0].identifier.id}

    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.postalCode']  ${supplier_data.data.suppliers[0].address.postalCode}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.countryName']  ${supplier_data.data.suppliers[0].address.countryName}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.region']  ${supplier_data.data.suppliers[0].address.region}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.locality']  ${supplier_data.data.suppliers[0].address.locality}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.address.streetAddress']  ${supplier_data.data.suppliers[0].address.streetAddress}

    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.name']  ${supplier_data.data.suppliers[0].contactPoint.name}
    ${modified_phone}=  Привести номер телефону до відповідного формату  ${supplier_data.data.suppliers[0].contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.telephone']  ${modified_phone}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.email']  ${supplier_data.data.suppliers[0].contactPoint.email}
    Wait Element Visibility And Input Text  css=input[ng-model='supplier.contactPoint.url']  ${supplier_data.data.suppliers[0].contactPoint.url}
    Wait Element Visibility And Input Text  css=input[ng-model='model.awardDraft.value.amount']  ${supplier_data.data.value.amount}
    Wait Visibility And Click Element  css=.modal.fade.in input[type='checkbox']
    Wait Visibility And Click Element  css=button[data-id='btn-send-award']
    Wait Until Element Is Enabled  css=div.alert-info  timeout=${COMMONWAIT}
    Wait Until Element Contains  css=div.alert-info  Данні успішно відправлені  timeout=10
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-close']
    Wait For Ajax
    Reload Page
    Sleep  60s
    Scroll To Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait Visibility And Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait For Element With Reload  xpath=//span[@ng-click="act.openAward(b)"]  1
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAward(b)"]
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[1]/option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[2]/option[2]
    Sleep  1s
    Choose File  xpath=//div[@class='form-block__item']/form/div/input  ${document}
    Sleep  5s
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'до звіту про укладений договір' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=//label[@for='chkSelfQualified']
    Run Keyword Unless  'до переговорної процедури' in '${TEST_NAME}' or 'single_item' in '${scenarios_name}' or 'до звіту про укладений договір' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=//label[@for='chkSelfEligible']
    Wait Visibility And Click Element  css=button[data-id='setActive']
    Sleep  60s
    Reload Page
    Scroll To Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait Visibility And Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait For Element With Reload  xpath=//span[@ng-click="act.openAward(b)"]  1
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAward(b)"]
    Wait Visibility And Click Element  xpath=//button[@data-id='addAwardFileEcp']
    Sleep  1s
    Run Keyword  Завантажити ЕЦП
    Sleep  3min


Підтвердити підписання контракту
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
    ${tender_type}=  Отримати інформацію з procurementMethodType
    Відкрити детальну інформацію про контракт
    Run Keyword If
    ...  'Неможливість' in '${TEST_NAME}'  Wait Until Element Is Visible  css=input[data-id='contract.title']  5s
    ...  ELSE  Wait For Element With Reload  xpath=//input[@data-id='contract.title'] | //div[contains(@class,'contracts')]  1
    Run Keyword If  '${MODE}' == 'reporting' or '${MODE}' == 'negotiation' or 'belowThreshold' in '${tender_type}'
    ...  Run Keywords
    ...  Заповнити поля договору  ${tender_uaid}
    ...  AND  Опублікувати договір  ${tender_uaid}
    Wait For Element With Reload  xpath=//span[@id='contractStatus']  1
    Wait Visibility And Click Element  xpath=//div[contains(@class,'contracts info')]//div[@id='noEcp']
    Sleep  1s
    Run Keyword  Завантажити ЕЦП
    Sleep  2min


Заповнити поля договору
    [Arguments]  ${tender_uaid}
    Wait Element Visibility And Input Text  css=input[data-id='contract.title']  ${tender_uaid}
    Wait Element Visibility And Input Text  css=#contractNumber  ${tender_uaid}

    Click Element  xpath=//input[@name='dateSigned']
    Wait Visibility And Click Element  css=div.datepicker-days td.today
    Wait Visibility And Click Element  xpath=//input[@name='endDate']
    Wait Visibility And Click Element  xpath=//div[@class="datepicker-days"]//tbody//tr[6]//td[4]

    Wait For Ajax
    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[1]/option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[2]/option[2]
    Sleep  1s
    Choose File  xpath=//div[@class='form-block__item']/form/div/input  ${file_path}
    Sleep  20s


Опублікувати договір
    [Arguments]  ${tender_uaid}
    Wait Until Element Is Enabled  css=button[ng-click="act.saveContract('active')"]  ${COMMONWAIT}
    Click Button  css=button[ng-click="act.saveContract('active')"]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']
    Wait Until Element Is Visible  css=.notify  ${COMMONWAIT}
    Sleep  20s
    Reload Page


Редагувати угоду
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${field_name}  ${value}
    Reload Page
    Wait For Element With Reload  xpath=//input[@data-id='contract.title']  1
    Wait Element Visibility And Input Text  xpath=//input[@data-id='contract.title']  Договір до закупівлі
    Wait Element Visibility And Input Text  xpath=//input[@id='contractNumber']  1234567890
    Click Element  xpath=//input[@name='dateSigned']
    Wait Visibility And Click Element  css=div.datepicker-days td.today
    Wait Visibility And Click Element  xpath=//input[@name='endDate']
    Wait Visibility And Click Element  xpath=//td[contains(@class, 'today')]//../following-sibling::tr[1]//td[5]
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[1]/option[3]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[2]/option[2]
    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
    Sleep  1s
    Choose File  xpath=//div[@class='form-block__item']/form/div/input  ${file_path}
    Sleep  5s
    Run Keyword If  '${field_name}' == 'value.amountNet'  Редагувати вартість угоди без урахування ПДВ  ${value}
    Run Keyword If  '${field_name}' == 'value.amount'  Редагувати вартість угоди з урахуванням ПДВ  ${value}
    Wait Until Element Is Enabled  css=button[ng-click="act.saveContract('pending')"]  ${COMMONWAIT}
    Click Button  css=button[ng-click="act.saveContract('pending')"]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']
    sleep  5s
    ${amount}=  execute javascript  return document.getElementsByClassName('current-amount-input')[0].value;
    ${amountNet}=  execute javascript  return document.getElementsByClassName('current-amount-net-input')[0].value;

    ${amount}=   Replace String  ${amount}  ${SPACE}  ${EMPTY}
    ${amount}=  convert to number  ${amount}
    ${amountNet}=   Replace String  ${amountNet}  ${SPACE}  ${EMPTY}
    ${amountNet}=  convert to number  ${amountNet}

    Run Keyword And Return If  'Неможливість' in '${TEST_NAME}' and '${field_name}' == 'value.amount' and '${MODE}' == 'open_esco'
    ...  Should Be Equal As Numbers  ${value}  ${amount}
    ...  Can't update amount for contract value

    Run Keyword And Return If  'Неможливість' in '${TEST_NAME}' and '${field_name}' == 'value.amount'
    ...  Should Be Equal As Numbers  ${value}  ${amount}
    ...  Amount should be less or equal to awarded amount

    Run Keyword And Return If  'Неможливість' in '${TEST_NAME}' and '${field_name}' == 'value.amountNet'
    ...  Should Be Equal As Numbers  ${value}  ${amountNet}
    ...  Amount should be greater than amountNet and differ by no more than 20.0%

    Sleep  60s
    Reload Page


Редагувати вартість угоди без урахування ПДВ
    [Arguments]  ${value}
    Wait Until Element Is Enabled  xpath=//input[@data-id='contract-value-amount-net-input']
    Clear Element Text  xpath=//input[@data-id='contract-value-amount-net-input']
    ${value}=  Convert to String  ${value}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='contract-value-amount-net-input']  ${value}


Редагувати вартість угоди з урахуванням ПДВ
    [Arguments]  ${value}
    ${value}=  Convert to String  ${value}
    Run Keyword Unless  '${MODE}' == 'open_esco'
    ...  Run Keywords
    ...  Wait Until Element Is Enabled  xpath=//input[@data-id='contract-value-amount-input']  ${COMMONWAIT}
    ...  AND  Clear Element Text  xpath=//input[@data-id='contract-value-amount-input']
    ...  AND  Wait Element Visibility And Input Text  xpath=//input[@data-id='contract-value-amount-input']  ${value}
    Run Keyword If  '${MODE}' == 'open_esco'  Element Should Be Disabled  xpath=//input[@data-id='contract-value-amount-input']


Встановити дату підписання угоди
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${dateSigned}
    Reload Page
    Відкрити детальну інформацію про контракт
    ${signed}=  Execute Javascript  return new Date("${dateSigned}").getTime();
    Set Global Variable  ${contract_date_signed}  ${signed}
    Execute Javascript  var contractHash = angular.element('[data-id=contractHash]').text().trim(); angular.element('[ng-controller=contract_edit_ctrl]').scope().injectDates({id: contractHash,dateSigned: ${contract_date_signed}});
    Wait Until Element Is Enabled  css=button[ng-click="act.saveContract('pending')"]  ${COMMONWAIT}
    Click Button  css=button[ng-click="act.saveContract('pending')"]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']
    sleep  2s


Вказати період дії угоди
    [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${startDate}  ${endDate}
    Reload Page
    Відкрити детальну інформацію про контракт
    ${start}=  Execute Javascript  return new Date("${startDate}").getTime();
    Set Global Variable  ${contract_start_date}  ${start}
    ${end}=  Execute Javascript  return new Date("${endDate}").getTime();
    Set Global Variable  ${contract_end_date}  ${end}
    Execute Javascript  var contractHash = angular.element('[data-id=contractHash]').text().trim(); angular.element('[ng-controller=contract_edit_ctrl]').scope().injectDates({id: contractHash,startDate: ${contract_start_date}, endDate: ${contract_end_date}});
    Wait Until Element Is Enabled  css=button[ng-click="act.saveContract('pending')"]  ${COMMONWAIT}
    Click Button  css=button[ng-click="act.saveContract('pending')"]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']
    sleep  5s


Завантажити документ в угоду
    [Arguments]  ${username}  ${file_path}  ${tender_uaid}  ${contract_index}
    Reload Page
    Відкрити детальну інформацію про контракт
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[1]/option[6]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='form-block__item']/form/select[2]/option[2]
    Sleep  1s
    Choose File  xpath=//div[@class='form-block__item']/form/div/input  ${file_path}
    Sleep  5s
    Execute Javascript  var contractHash = angular.element('[data-id=contractHash]').text().trim(); angular.element('[ng-controller=contract_edit_ctrl]').scope().injectDates({id: contractHash,dateSigned: ${contract_date_signed}});
    Execute Javascript  var contractHash = angular.element('[data-id=contractHash]').text().trim(); angular.element('[ng-controller=contract_edit_ctrl]').scope().injectDates({id: contractHash,startDate: ${contract_start_date}, endDate: ${contract_end_date}});
    Wait Element Visibility And Input Text  css=input[data-id='contract.title']  ${tender_uaid}
    Wait Element Visibility And Input Text  css=#contractNumber  ${tender_uaid}
    Опублікувати договір  ${tender_uaid}
    sleep  60s


Отримати інформацію зі сторінки
    [Arguments]  ${user_name}  ${base_tender_uaid}  ${field_name}
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword And Return If  '${field_name}' == 'value.amount'  Convert Amount To Number  ${field_name}
    Run Keyword And Return If  'stage2_pending_status_view' in @{TEST_TAGS}  Дочекатися статусу
    Run Keyword And Return If  '${field_name}' == 'value.currency'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  'minimalStep.amount' in '${field_name}'  Convert Amount To Number  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'status'  Отримати інформацію з ${field_name}  ${user_name}  ${base_tender_uaid}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'qualifications[0].status'  Отримати статус пропозиції кваліфікації  1
    Run Keyword And Return If  '${field_name}' == 'qualifications[1].status'  Отримати статус пропозиції кваліфікації  2
    Run Keyword And Return If  '${field_name}' == 'title_en'  Отримати інформацію зі зміною локалізації  ${field_name}  EN
    Run Keyword And Return If  '${field_name}' == 'title_ru'  Отримати інформацію зі зміною локалізації  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'description_en'  Отримати інформацію зі зміною локалізації  ${field_name}  EN
    Run Keyword And Return If  '${field_name}' == 'description_ru'  Отримати інформацію зі зміною локалізації  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'causeDescription'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'cause'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'complaintPeriod.endDate'  Отримати інформацію з ${field_name}  ${field_name}  0
    Run Keyword And Return If  'complaintPeriod.endDate' in '${field_name}'  Отримати інформацію з awadrs.complaintPeriod.endDate
    Run Keyword And Return If  '${field_name}' == 'procurementMethodType'  Отримати інформацію з procurementMethodType
    Run Keyword And Return If  '].deliveryAddress.countryName_en' in '${field_name}'  Отримати інформацію із предмету зі зміною локалізації для пропозицій  ${field_name}  EN
    Run Keyword And Return If  '].deliveryAddress.countryName_ru' in '${field_name}'  Отримати інформацію із предмету зі зміною локалізації для пропозицій  ${field_name}  RU
    Run Keyword And Return If  '${field_name}' == 'items[0].deliveryDate.endDate'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'stage2TenderID'  Отримати інформацію з ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[0].title'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[1].title'  Отримати інформацію з features[0].title  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[1].description'  Отримати інформацію з features[0].title  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[0].featureOf'  Отримати інформацію з features[0].title  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'features[1].featureOf'  Отримати інформацію з features[0].title  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].title'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].description'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'questions[0].answer' or '${field_name}' == 'questions[2].answer' or '${field_name}' == 'questions[1].answer'  Отримати інформацію з questions.answer
    Run Keyword And Return If  '${field_name}' == 'contracts[0].status' or '${field_name}' == 'contracts[1].status'  Отримати статус договору  ${field_name}
    Run Keyword And Return If  'endDate' in '${field_name}' or 'startDate' in '${field_name}'  Отримати дату та час  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'agreementDuration'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'maxAwardsCount'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  'fundingKind' in '${field_name}'  Отримати інформацію з fundingKind  ${field_name}
    Run Keyword And Return If  'NBUdiscountRate' in '${field_name}'  Отримати інформацію з NBUdiscountRate  ${field_name}
    Run Keyword And Return If  'minimalStepPercentage' in '${field_name}'  Отримати інформацію з minimalStepPercentage  ${field_name}
    Run Keyword And Return If  'yearlyPaymentsPercentageRange' in '${field_name}'  Отримати інформацію з yearlyPaymentsPercentageRange  ${field_name}
    Run Keyword And Return If  'milestones' in '${field_name}'  Отримати інформацію про умови оплати  ${field_name}
    Run Keyword And Return If  'mainProcurementCategory' in '${field_name}'  Отримати інформацію про вид предмету закупівлі  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'agreements[0].status'  Отримати статус рамкової угоди  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'funders[0].name'  Get Element Attribute  xpath=//span[@data-id='founder-name']/parent::li@data-founder-name
    Run Keyword And Return If  '${field_name}' == 'funders[0].contactPoint.url'  Get Element Attribute  xpath=//span[@data-id='founder-contact-point-email']/parent::li@data-founder-contact-point-url
    Run Keyword And Return If  '${field_name}' == 'enquiryPeriod.clarificationsUntil'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'budget.amount'  Convert Amount To Number  ${field_name}
    Run Keyword If  '${field_name}' == 'agreements[0].agreementID' and 'framework_agreement' in '${scenarios_name}'  Відкрити детальну інформацію про рамкові угоди

    Wait Until Element Is Visible  ${tender_data_${field_name}}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із договору
    [Arguments]  ${user_name}  ${contract_uaid}  ${field_name}
    Wait For Element With Reload  css=div.change-info  1
    Wait Visibility And Click Element  xpath=//a[contains(@ng-click,'change.show')]
    Element Should Be Visible  xpath=//div[@ng-if='change.show']

    Run Keyword And Return If  '${field_name}' == 'changes[0].rationaleTypes'  Get contract rationalTypes  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'amountPaid.amount'  Отримати суму з контракту  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'period.startDate'  Отримати інформацію з contracts.period.startDate  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'period.endDate'  Отримати інформацію з contracts.period.endDate  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'status'  Отримати статус контракту  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'changes[0].status'  Отримати статус зміни  ${field_name}

    Wait Until Element Is Visible  ${contract_data_${field_name}}
    ${result_full}=  Get Text  ${contract_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із угоди
    [Arguments]  ${user_name}  ${agreement_uaid}  ${field_name}
    sleep  15s
    Reload Page
    Wait For Element With Reload  css=div.agreements  1
    Wait Visibility And Click Element  xpath=//*[text()='Зміни до рамкової угоди']

#    :FOR  ${i}  In Range  0  ${changes_count}
#    \  ${elem_index}=  Evaluate  ${i}+1
#    \  Scroll To Element  xpath=(//*[@data-id='change']//span[@data-id='change-open'])[${elem_index}]
#    \  Click Element  xpath=(//*[@data-id='change']//span[@data-id='change-open'])[${elem_index}]
    Wait Visibility And Click Element  xpath=(//*[@data-id='change']//span[@data-id='change-open'])[1]
    Run Keyword And Return If  'rationaleType' in '${field_name}'  Get Element Attribute  xpath=(//*[@data-id='change'])[1]//p[@data-id='rationale-type']@data-rationale-type
    Run Keyword And Return If  'rationale' in '${field_name}'  Get Text  xpath=(//*[@data-id='change'])[1]//div[@data-id='change-rationale']
    Run Keyword And Return If  'status' in '${field_name}'  Get Element Attribute  xpath=(//*[@data-id='change'])[1]//span[@data-id='change-status']@data-change-status
    Run Keyword And Return If  'modifications[0].itemId' in '${field_name}'  Get Element Attribute  xpath=(//*[@data-id='change'])[1]//div[@data-id='change-modification-description']@data-item-id
    Run Keyword And Return If  'modifications[0].contractId' in '${field_name}'  Get Element Attribute  xpath=(//*[@data-id='change'])[1]//div[@data-id='change-modification-description']@data-contract-id
    Run Keyword And Return If  'modifications[0].addend' in '${field_name}'  Get modifications.addend  ${field_name}
    Run Keyword And Return If  'modifications[0].factor' in '${field_name}'  Get modifications.factor  ${field_name}


Get modifications.addend
    [Arguments]  ${field_name}
    ${result}=  Get Text  xpath=(//*[@data-id='change'])[1]//div[@data-id='modification-addend']
    ${result}=  Replace String  ${result}  ,  .
    ${result}=  Convert To Number  ${result}
    [Return]  ${result}


Get modifications.factor
    [Arguments]  ${field_name}
    ${result}=  Get Text  xpath=(//*[@data-id='change'])[1]//div[@data-id='modification-factor']
    ${result}=  Replace String Using Regexp  ${result}  %$  ${EMPTY}
    ${result}=  Convert To Number  ${result}
    [Return]  ${result}


Отримати статус контракту
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  css=#contractStatus  ${COMMONWAIT}
    ${status_name}=  Get text  css=#contractStatus
    ${status_name}=  Strip String  ${status_name}
    ${status_type}=  Set Variable If
    ...  'Завершено' == '${status_name}'  terminated
    ...  ELSE  ${status_name}
    [Return]  ${status_type}


Отримати статус зміни
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  xpath=//div[@data-id='change-info']  ${COMMONWAIT}
    ${status}=  Get Element Attribute  xpath=//div[@data-id='change-info']@data-change-status
    [Return]  ${status}


Get contract rationalTypes
    [Arguments]  ${field_name}
	Wait Until Element Is Visible  xpath=${contract_data_rationale}  ${COMMONWAIT}
	@{rationales_list}=  Get WebElements  xpath=${contract_data_rationale}
	${rationales_count}=  Get Length  ${rationales_list}
	@{resulList}=  Create List
	:FOR   ${index}   IN RANGE  0  ${rationales_count}
	\  ${xpath_index}=  Evaluate  ${index}+1
    \  ${value}=  Get Text  xpath=(${contract_data_rationale})[${xpath_index}]
    \  ${value}=  Replace String  ${value}  ,  ${EMPTY}
	\  ${value}=  Strip String  ${value}
	\  ${rationaleType}=  privatmarket_service.get_rationaleType  ${value}
	\  Append To List  ${resulList}    ${rationaleType}
	[Return]  ${resulList}


Отримати суму з контракту
	[Arguments]  ${field_name}
	Wait Until Keyword Succeeds  10min  10s  Дочекатися публікації дійсно сплаченої суми договору
	${result_full}=  Get Text  //div[contains(@ng-repeat,'pays')]/div[2]
    ${text}=  Strip String  ${result_full}
    ${text_new}=  Replace String  ${text}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Дочекатися публікації дійсно сплаченої суми договору
    Reload Page
    Sleep  5s
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
    Wait Visibility And Click Element  xpath=//a[contains(@ng-click,'showPayms')]
    Element Should Be Visible  xpath=//div[contains(@ng-if,'showPayms')]


Отримати дату з контракту
    [Arguments]  ${field_name}
    ${date}=  Get Text  ${contract_data_${field_name}}
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${date}  %d.%m.%Y
    [Return]  ${result}


Дочекатися статусу
    Run Keyword And Return If  'дочекатися початку періоду очікування' in '${TEST_NAME}'  Wait For ActiveStage2Pending
    Run Keyword And Return If  'перевести тендер в статус очікування обробки мостом' in '${TEST_NAME}'  Wait For ActiveStage2Waiting


Wait For ActiveStage2Pending
    Wait Until Keyword Succeeds  10min  20s  Wait For Tender Status  active.stage2.pending
    ${status}=  Get Element Attribute  xpath=//div[@id='tenderStatus']@data-tender-status
    [Return]  ${status}


Wait For ActiveStage2Waiting
    Wait Until Keyword Succeeds  10min  20s  Wait For Tender Status  active.stage2.waiting
    ${status}=  Get Element Attribute  xpath=//div[@id='tenderStatus']@data-tender-status
    [Return]  ${status}


Wait For Tender Status
    [Arguments]  ${status}
    Reload Page
    Sleep  10s
    Page Should Contain Element    xpath=//div[@data-tender-status='${status}']


Отримати інформацію про вид предмету закупівлі
    [Arguments]  ${field_name}
    ${field_value}=  Отримати текст елемента  ${tender_data_${field_name}}
    ${text}=  Strip String  ${field_value}
    ${result}=  Set Variable If
    ...  '${text}' == 'Товар'  goods
    ...  '${text}' == 'Роботи'  works
    ...  '${text}' == 'Послуги'  services
    [Return]  ${result}


Отримати інформацію про умови оплати
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'milestones')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'milestones')]@class
    Run Keyword Unless  'checked' in '${class}'  Відкрити детальну інформацію про умови оплати

    ${field_value}=  Отримати текст елемента  ${tender_data_${field_name}}

    Run Keyword And Return If  'code' in '${field_name}'  privatmarket_service.get_milestones_code  ${field_value}
    Run Keyword And Return If  'title' in '${field_name}'  privatmarket_service.get_milestones_title  ${field_value}
    Run Keyword And Return If  'percentage' in '${field_name}'  Отримати інформацію з milestones.percentage  ${field_value}
    Run Keyword And Return If  'duration.days' in '${field_name}'  Отримати інформацію з milestones.duration.days  ${field_value}
    Run Keyword And Return If  'duration.type' in '${field_name}'  privatmarket_service.get_milestones_duration_type  ${field_value}


Отримати інформацію з enquiryPeriod.clarificationsUntil
    [Arguments]  ${field_value}
    Scroll To Element  css=a[href*='clarification']
    Wait Visibility And Click Element  css=a[href*='clarification']
    ${value}=  Отримати текст елемента  css=p[ng-if*='enquiryPeriod.clarificationsUntil']
    ${date}=  Get Regexp Matches  ${value}  (\\d{2}:\\d{2} \\d{2}.\\d{2}.\\d{4})  1
    ${date}=  Convert To String  ${date[0]}
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${date}  %H:%M %d.%m.%Y
    [Return]  ${result}


Отримати інформацію з milestones.duration.days
    [Arguments]  ${field_value}
    ${result}=  Convert To Number  ${field_value}
    [Return]  ${result}


Отримати інформацію з milestones.percentage
    [Arguments]  ${field_value}
    ${percent}=  Remove String  ${field_value}  %
    ${result}=  Convert To Number  ${percent}
    [Return]  ${result}


Отримати інформацію з questions[0].title
    [Arguments]  ${field_name}
    Wait For Element With Reload  ${tender_data_lot_question.${field_name}}  1
    ${result}=  Отримати текст елемента  ${tender_data_lot_question.${field_name}}
    [Return]  ${result}


Отримати інформацію з questions[0].description
    [Arguments]  ${field_name}
    Wait For Element With Reload  ${tender_data_lot_question.${field_name}}  1
    ${result}=  Отримати текст елемента  ${tender_data_lot_question.${field_name}}
    [Return]  ${result}


Отримати інформацію з questions.answer
    ${text_for_xpath}=  Set Variable If
    ...  'відповіді на запитання на всі лоти' in '${TEST_NAME}'  по лоту
    ...  'відповіді на запитання на всі предмети' in '${TEST_NAME}'  по позиції
    ...  'відповіді на запитання на тендер' in '${TEST_NAME}'  по закупівлі

    ${current_xpath}=  set variable   xpath=(//div[contains(text() , '${text_for_xpath}')]/../..//div[@class='question-div'])[2]

     Run Keyword If
    ...  'запитання на тендер' in '${TEST_NAME}'  Wait For Element With Reload  ${current_xpath}  2
    ...  ELSE  Wait For Element With Reload  ${current_xpath}  1

    ${result}=  Отримати текст елемента  ${current_xpath}
    [Return]  ${result}


Отримати статус рамкової угоди
    [Arguments]  ${field_name}
    Wait For Element With Reload  xpath=//span[contains(@data-id,'agreement-id')]  1
    ${status}=  Get Element Attribute  xpath=//span[contains(@data-id,'agreement-id')]@data-agreement-status
    [Return]  ${status}


Отримати інформацію з agreementDuration
    [Arguments]  ${field_name}
    ${result}=  Get Element Attribute  xpath=//*[@class='agreement-duration']@agreement-duration
    [Return]  ${result}


Отримати інформацію з maxAwardsCount
    [Arguments]  ${field_name}
    Wait For Ajax
    ${count}=  Get Element Attribute  xpath=//div[@data-id='maxAwardsCount']@innerHTML
    ${result}=  Convert To Integer  ${count}
    [Return]  ${result}


Отримати інформацію з fundingKind
    [Arguments]  ${field_name}
    ${text}=  Отримати текст елемента  ${tender_data_${field_name}}
    ${result}=  Set Variable If
    ...  'з бюджетних коштів' in '${text}'  budget
    ...  'за рахунок Учасника' in '${text}'  other
    [Return]  ${result}


Отримати інформацію з NBUdiscountRate
    [Arguments]  ${field_name}
    ${text}=  Отримати текст елемента  ${tender_data_${field_name}}
    ${result}=  Привести відсоток до частини від цілого  ${text}
    [Return]  ${result}


Отримати інформацію з minimalStepPercentage
    [Arguments]  ${field_name}
    ${text}=  Отримати текст елемента  ${tender_data_${field_name}}
    ${result}=  Привести відсоток до частини від цілого  ${text}
    [Return]  ${result}


Отримати інформацію з yearlyPaymentsPercentageRange
    [Arguments]  ${field_name}
    ${text}=  Отримати текст елемента  ${tender_data_${field_name}}
    ${result}=  Привести відсоток до частини від цілого  ${text}
    [Return]  ${result}


Привести відсоток до частини від цілого
    [Arguments]  ${text}
    ${rate}=  Remove String Using Regexp  ${text}  \\s%$
    ${rate}=  Convert To Number  ${rate}  3
    ${result}=  Evaluate  ${rate}/${100}
    ${result}=  Evaluate  "%.5f" % ${result}
    ${result}=  Convert To Number  ${result}
    [Return]  ${result}


Привести до відсотків
    [Arguments]  ${text}
    ${variable}=  Convert To Number  ${text}
    ${result}=  Evaluate  ${variable}*${100}
    ${result}=  Convert To String  ${result}
    [Return]  ${result}


Отримати інформацію із лоту
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Execute JavaScript    window.scrollTo(${0},${0})
    ${className}=  Get Element Attribute  xpath=//section[@id='lotSection']/section[contains(., '${object_id}')]//a[1]@class
    Run Keyword If  '${className}' == 'nav-item'  Wait Visibility And Click Element  //section[@id='lotSection']/section[contains(., '${object_id}')]//a[1]
    ${element}=  Set Variable  xpath=(//section[@id='lotSection']/section[contains(., '${object_id}')]${tender_data_lot.${field_name}}

    Run Keyword And Return If  '${field_name}' == 'value.amount'  Convert Amount To Number  ${element}
    Run Keyword And Return If  '${field_name}' == 'value.currency'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.amount'  Отримати суму  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.currency'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'minimalStep.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${element}

    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із предмету
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Відкрити детальну інформацію по позиціям
    ${info}=  Set Variable  xpath=//div[@class='lot-info']/section[contains(., '${object_id}')]//div[@class='info-item-val']/div[@class='description']/a
    ${element_present_status}=  Run Keyword And Return Status  Element Should Be Visible  ${element_name}
    Run Keyword unless  ${element_present_status}  Wait For Element With Reload  ${info}  1
    ${info_class}=  Get Element Attribute  ${info}@class
    Run Keyword Unless  'checked-item' in '${info_class}'  Click Element  ${info}
    ${element}=  Set Variable  xpath=(//div[@class='lot-info']/section[contains(., '${object_id}')]${tender_data_item.${field_name}}

    Run Keyword And Return If  '${field_name}' == 'deliveryDate.startDate'  Отримати інформацію з deliveryDate  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryDate.endDate'  Отримати інформацію з deliveryDate  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryLocation.latitude'  Отримати число  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'deliveryLocation.longitude'  Отримати число  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'additionalClassifications[0].scheme'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'unit.name'  Отримати інформацію з ${field_name}  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'unit.code'  Отримати інформацію з ${field_name}  ${element}
    Run Keyword And Return If  '${field_name}' == 'quantity'  Отримати суму  ${element}
    Run Keyword And Return If  '${field_name}' == 'deliveryAddress.countryName_ru'  Отримати інформацію із предмету зі зміною локалізації  ${field_name}  ${object_id}  RU
    Run Keyword And Return If  '${field_name}' == 'deliveryAddress.countryName_en'  Отримати інформацію із предмету зі зміною локалізації  ${field_name}  ${object_id}  EN

    Wait Until Element Is Visible  ${element}  timeout=${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із плану
    [Arguments]  ${username}  ${tender_uaid}  ${field_name}
    Відкрити детальну інформацію по плану

    Run Keyword And Return If  '${field_name}' == 'status'  Отримати статуc плану  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'tender.procurementMethodType'  Отримати тип запланованого тендера  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'budget.amount'  Convert Amount To Number  ${tender_data_value.amount}
    Run Keyword And Return If  '${field_name}' == 'budget.currency'  Отримати інформацію з value.currency  value.currency
    Run Keyword And Return If  '${field_name}' == 'tender.tenderPeriod.startDate'  Отримати та привести дату до заданого формату  xpath=//div[@data-id='plan-purchase-beg']

    ${index}=  privatmarket_service.get_match_from_string  ${field_name}  items\\[(.+?)\\]  1
    ${status}=  Set Variable If  '${index}' == 'null'  'false'  'true'
    Run Keyword And Return If  ${status} == 'true'  Отримати інформацію для item  ${index}  '${field_name}'

    Wait Until Element Is Visible  ${tender_data_${field_name}}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію для item
    [Arguments]  ${index}  ${field_name}
    ${index}=  privatmarket_service.sum_of_numbers  ${index}  1
    Run Keyword And Return If  '].description' in ${field_name}  Отримати текст з item  xpath=(//a[@data-id='plan-classifications-toggle'])[${index}]
    Run Keyword And Return If  'quantity' in ${field_name}  Отримати кількості необхідних одиниць об'єкта  xpath=(//span[@class='item-count ng-binding'])[${index}]
    Run Keyword And Return If  'unit.name' in ${field_name}  Отримати текст з item  xpath=(//span[contains(@class,'item-unit')])[${index}]
    Run Keyword And Return If  'unit.code' in ${field_name}  Отримати інформацію з unit.code  xpath=(//span[contains(@class,'item-unit')])[${index}]
    Run Keyword And Return If  'classification.description' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-description'])[${index}]
    Run Keyword And Return If  'classification.scheme' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-scheme'])[${index}]
    Run Keyword And Return If  'classification.id' in ${field_name}  Отримати текст з item  xpath=(//*[@data-id='item-classif-id'])[${index}]
    Run Keyword And Return If  'deliveryDate.endDate' in ${field_name}  Отримати та привести дату до заданого формату  xpath=(//div[@class='info-item-val normal-font ng-binding'])[${index}]
    ${text_element}=  Get text  ${field_name}
    [Return]  ${result}


Отримати текст з item
    [Arguments]  ${locator}
    ${text_element}=  Get text  ${locator}
    ${result}=  Strip String  ${text_element}
    [Return]  ${result}


Отримати кількості необхідних одиниць об'єкта
    [Arguments]  ${locator}
    ${text_element}=  Get text  ${locator}
    ${result}=  Strip String  ${text_element}
    ${text_new}=  Replace String  ${result}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати та привести дату до заданого формату
    [Arguments]  ${locator}
    ${date}=  Отримати текст з item  ${locator}
    ${result_date} =  Get Regexp Matches  ${date}  ^(\\d{2}\.\\d{2}\.\\d{4})  1
    ${result_date} =  Convert To String  ${result_date[0]}
    ${result}=  get_time_with_offset_formatted  ${result_date}  %d.%m.%Y
    [Return]  ${result}


Відкрити детальну інформацію по плану
    Wait Until Element Is Visible  xpath=//a[contains(@ng-click, 'itemShowTab')]

    ${count}=  Get Matching Xpath Count  .//section//a[contains(@class, 'nav-item ng-binding checked')]
    Run Keyword if  ${count} == 0  Click Element  xpath=//a[contains(@ng-click, 'itemShowTab')]

    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'checked-item')]
    ${count}=  Get Matching Xpath Count  xpath=//section//div[@class='description']/a
    Run Keyword if  ${count} != 0  Відкрити itemObject  ${count}


Відкрити itemObject
    [Arguments]  ${count}
    ${iterator}=  privatmarket_service.sum_of_numbers  ${count}  1
    :FOR  ${i}  In Range  1  ${iterator}
    \  ${class}=  Get Element Attribute  xpath=(//section//div[@class='description']/a)[${i}]@class
    \  Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//section//div[@class='description']/a)[${i}]


Отримати інформацію про постачальника
    [Arguments]  ${tender_uaid}  ${field_name}
    ${open_status}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath=//img[contains(@ng-src, 'icon-minus.png')]  1s
    Run Keyword Unless  ${open_status}  Відкрити детальну інформацію про постачальника
    Run Keyword And Return If  '${field_name}' == 'awards[0].status'  Отримати статус заявки  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.valueAddedTaxIncluded'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.currency'  Отримати інформацію з ${field_name}  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.amount' or '${field_name}' == 'awards[1].value.amount'  Отримати інформацію з awards.value.amount  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].status'  Отримати статус договору  ${field_name}
    Wait Until Element Is Visible  ${tender_data_${field_name}}  ${COMMONWAIT}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з контракту
    [Arguments]  ${tender_uaid}  ${field_name}
#    Відкрити детальну інформацію про контракт
    Run Keyword And Return If  '${field_name}' == 'awards[0].value.amount' or '${field_name}' == 'awards[1].value.amount'  Отримати інформацію про постачальника  ${tender_uaid}  ${field_name}
    Wait Until Keyword Succeeds  10min  10s  Дочекатися відображення активного контракту
    Run Keyword And Return If  '${field_name}' == 'contracts[0].value.amount' or '${field_name}' == 'contracts[1].value.amount'  Отримати вартість угоди  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].value.amountNet' or '${field_name}' == 'contracts[1].value.amountNet'  Отримати вартість угоди  ${field_name}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].period.startDate' or '${field_name}' == 'contracts[1].period.startDate'  Отримати інформацію з contracts.period.startDate  ${tender_data_${field_name}}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].period.endDate' or '${field_name}' == 'contracts[1].period.endDate'  Отримати інформацію з contracts.period.endDate  ${tender_data_${field_name}}
    Run Keyword And Return If  '${field_name}' == 'contracts[0].dateSigned' or '${field_name}' == 'contracts[1].dateSigned'  Отримати інформацію з contracts.dateSigned  ${tender_data_${field_name}}
    Run Keyword And Return If  '${field_name}' == 'awards' and 'вартості угоди без урахування ПДВ' in '${TEST_NAME}'  Отримати вартість угоди без урахування ПДВ
    Run Keyword And Return If  '${field_name}' == 'awards' and 'вартості угоди' in '${TEST_NAME}'  Отримати вартість угоди  ${field_name}
    Wait Until Element Is Visible  ${tender_data_${field_name}}  ${COMMONWAIT}
    ${result_full}=  Get Text  ${tender_data_${field_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Дочекатися відображення активного контракту
    Reload Page
    Відкрити детальну інформацію про контракт
    Wait Until Element Is Visible  xpath=//div[contains(@class,'contracts info')] | //div[contains(@class,'contract-body')]


Отримати вартість угоди
    [Arguments]  ${field_name}
    ${xpath}=  Set Variable  xpath=//*[@id='contractAmount'] | //input[@data-id='contract-value-amount-input']
    Wait Until Element Is Visible  ${xpath}  ${COMMONWAIT}
    ${text}=  Get Text  ${xpath}
#    ${text}=  Run Keyword If  '${text}' == ${EMPTY}  Get Value  ${xpath}
    ${text}=  Replace String Using Regexp  ${text}  \\W+$  ${EMPTY}
    ${text_new}=  Strip String  ${text}
    ${value}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${value}
    [Return]  ${result}


Отримати вартість угоди без урахування ПДВ
    ${xpath}=  Set Variable  xpath=//*[text()='Ціна договору без ПДВ:']/following-sibling::dd | //input[@data-id='contract-value-amount-input']
    Wait Until Element Is Visible  ${xpath}  ${COMMONWAIT}
    ${text}=  Run Keyword If  ${ROLE} == 'viewer
    ...  Get Text  ${xpath}
    ...  ELSE  Get Value  ${xpath}
#    ${text}=  Run Keyword If  '${text}' == '${EMPTY}'  Get Value  ${xpath}
    ${text}=  Replace String Using Regexp  ${text}  \\W+$  ${EMPTY}
    ${text_new}=  Strip String  ${text}
    ${value}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${value}
    [Return]  ${result}


Отримати дату підписання угоди
    [Arguments]  ${field_name}
    ${result}=  Get Text  ${field_name}
    ${result_full}=  Split String  ${result}  ${SPACE}
    ${date}=  Set Variable  ${result_full[2]}
    ${result}=  get_time_with_offset_formatted  ${date}  %d.%m.%Y
    [Return]  ${result}


Отримати інформацію із запитання
    [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field_name}
    ${element}=  Set Variable If
    ...  'запитання на тендер' in '${TEST_NAME}'  xpath=(//div[contains(@class, 'faq') and contains(., '${question_id}')]${tender_data_question.${field_name}}
    ...  'запитання на всі лоти' in '${TEST_NAME}'  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]${tender_data_lot_question.${field_name}}
    ...  'запитання на всі предмети' in '${TEST_NAME}'  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]${tender_data_lot_question.${field_name}}

    Run Keyword If
    ...  'запитання на тендер' in '${TEST_NAME}'  Wait For Element With Reload  ${element}  2
    ...  ELSE  Wait For Element With Reload  ${element}  1

    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із документа
    [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
    sleep  60s
    Reload Page
    Run Keyword If  'add_doc_to_contract' in @{TEST_TAGS} or 'contract_doc_documentOf' in @{TEST_TAGS}
    ...  Відкрити детальну інформацію про контракт

    Run Keyword And Return If  'contract_doc_documentOf' in @{TEST_TAGS}  Отримати documentOf  ${doc_id}

    Run Keyword If  'add_doc_to_contract' in @{TEST_TAGS}
    ...  Wait Until Element Is Visible  xpath=//div[contains(@${field},'${doc_id}')]  ${COMMONWAIT}
    ...  ELSE  Wait For Element With Reload  xpath=//div[contains(@${field},'${doc_id}')]  1

    Run Keyword Unless  'contract_doc_documentOf' in @{TEST_TAGS}
    ...  Wait Until Element Is Visible  xpath=//div[contains(@${field},'${doc_id}')]  ${COMMONWAIT}
    ${result}=  Get Text  xpath=//div[contains(@${field},'${doc_id}')]
    [Return]  ${result}


Отримати інформацію із нецінового показника
    [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
    Відкрити детальну інформацію по позиціям

    ${element}=  Set Variable IF
        ...  '${field_name}' == 'featureOf'  xpath=//div[contains(@class, 'feature name') and contains(., '${object_id}')]${tender_data_feature.${field_name}}
        ...  xpath=//div[contains(@class, 'feature name') and contains(., '${object_id}')]

    Run Keyword And Return If  '${field_name}' == 'title'  Отримати інформацію з feature  ${element}  0
    Run Keyword And Return If  '${field_name}' == 'description'  Отримати інформацію з feature  ${element}  1
    Run Keyword And Return If  '${field_name}' == 'featureOf'  Отримати інформацію з ${field_name}  ${element}

    Wait Until Element Is Visible  ${element}  timeout=${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію із скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${field_name}  ${award_index}
    ${element}=  Set Variable  xpath=//div[contains(@class, 'faq') and contains(., '${complaintID}')]${tender_data_complaint.${field_name}}
    ${test_case_name}=  Remove String  ${TEST_NAME}  '
    Run Keyword If
    ...  '${test_case_name}' == 'Відображення поданого статусу вимоги'  Search by status  ${element}[contains(@data-status,'claim')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled вимоги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу pending вимоги'  Search by status  ${element}[contains(@data-status,'pending')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled скарги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled скарги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу ignored вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'ignored')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу declined вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'declined')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу invalid вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'invalid')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу invalid вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'invalid')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу declined вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'declined')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу cancelled чернетки вимоги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу cancelled після draft -> claim вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу cancelled після draft -> claim -> answered вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'cancelled')]  3
    ...  ELSE IF  'Відображення статусу pending після draft -> claim -> answered вимоги' in '${test_case_name}'  Search by status  ${element}[contains(@data-status,'pending')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення умов закупівлі'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу answered вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'answered')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу resolved вимоги про виправлення умов лоту'  Search by status  ${element}[contains(@data-status,'resolved')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення кінцевих статусів двох останніх вимог' and '${award_index}' == '0'  Search by status  ${element}[contains(@data-status,'invalid')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення кінцевих статусів двох останніх вимог' and '${award_index}' == 'none'  Search by status  ${element}[contains(@data-status,'declined')]  3
    ...  ELSE IF  '${test_case_name}' == 'Відображення статусу stopping скарги про виправлення визначення переможця'  Search by status  ${element}[contains(@data-status,'stopping')]  3
    ...  ELSE  run keyword  Search by status  ${element}  3
    ${result_full}=  Get Text  ${element}
    ${result}=  Strip String  ${result_full}
    Run Keyword And Return If  '${field_name}' == 'status'  privatmarket_service.get_claim_status  ${result}
    Run Keyword And Return If  '${field_name}' == 'resolutionType'  Отримати resolutionType  ${result}
    Run Keyword And Return If  '${field_name}' == 'satisfied'  Отримати статус вирішення  ${result}
    [Return]  ${result}


Search by status
    [Arguments]  ${locator}  ${tab_number}
    Wait Until Keyword Succeeds  20min  10s  Try To Search Complaint  ${locator}  3


Try To Search Complaint
    [Arguments]  ${locator}  ${tab_number}
    Reload And Switch To Tab  ${tab_number}
    Wait For Ajax
    Wait Until Element Is Visible  ${locator}  5s


Отримати тип запланованого тендера
    [Arguments]  ${element}
    Wait For Ajax
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Run Keyword If  'Допорогові закупівлі' == '${text}'  Set Variable  belowThreshold
    [Return]  ${result}


Отримати resolutionType
    [Arguments]  ${text}
    ${text}=  Set Variable If  'Рішення замовника: задоволено' in '${text}'  resolved
    [Return]  ${text}


Отримати статус вирішення
    [Arguments]  ${text}
    ${text}=  Set Variable If
    ...  'так' in '${text}'  ${TRUE}
    ...  'ні' in '${text}'  ${FALSE}
    ...  ${text}
    [Return]  ${text}


Відкрити детальну інформацію про контракт
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-cont')])[1]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-cont')])[1]


Відкрити детальну інформацію про постачальника
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]@class
    Run Keyword Unless  'checked-nav' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Run keyword And Ignore Error  Wait Visibility And Click Element  xpath=//img[contains(@ng-src, 'icon-plus')]


Відкрити детальну інформацію про умови оплати
    ${count}=  Get Matching Xpath Count  xpath=//a[contains(@ng-class, 'milestones')]

    :FOR  ${i}  In Range  0  ${count}
    \  ${elem_index}=  Evaluate  ${i}+1
    \  Scroll To Element  xpath=(//a[contains(@ng-class, 'milestones')])[${elem_index}]
    \  Click Element  xpath=(//a[contains(@ng-class, 'milestones')])[${elem_index}]


Відкрити детальну інформацію про рамкові угоди
    ${class}=  Get Element Attribute  xpath=//a[@id='agreementBtn']@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[@id='agreementBtn']


Отримати статус заявки
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  ${tender_data_${field_name}}  ${COMMONWAIT}
    ${status_name}=  Get text  ${tender_data_${field_name}}
    ${status_type}=  Set Variable If
    ...  'Переможець переговорів' == '${status_name}'  active
    ...  ELSE  ${status_name}
    [Return]  ${status_type}


Отримати статуc плану
    [Arguments]  ${field_name}
    Wait Until Element Is Visible  css=div.c-card>.c-card-status  ${COMMONWAIT}
    ${status_name}=  Get text  css=div.c-card>.c-card-status
    ${status_type}=  Set Variable If
    ...  'Запланований' == '${status_name}'  scheduled
    ...  'Скасований' == '${status_name}'  cancelled
    ...  ELSE  ${status_name}
    [Return]  ${status_type}


Отримати статус договору
    [Arguments]  ${field_name}
    Відкрити детальну інформацію про контракт

    Run Keyword If  'статусу підписаної угоди з постачальником' in '${TEST_NAME}'
    ...  Wait For Element With Reload  xpath=//span[contains(., 'Підписаний') and contains(@id, 'contractStatus')]  1

    ${status}  ${status_name}=  Run Keyword And Ignore Error  Get text  ${tender_data_${field_name}}
    ${status_name}=  Run Keyword If
    ...  '${status}' == 'PASS'  Set Variable  ${status_name}
    ...  ELSE  Set Variable  'Очiкує пiдписання'
    ${status_name}=  Replace String  ${status_name}  '  ${EMPTY}

    ${status_type}=  Run Keyword If
    ...  'Очiкує пiдписання' == '${status_name}'  Set Variable  pending
    ...  ELSE IF  'Підписаний' == '${status_name}'  Set Variable  active
    ...  ELSE  Set Variable  ${status_name}
    Reload Page
    [Return]  ${status_type}


Отримати інформацію із документа до скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${field}
    ${element} =  Set Variable  xpath=//a[contains(.,'Показати вкладені файли') and not(contains(., '(0)'))]
    Показати вкладені файли  ${element}
    ${complaint}=  Set Variable  xpath=//span[@data-id='complaint-id' and text()='${complaintID}']
    Scroll To Element  ${complaint}
    ${element_new}=  Set Variable  xpath=(//div[contains(@title,'${doc_id}')])
    Wait Until Element Is Visible  xpath=(//div[contains(@title,'${doc_id}')])
    ${doc_text} =  Get Text  ${element_new}
    [Return]  ${doc_text}


Показати вкладені файли
     [Arguments]  ${element}
     ${status}=  Run Keyword And Return Status  Wait For Element With Reload  ${element}  3  3
     Wait For Ajax
     Run Keyword If  '${status}' == 'True'  Click Element  ${element}


Scroll To Element
  [Arguments]  ${locator}
  ${elem_vert_pos}=  Get Vertical Position  ${locator}
  Execute Javascript  window.scrollTo(0,${elem_vert_pos - 300});


Отримати статус пропозиції кваліфікації
    [Arguments]  ${item}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Until Element Is Visible  css=.bids>tbody>tr:nth-of-type(${item})>td:nth-of-type(3)  timeout=${COMMONWAIT}

    ${elem_text}=  Get Text  xpath=(//span[@data-id='status'])[${item}]
    ${status_text}=  Split String  ${elem_text}  \n
    ${status}=  Strip String  ${status_text[0]}
    ${result}=  privatmarket_service.get_status_type  ${status}
    [Return]  ${result}


Отримати документ до лоту
    [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${doc_id}
    ${file_name}=  privatmarket.Отримати документ  ${username}  ${tender_uaid}  ${doc_id}
    [Return]  ${file_name}


Отримати документ до скарги
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${award_id}=${None}
    Wait For Element With Reload  xpath=//div[contains(@title,'${doc_id}')]  3
    Scroll Page To Element  xpath=//div[contains(@title,'${doc_id}')]
    Wait Visibility And Click Element  xpath=//div[contains(@title,'${doc_id}')]
    # Добален слип, т.к. док не успевал загрузиться
    sleep  20s
    ${file_name_full}=  Get Text  xpath=//div[contains(@title,'${doc_id}')]
    ${file_name}=  Strip String  ${file_name_full}
    [Return]  ${file_name}


Отримати документ
    [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
    sleep  30s
    Reload Page
    Run Keyword If  'add_doc_to_contract' in @{TEST_TAGS} or 'contract_doc_documentOf' in @{TEST_TAGS}
    ...  Відкрити детальну інформацію про контракт

    Run Keyword If  'add_doc_to_contract' in @{TEST_TAGS} or 'contract_doc_documentOf' in @{TEST_TAGS}
    ...  Wait Until Element Is Visible  xpath=//div[contains(@title,'${doc_id}')]  ${COMMONWAIT}
    ...  ELSE  Wait For Element With Reload  xpath=//div[contains(@title,'${doc_id}')]  1

#    Wait For Element With Reload  xpath=//div[contains(@title,'${doc_id}')]  1
    Scroll Page To Element  xpath=//div[contains(@title,'${doc_id}')]
    Wait Visibility And Click Element  xpath=//div[contains(@title,'${doc_id}')]
    # Добален слип, т.к. док не успевал загрузиться
    sleep  20s
    ${file_name_full}=  Get Text  xpath=//div[contains(@title,'${doc_id}')]
    ${file_name}=  Strip String  ${file_name_full}
    [Return]  ${file_name}


Отримати посилання на аукціон для глядача
    [Arguments]  ${user}  ${tenderId}  ${object_id}=${Empty}
    Wait For Element With Reload  xpath=//a[contains(@href, 'https://auction-sandbox.prozorro.gov.ua/')]  1  30
    ${result}=  Get Element Attribute  xpath=//a[contains(@href, 'https://auction-sandbox.prozorro.gov.ua/')]@href
    [Return]  ${result}


Відкрити модальне вікно з посиланням на аукціон
    Wait Visibility And Click Element  css=button#takepartLink


Відповісти на запитання
    [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
    Run Keyword And Return If  'на всі лоти' in '${TEST_NAME}'  Відповісти на запитання на лот  ${answer_data}  ${question_id}
    Run Keyword And Return If  'на всі предмети' in '${TEST_NAME}'  Відповісти на запитання на лот  ${answer_data}  ${question_id}

    Switch To Tab  2
    Wait For Element With Reload  xpath=//button[contains(@ng-click, 'act.answerFaq')]  2
    Wait Visibility And Click Element  xpath=//button[contains(@ng-click, 'act.answerFaq')]
    Wait Element Visibility And Input Text  id=questionAnswer  ${answer_data.data.answer}
    Sleep  2s
    Wait Visibility And Click Element  id=btnSendAnswer
    Wait For Notification  Ваша відповідь успішно відправлена!
    Wait Visibility And Click Element  css=button[data-id='btn-close']
    Sleep  90s


Відповісти на запитання на лот
    [Arguments]  ${answer_data}  ${question_id}
    ${element}=  Set Variable  xpath=//div[contains(@class, 'lot-info') and contains(., '${question_id}')]//button
    Wait For Element With Reload  ${element}  1
    Wait Visibility And Click Element  ${element}
    Wait Element Visibility And Input Text  id=questionAnswer  ${answer_data.data.answer}
    Sleep  2s
    Wait Visibility And Click Element  id=btnSendAnswer
    Wait For Notification  Ваша відповідь успішно відправлена!
    Wait Visibility And Click Element  id=btnClose
    Sleep  90s


Отримати інформацію з value.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати строку  ${element_name}  0
    ${currency_type}=  get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з stage2TenderID
    ${type}=  Отримати текст елемента  xpath=//div[@class='info-item']//div[2]//span[1]
    [Return]  ${type}


Отримати інформацію з features[0].title
    [Arguments]  ${element_name}
    Reload Page
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked-nav' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot.showTab')])[1]
    Відкрити детальну інформацію по позиціям
    Wait Until Element Is Visible  ${tender_data_${element_name}}
    ${result_full}=  Get Text  ${tender_data_${element_name}}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з awards[0].value.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати текст елемента  ${element_name}
    ${currency_type}=  privatmarket_service.get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з awards.value.amount
    [Arguments]  ${element_name}
    ${text}=  Отримати текст елемента  ${element_name}
    ${text_new}=  Strip String  ${text}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з awards[0].value.amount
    [Arguments]  ${element_name}
    ${text}=  Отримати текст елемента  ${element_name}
    ${text_new}=  Strip String  ${text}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з value.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з awards[0].value.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з minimalStep.currency
    [Arguments]  ${element_name}
    ${currency}=  Отримати строку  ${element_name}  0
    ${currency_type}=  get_currency_type  ${currency}
    [Return]  ${currency_type}


Отримати інформацію з minimalStep.valueAddedTaxIncluded
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з типу податку
    [Arguments]  ${element}
    ${value_added_tax_included}=  Get text  ${element}
    ${result}=  Set Variable If  'з ПДВ' in '${value_added_tax_included}'  True
    ${result}=  Convert To Boolean  ${result}
    [Return]  ${result}


Отримати інформацію з unit.code
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_unit_code  ${result_full}
    [Return]  ${result}


Отримати інформацію з quantity
    [Arguments]  ${element_name}
    ${result_full}=  Get Text  ${element_name}
    ${result}=  Strip String  ${result_full}
    ${result}=  Replace String  ${result}  .00  ${EMPTY}
    ${result}=  Strip String  ${result}
    [Return]  ${result}


Отримати інформацію з classification.scheme
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_classification_type  ${result_full}
    [Return]  ${result}


Отримати інформацію з additionalClassifications[0].scheme
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    ${result_full}=  Get Text  ${element}
    ${result}=  privatmarket_service.get_classification_type  ${result_full}
    [Return]  ${result}


Отримати інформацію з status
    [Arguments]  ${user_name}  ${tender_uaid}  ${element_name}
    privatmarket.Оновити сторінку з тендером
    Wait Until Element Is Visible  ${tender_data_${element_name}}  ${COMMONWAIT}
    Sleep  5s
    ${status_name}=  Get Element Attribute  ${tender_data_status}@data-tender-status
    [Return]  ${status_name}


Звірити статус
    [Arguments]  ${user_name}  ${tender_uaid}
    ${current_status}=  Отримати інформацію з status  ${user_name}  ${tender_uaid}  status
    Should Be Equal  active.awarded  ${current_status}  msg=Statuses are not equal


Отримати інформацію з feature
    [Arguments]  ${element}  ${id}
    Wait For Element With Reload  ${element}  1
    ${result_full}=  Отримати текст елемента  ${element}
    ${result_full}=  Strip String  ${result_full}
    ${values_list}=  Split String  ${result_full}  \n
    ${result}=  Set Variable  ${values_list[${id}]}
    [Return]  ${result}


Отримати інформацію з featureOf
    [Arguments]  ${element}
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Set Variable If
    ...  'по закупівлі' in '${text}'  tenderer
    ...  'по позиції' in '${text}'  item
    ...  'по лоту' in '${text}'  lot
    [Return]  ${result}


Отримати documentOf
    [Arguments]  ${doc_id}
    Wait Until Element Is Visible  xpath=//div[contains(@title,'${doc_id}')]  ${COMMONWAIT}
    ${documentOf}=  Get Element Attribute  xpath=//div[contains(@title,'${doc_id}')]@document-of
    [Return]  ${documentOf}


Отримати інформацію з causeDescription
    [Arguments]  ${element}
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//div[@id='tenderType']/a
    ${result_full}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${result_full}
    [Return]  ${result}


Отримати інформацію з cause
    [Arguments]  ${element}
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//div[@id='tenderType']/a
    ${result_full}=  Отримати текст елемента  ${element}
    ${result_full}=  Strip String  ${result_full}
    ${result}=  privatmarket_service.get_cause  ${result_full}
    [Return]  ${result}


Отримати інформацію з procurementMethodType
    ${type}=  Отримати текст елемента  xpath=//*[@data-id='tender-type']
    ${type}=  get_procurementMethod_Type  ${type}
    ${type}=  Set Variable  ${type}
    [Return]  ${type}


Отримати інформацію зі зміною локалізації
    [Arguments]  ${element}  ${lang}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]//li[contains(text(),'${lang}')]
    Wait For Ajax
    ${element}=  Set Variable If
    ...  'title' in '${element}'  title
    ...  'description' in '${element}'  description
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]//li[contains(text(),'UK')]
    [Return]  ${result}


Отримати інформацію із предмету зі зміною локалізації
    [Arguments]  ${field_name}  ${object_id}  ${lang}
    ${index}=  Get Item Number  ${object_id}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//li[contains(@class, 'change-language-item') and contains(., '${lang}')]
    Wait Until Element Is Visible  xpath=//li[contains(@class, 'change-language-item') and contains(., '${lang}')]/b
    Wait For Ajax
    Відкрити детальну інформацію по позиціям
    ${element}=  Set Variable  xpath=(//section[@id='subject-section']${tender_data_item.${field_name}}[${index}]
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//li[contains(@class, 'change-language-item') and contains(., 'UK')]
    [Return]  ${result}


Отримати інформацію із предмету зі зміною локалізації для пропозицій
    [Arguments]  ${field_name}  ${lang}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]//li[contains(text(),'${lang}')]
    Wait For Ajax
    Відкрити детальну інформацію по позиціям
    ${index}=  privatmarket_service.get_match_from_string  ${field_name}  items\\[(.+?)\\]  1
    ${index_xpath}=  privatmarket_service.sum_of_numbers  ${index}  1

    ${element}=  Set Variable If
    ...  '].deliveryAddress.countryName' in '${field_name}'  xpath=(//*[@data-id='address.countryName'])[${index_xpath}]
    ${text}=  Отримати текст елемента  ${element}
    ${result}=  Strip String  ${text}
    Unselect Frame
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]
    Wait Visibility And Click Element  xpath=//div[contains(@class,'lang-toggle')]//li[contains(text(),'UK')]
    [Return]  ${result}


Отримати інформацію з contracts.period.startDate
    [Arguments]  ${field_name}
#    ${date}=  Отримати та привести дату до заданого формату  ${field_name}
    ${date}=  Get Element Attribute  css=*[contract-period-start-date]@contract-period-start-date
    [Return]  ${date}


Отримати інформацію з contracts.period.endDate
    [Arguments]  ${field_name}
#    ${date}=  Отримати та привести дату до заданого формату  ${field_name}
    ${date}=  Get Element Attribute  css=*[contract-period-end-date]@contract-period-end-date
    [Return]  ${date}


Отримати інформацію з contracts.dateSigned
    [Arguments]  ${field_name}
#    ${date}=  Отримати та привести дату до заданого формату  ${field_name}
    ${date}=  Get Element Attribute  css=*[contract-date-signed]@contract-date-signed
    [Return]  ${date}


Отримати інформацію з contracts.value.amount
    [Arguments]  ${element_name}
    ${text}=  Отримати текст елемента  ${element_name}
    ${text_new}=  Strip String  ${text}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з awadrs.complaintPeriod.endDate
    Reload Page
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    Wait For Element With Reload  xpath=//a[contains(., 'Переможець')]  1
    ${date}=  Get Element Attribute  xpath=//a[contains(., 'Переможець')]@data-complaint-period-end
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${date}  %d.%m.%Y %H:%M
    [Return]  ${result}


Отримати інформацію з awards[0].complaintPeriod.endDate
    [Arguments]  ${shift}
    Reload Page
    ${class}=  Get Element Attribute  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=(//a[contains(@ng-class, 'lot-parts')])[1]
    ${date}=  Get Element Attribute  xpath=//a[contains(., 'Переможець')]@data-complaint-period-end
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${date}  %d.%m.%Y %H:%M


Отримати інформацію з complaintPeriod.endDate
    [Arguments]  ${element_name}  ${shift}
    Reload Page
    Reload And Switch To Tab  3
    ${result_full}=  Отримати текст елемента  ${element_name}
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${result_full}  %d.%m.%Y %H:%M
    [Return]  ${result}


Отримати строку
    [Arguments]  ${element_name}  ${position_number}
    ${result_full}=  Отримати текст елемента  ${element_name}
    ${result}=  Strip String  ${result_full}
    ${result}=  Replace String  ${result}  ,  ${EMPTY}
    ${values_list}=  Split String  ${result}
    ${result}=  Strip String  ${values_list[${position_number}]}  mode=both  characters=:
    [Return]  ${result}


Отримати текст елемента
    [Arguments]  ${element_name}
    ${temp_name}=  Remove String  ${element_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}' or 'id=' in '${temp_name}'  ${element_name}
        ...  ${tender_data_${element_name}}

    Wait Until Element Is Visible  ${element}  ${COMMONWAIT}
    ${result_full}=  Get Text  ${element}
    [Return]  ${result_full}


Отримати дату та час
    [Arguments]  ${element_name}
    Switch Browser  ${ALIAS_NAME}
    ${xpath}=  Set Variable If
        ...  '${mode}' == 'framework_selection' and '${element_name}' == 'enquiryPeriod.startDate'  xpath=//*[@id='active.enquiries.cfas-bd']
        ...  '${mode}' == 'framework_selection' and '${element_name}' == 'enquiryPeriod.endDate'  xpath=//*[@id='active.enquiries.cfas-ed']
        ...  ${tender_data_${element_name}}
    ${element_present}=  Run Keyword And Return Status  Element Should Be Visible  ${xpath}
    Run Keyword unless  ${element_present}  Wait For Element With Reload  ${xpath}  1

    ${result_full}=  Отримати текст елемента  ${xpath}
    ${work_string}=  Replace String  ${result_full}  ${SPACE},${SPACE}  ${SPACE}
    ${work_string}=  Replace String  ${work_string}  ,${SPACE}  ${SPACE}
    ${work_string}=  Replace String  ${work_string}  .  ${SPACE}
    ${values_list}=  Split String  ${work_string}
    ${day}=  Convert To String  ${values_list[0]}
    ${month}=  privatmarket_service.get_month_number  ${values_list[1]}
    ${month}=  Set Variable If  ${month} < 10  0${month}  ${month}
    ${year}=  Convert To String  ${values_list[2]}
    ${time}=  Convert To String  ${values_list[3]}
    ${date}=  Convert To String  ${year}-${month}-${day} ${time}
    ${result}=  privatmarket_service.get_time_with_offset  ${date}
    [Return]  ${result}


Отримати інформацію з deliveryDate
    [Arguments]  ${element_name}
    ${element_present}=  Run Keyword And Return Status  Element Should Be Visible  ${element_name}
    Run Keyword unless  ${element_present}  Wait For Element With Reload  ${tender_data_${element_name}}  1

    ${date}=  Отримати текст елемента  ${element_name}
    ${result}=  privatmarket_service.get_time_with_offset_formatted  ${date}  %d.%m.%Y %H:%M
    [Return]  ${result}


Отримати суму
    [Arguments]  ${element_name}
    ${result}=  Отримати текст елемента  ${element_name}
    ${result}=  Remove String  ${result}  ${SPACE}
    ${result}=  Replace String  ${result}  ,  .
    ${result}=  Convert To Number  ${result}
    [Return]  ${result}


Отримати число
    [Arguments]  ${element_name}  ${position_number}
    ${value}=  Отримати строку  ${element_name}  ${position_number}
    ${result}=  Convert To Number  ${value}
    [Return]  ${result}


Отримати класифікацію
    [Arguments]  ${element_name}
    ${result_full} =  Отримати текст елемента  ${element_name}
    ${reg_expresion} =  Set Variable  [0-9A-zА-Яа-яёЁЇїІіЄєҐґ\\s\\:]+\: \\w+[\\d\\.\\-]+ ([А-Яа-яёЁЇїІіЄєҐґ\\s;,\\"_\\(\\)\\.]+)
    ${result} =  Get Regexp Matches  ${result_full}  ${reg_expresion}  1
    [Return]  ${result[0]}


Отримати інформацію з unit.name
    [Arguments]  ${element_name}  ${position_number}
    ${result_full}=  Отримати строку  ${element_name}  ${position_number}
    ${result}=  privatmarket_service.get_unit_name  ${result_full}
    [Return]  ${result}


Обрати додаткові класифікатори
    [Arguments]  ${scheme}  ${classificationId}
    Обрати схему  ${scheme}
    Обрати класифікатори  ${classificationId}


Обрати класифікатори
    [Arguments]  ${classificationId}
    Wait Visibility And Click Element  xpath=(//a[@data-id='actChoose'])[2]
    Wait Until Element Is Visible  css=section[data-id='classificationTreeModal']  ${COMMONWAIT}
    Wait Until Element Is Visible  css=input[data-id='query']  ${COMMONWAIT}
    Wait Element Visibility And Input Text  css=input[data-id='query']  ${classificationId}
    Wait Until Element Is Not Visible  css=.modal-body.tree.pm-tree
    Wait Until Keyword Succeeds  20s  500ms  Check Element Attribute  css=[data-status='ok']  data-id
    Wait Visibility And Click Element  xpath=//div[@data-id='foundItem']//label[@for='found_${classificationId}']
    Wait Visibility And Click Element  css=[data-id='actConfirm']


Обрати схему
    [Arguments]  ${scheme}
    Wait Visibility And Click Element  css=a[data-id='actAdd']
    Sleep  1
    Wait Visibility And Click Element  xpath=//section[@data-id='schemeCheckModal']//label[@for='scheme_${scheme}']
    Wait Visibility And Click Element  xpath=//section[@data-id='schemeCheckModal']//button[@data-id='actConfirm']
    Sleep  1


Switch To Frame
    [Arguments]  ${frameId}
    Wait Until Element Is enabled  ${frameId}  ${COMMONWAIT}
    Select Frame  ${frameId}


Login
    [Arguments]  ${username}
    Wait Visibility And Click Element  xpath=//button[text()='Увійти']
    Wait Until Element Is Visible  css=input[data-id='enter-login']  ${COMMONWAIT}
    Input Text  css=input[data-id='enter-login']  +${USERS.users['${username}'].login}
    Input Text  css=input[data-id='enter-pwd']  ${USERS.users['${username}'].password}
    Wait Visibility And Click Element  css=button[data-id='enter-submit']
    Wait For Ajax

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  css=section.offer-acceptation  10s
    Run Keyword If  '${status}' == 'True'
    ...  Run Keywords
    ...  Wait Visibility And Click Element  css=section.offer-acceptation label>span
    ...  AND  Wait Visibility And Click Element  css=button.btn-primary

    Wait Until Element Is Visible  css=.company-name  timeout=60


Wait Visibility And Click Element
    [Arguments]  ${elementLocator}
    Wait Until Element Is Visible  ${elementLocator}  ${COMMONWAIT}
    Wait Until Element Is Enabled  ${elementLocator}  ${COMMONWAIT}
    Click Element  ${elementLocator}


Wait Element Visibility And Input Text
    [Arguments]  ${elementLocator}  ${input}
    Wait Until Element Is Visible  ${elementLocator}  ${COMMONWAIT}
    Wait Until Element Is Enabled  ${elementLocator}  ${COMMONWAIT}
    Input Text  ${elementLocator}  ${input}


Wait For Tender
    [Arguments]  ${tender_id}  ${education_type}  ${type}=tender
    Wait Until Keyword Succeeds  10min  5s  Try Search Tender  ${tender_id}  ${education_type}  ${type}


Try Search Tender
    [Arguments]  ${tender_id}  ${education_type}  ${type}
    Check Current Mode New Realisation
    #заполним поле поиска
    Clear Element Text  ${locator_tenderSearch.searchInput}
    Sleep  1s
    Input Text  ${locator_tenderSearch.searchInput}  ${tender_id}

    #выполним поиск
    Click Element  css=button#search-query-button
    Wait Until Element Is Not Visible  xpath=//div[@class='ajax_overflow']  ${COMMONWAIT}
    Wait Until Element Is Enabled  id=${tender_id}  timeout=20
    [Return]  True


Check Current Mode New Realisation
    [Arguments]  ${education_type}=${True}
    privatmarket.Оновити сторінку з тендером
    Wait Until Element Is Not Visible  xpath=//*[@class='spinner']  ${COMMONWAIT}
    Wait Until Element Is Not Visible  css=div.animate-loader  ${COMMONWAIT}
    sleep  5s
    Wait Until Element Is Visible  ${locator_tender.switchToDemo}  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tender.switchToDemo}
    Wait For Ajax
    ${check_result}=  Get Text  ${locator_tender.switchToDemo}
    Run Keyword If  '${check_result}' == 'Увійти в демо-режим' or '${check_result}' == 'Войти в демо-режим'  Switch To Education Mode


Switch To Education Mode
    [Arguments]  ${education_type}=${True}
    Wait Until Element Is Not Visible  css=div.animate-loader  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tender.switchToDemo}
    Wait Until Element Is Visible  ${locator_tender.switchToDemoMessage}  ${COMMONWAIT}


Convert Amount To Number
    [Arguments]  ${field_name}
    ${temp_name}=  Remove String  ${field_name}  '

    ${element}=  Set Variable If
        ...  'css=' in '${temp_name}' or 'xpath=' in '${temp_name}'  ${field_name}
        ...  ${tender_data_${field_name}}

    ${result_full}=  Get Text  ${element}
    ${text}=  Strip String  ${result_full}
    ${text_new}=  Replace String  ${text}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Wait For Element With Reload
    [Arguments]  ${locator}  ${tab_number}  ${period}=10
    Wait Until Keyword Succeeds  ${period}min  10s  Try Search Element  ${locator}  ${tab_number}


Try Search Element
    [Arguments]  ${locator}  ${tab_number}
    Reload And Switch To Tab  ${tab_number}
    Run Keyword If
    ...  '${tab_number}' == '1' and 'запитання на всі предмети' in '${TEST_NAME}'  Відкрити інформацію по запитанням на всі лоти
    ...  ELSE IF  '${tab_number}' == '1' and 'запитання на всі лоти' in '${TEST_NAME}'  Відкрити інформацію по запитанням на всі лоти
    ...  ELSE IF  '${tab_number}' == '1' and 'статусу підписаної угоди з постачальником' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and '${TEST_NAME}' == 'Можливість укласти угоду для закупівлі'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and '${TEST_NAME}' == 'Можливість укласти угоду для звіту про укладений договір'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and '${TEST_NAME}' == 'Можливість укласти угоду для переговорної процедури'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'Неможливість укласти угоду' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'редагувати вартість угоди' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'пропозицію кваліфікації' in '${TEST_NAME}'  Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    ...  ELSE IF  '${tab_number}' == '1' and 'вичитати посилання на аукціон' in '${TEST_NAME}'  Відкрити модальне вікно з посиланням на аукціон
    ...  ELSE IF  '${tab_number}' == '1' and 'дочекатися завершення аукціону' in '${TEST_NAME}'  Відкрити модальне вікно з посиланням на аукціон
    ...  ELSE IF  '${tab_number}' == '1' and 'періоду подачі скарг на пропозицію' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити постачальника до звіту про укладений договір' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити постачальника до переговорної процедури' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити постачальника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити другого постачальника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити третього постачальника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити четвертого постачальника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
#    ...  ELSE IF  '${tab_number}' == '1' and 'qualification_approve' in @{TEST_TAGS}  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'підтвердити учасника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'відхилити постачальника' in '${TEST_NAME}'  Відкрити детальну інформацію про постачальника
    ...  ELSE IF  '${tab_number}' == '1' and 'договору' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'обсягу дійсно оплаченої суми' in '${TEST_NAME}'  Відкрити детальну інформацію про контракт
    ...  ELSE IF  '${tab_number}' == '1' and 'статусу зареєстрованої угоди' in '${TEST_NAME}'  Відкрити детальну інформацію про рамкові угоди
    ...  ELSE IF  '${tab_number}' == '1' and 'change_view' in @{TEST_TAGS}  Відкрити детальну інформацію про рамкові угоди
    ...  ELSE IF  '${tab_number}' == '1' and 'modification_view' in @{TEST_TAGS}  Відкрити детальну інформацію про рамкові угоди
    ...  ELSE IF  '${tab_number}' == '1'  Відкрити детальну інформацію по позиціям
    ...  ELSE IF  '${tab_number}' == '2' and 'відповіді на запитання' in '${TEST_NAME}'  Відкрити повну відповідь на запитання
    ...  ELSE IF  '${tab_number}' == '3' and 'заголовку документації' in '${TEST_NAME}'  Відкрити інформацію про вкладені файли вимоги
    ...  ELSE IF  '${tab_number}' == '3' and 'вмісту документа до вимоги' in '${TEST_NAME}'  Відкрити інформацію про вкладені файли вимоги
    Wait Until Element Is Enabled  ${locator}  10
    Wait For Ajax
    [Return]  True


Reload And Switch To Tab
    [Arguments]  ${tab_number}
    Reload Page
    Sleep  5s
    Switch To Tab  ${tab_number}


Switch To Tab
    [Arguments]  ${tab_number}
    ${class}=  Get Element Attribute  xpath=(//div[@id='nav-tab']/a)[${tab_number}]@class
    Execute JavaScript  window.scrollTo(${0},${0})
    Run Keyword Unless  'checked' in '${class}'  Wait Visibility And Click Element  xpath=(//div[@id='nav-tab']/a)[${tab_number}]
    Sleep  1s


Search By Query
    [Arguments]  ${element}  ${query}
    Sleep  2s
    Wait Element Visibility And Input Text  ${element}  ${query}
    Wait Until Element Is Not Visible  css=.modal-body.tree.pm-tree
    Wait Until Keyword Succeeds  20s  500ms  Check Element Attribute  css=[data-status='ok']  data-id
    Wait Until Element Is Enabled  xpath=//div[@data-id='foundItem']//label[@for='found_${query}']  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//div[@data-id='foundItem']//label[@for='found_${query}']


Check Element Attribute
    [Arguments]  ${element}  ${attribute_name}
    Sleep  500ms
    ${attribute}=  Get Element Attribute  ${element}@${attribute_name}


Set Date
    [Arguments]  ${element}  ${fild}  ${date}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.${element}.${fild} = new Date(Date.parse("${date}")); s.$root.$apply();


Set Date In Item
    [Arguments]  ${index}  ${element}  ${param}  ${date}
    Execute Javascript  var s = angular.element('[ng-controller=ptr-editor]').scope(); s.model.ptr.items[${index}].${element}.${param} = new Date(Date.parse("${date}")); s.$root.$apply();


Set Time
    [Arguments]  ${element}  ${date}
    ${time}=  Get Regexp Matches  ${date}  T(\\d{2}:\\d{2})  1
    Input Text  ${element}  ${time[0]}


Close Confirmation In Editor
    [Arguments]  ${confirmation_text}
    Wait Until Element Is Visible  css=div.modal-body.info-div  ${COMMONWAIT}
    Wait Until Element Contains  css=div.modal-body.info-div  ${confirmation_text}  ${COMMONWAIT}
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  1s
    Wait Until Element Is Not Visible  css=div.modal-body.info-div  ${COMMONWAIT}


Wait For Notification
    [Arguments]  ${message_text}
    Wait Until Element Is Enabled  xpath=//div[@data-id='alert-info']  timeout=${COMMONWAIT}
    Wait Until Element Contains  xpath=//div[@data-id='alert-info']  ${message_text}  timeout=10


Scroll Page To Element
    [Arguments]  ${locator}
    ${temp}=  Remove String  ${locator}  '
    ${cssLocator}=  Run Keyword If  'css' in '${temp}'  Get Substring  ${locator}  4
    ...  ELSE  Get Substring  ${locator}  6
    ${js_expresion}=  Run Keyword If  'css' in '${temp}'  Convert To String  return window.$("${cssLocator}")[0].scrollIntoView()
    ...  ELSE  Convert To String  return window.$x("${cssLocator}")[0].scrollIntoView()
    Sleep  2s


Set Enquiry Period
    [Arguments]  ${startDate}  ${endDate}
    Wait Until Element Is Visible  css=input[data-id='enquiryPeriodStart']  ${COMMONWAIT}
    Set Date  enquiryPeriod  startDate  ${startDate}
    Wait Until Element Is Visible  css=input[data-id='enquiryPeriodEnd']  ${COMMONWAIT}
    Set Date  enquiryPeriod  endDate  ${endDate}


Set Start Tender Period
    [Arguments]  ${date}
    Wait Until Element Is Visible  css=input[data-id='tenderPeriodStart']  ${COMMONWAIT}
    Set Date  tenderPeriod  startDate  ${date}


Set End Tender Period
    [Arguments]  ${date}
    Wait Until Element Is Visible  css=input[data-id='tenderPeriodEnd']  ${COMMONWAIT}
    Set Date  tenderPeriod  endDate  ${date}


Wait For Ajax
    Sleep  5s


Get Item Number
    [Arguments]  ${object_id}
    ${elements}=  Get Webelements  xpath=//section[contains(@class, 'lot-description')]//section/div/section[not (contains(@class, 'description'))]
    ${item_num}=  Set Variable  0
    ${count}=  Get_Length  ${elements}
    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  ${text}=  Get Text  xpath=(//div[@class='lot-info']/section//div[@class='description']//a)[${item}]
    \  ${item_num}=  Run Keyword If  '${object_id}' in '${text}'  Set Variable  ${item}
    \  ...  ELSE  Set Variable  ${item_num}
    [Return]  ${item_num}


Відповісти на вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
    Wait Until Keyword Succeeds  15min  10s  Wait For Element With Reload  xpath=//div[contains(@class,'faq') and contains(.,'${complaintID}')]//button[@data-id='resolution-button']  3
    Wait Visibility And Click Element  xpath=//div[contains(@class,'faq') and contains(.,'${complaintID}')]//button
    Wait Visibility And Click Element  xpath=//select[@id='resolutionType']/option[@value='string:${answer_data.data.resolutionType}']
    Wait Element Visibility And Input Text  css=textarea[data-id='user-resolution']  ${answer_data.data.resolution}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-send-complaint-resolution']
    Sleep  30s


Відповісти на вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
    privatmarket.Відповісти на вимогу про виправлення умов закупівлі  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}


Завантажити документ рішення кваліфікаційної комісії
    [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Until Keyword Succeeds  10min  10s  Дочекатися можливості завантажити документ рішення кваліфікаційної комісії
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[3]
    Sleep  1s
    Execute Javascript  document.querySelector(".files-upload input[type='file']").class = ''
    Sleep  1s
    Choose File  css=.files-upload input[type='file']  ${document}
    Sleep  5s


Дочекатися можливості завантажити документ рішення кваліфікаційної комісії
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
#    Wait Visibility And Click Element  xpath=//div[@class='lot-info ng-scope' and contains(.,'Кваліфікація учасників') ]//table[@class='bids']//a[@class='ng-binding']
    Wait Visibility And Click Element  xpath=//span[contains(text(),'Розглядається')]/following-sibling::span[@ng-click='act.openAward(b)']
    Wait Until Element Is Visible  xpath=//div[@class='files-upload']


Відповісти на вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}  ${award_index}
    privatmarket.Відповісти на вимогу про виправлення умов закупівлі  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}


Підтвердити постачальника
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${scenarios_name}=  privatmarket_service.get_scenarios_name

    ${tender_type}=  Отримати інформацію з procurementMethodType

    Wait For Element With Reload  xpath=//span[@ng-click="act.openAward(b)"]  1
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAward(b)"]

    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'до звіту про укладений договір' in '${TEST_NAME}' or 'belowThreshold' in '${tender_type}'  Wait Visibility And Click Element  xpath=//label[@for='chkSelfQualified']
    Run Keyword Unless  'до переговорної процедури' in '${TEST_NAME}' or 'single_item' in '${scenarios_name}' or 'до звіту про укладений договір' in '${TEST_NAME}' or 'belowThreshold' in '${tender_type}'  Wait Visibility And Click Element  xpath=//label[@for='chkSelfEligible']

    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
    Sleep  1s
    Execute Javascript  document.querySelector(".files-upload input[type='file']").className = "";
    Sleep  1s
    Choose File  css=.files-upload input[type='file']  ${file_path}
    Sleep  20s

    Wait Visibility And Click Element  xpath=//div[@class='award-section award-actions ng-scope']//button[@data-id='setActive']
    Sleep  1s
    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}
    Reload Page
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    Run Keyword If  'openua_award_complaint' in '${scenarios_name}' or '${mode}' == 'open_esco' or '${mode}' == 'openua' or '${mode}' == 'openeu' or '${mode}' == 'open_framework' or '${mode}' == 'openua_defense'
    ...  Run Keywords
    ...  Wait Until Keyword Succeeds  10min  10s  Дочекатися можливості завантажити ЕЦП
    ...  AND  Завантажити ЕЦП
    Reload Page
    Sleep  180s


Дискваліфікувати постачальника
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    ${comment}=  create_fake_sentence
    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    ${tender_type}=  Отримати інформацію з procurementMethodType

    Wait For Element With Reload  xpath=//span[@ng-click="act.openAward(b)"]  1
    Wait Visibility And Click Element  xpath=//span[@ng-click="act.openAward(b)"]

    Wait For Ajax
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select form-block__select_short']//option[2]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//div[@class='files-upload']//select[@class='form-block__select ng-scope form-block__select_short']//option[2]
    Sleep  1s
    Execute Javascript  document.querySelector(".files-upload input[type='file']").className = "";
    Sleep  1s
    Choose File  css=.files-upload input[type='file']  ${file_path}
    Sleep  20s
    Wait Visibility And Click Element  xpath=//button[@data-id='setUnsuccessful']
    sleep  5s
    Wait Visibility And Click Element  xpath=//label[@for='chk-dr4']
    Wait Element Visibility And Input Text  xpath=//*[@data-id='decline-description']  ${comment}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-ok']
    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-close']
    Sleep  20s
    Reload Page
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Run Keywords
    ...  Wait Until Keyword Succeeds  10min  10s  Дочекатися можливості завантажити ЕЦП
    ...  AND  Завантажити ЕЦП
    Reload Page
    Sleep  120s



Скасування рішення кваліфікаційної комісії
    [Arguments]  ${username}  ${tender_uaid}  ${award_num}
    Reload Page
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]  ${COMMONWAIT}
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Visibility And Click Element  xpath=//span[contains(@ng-if,'CancelAwardDecision')]
    Wait Visibility And Click Element  xpath=//button[@data-id='btn-cancel-qualification-or-award']
    Wait Until Element Is Visible  xpath=//div[contains(text(),'Ваше рішення поставлено в чергу на відправку в Prozorro')]  ${COMMONWAIT}
    Click Element  xpath=//button[@data-id='btn-close']
    Sleep  120s


Дочекатися можливості завантажити ЕЦП
    Reload Page
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Wait Visibility And Click Element  xpath=(//img[contains(@ng-src,'icon-plus')])[last()]
    sleep  10s
    Wait Visibility And Click Element  xpath=//a[contains(text(),'Очікує ЕЦП')]/following-sibling::span
#    Wait Visibility And Click Element  xpath=//div[contains(text(),'Пiдпис замовника')]/following-sibling::div[@data-id='no-ecp']
    Wait Visibility And Click Element  xpath=//button[@data-id='addAwardFileEcp']


Завантажити ЕЦП
    Sleep  10s
    Select Window  title=sign worker
    Wait Until Keyword Succeeds  4min  60s  Заповнити дані по ЕЦП
#    Wait Until Keyword Succeeds  2min  10s  Дочекатися завантаження сторінки підписання ЕЦП
#
#    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath=//select[@id='CAsServersSelect']  15s
#    Run Keyword If  '${status}' == 'False'
#    ...  Run Keywords
#    ...  Reload Page
#    ...  AND  Wait Until Element Is Visible  xpath=//select[@id='CAsServersSelect']  ${COMMONWAIT}
#
#    Wait Visibility And Click Element  xpath=//select[@id='CAsServersSelect']//option[8]
#    ${path}=   get_ECP_key  src/robot_tests.broker.privatmarket/11141802_11141802.jks
#    Choose File  id=PKeyFileInput  ${path}
#    Wait Element Visibility And Input Text  id=PKeyPassword  11111111
#    Wait Visibility And Click Element  id=PKeyReadButton
#    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'Ключ успішно завантажено')]
#    Wait Visibility And Click Element  id=SignDataButton
#    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(),'Ок')]
    Close Window
    Select Window


Заповнити дані по ЕЦП
    Wait Until Keyword Succeeds  2min  10s  Дочекатися завантаження сторінки підписання ЕЦП

    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath=//select[@id='CAsServersSelect']  15s
    Run Keyword If  '${status}' == 'False'
    ...  Run Keywords
    ...  Reload Page
    ...  AND  Wait Until Element Is Visible  xpath=//select[@id='CAsServersSelect']  ${COMMONWAIT}

    Wait Visibility And Click Element  xpath=//select[@id='CAsServersSelect']//option[8]
    ${path}=   get_ECP_key  src/robot_tests.broker.privatmarket/11141802_11141802.jks
    Choose File  id=PKeyFileInput  ${path}
    Wait Element Visibility And Input Text  id=PKeyPassword  11111111
    Wait Visibility And Click Element  id=PKeyReadButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(), 'Ключ успішно завантажено')]
    Wait Visibility And Click Element  id=SignDataButton
    Wait Until Element Is Visible  xpath=//span[@id='PKStatusInfo' and contains(text(),'Ок')]


Дочекатися завантаження сторінки підписання ЕЦП
    ${passed}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//*[@id='PKeyPassword']
    Run Keyword Unless  '${passed}' == 'PASS'  Reload Page


Звiрити value of title на сторінці редагуванння
    [Arguments]  ${username}
    ${title_value}=  Get Value  css=input[data-id='procurementName']
    Should be equal as strings  ${title_value}  ${USERS.users['${user_name}'].initial_data.data.title}


Створити вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${document}=${None}
    Switch To Tab  3
    Wait Visibility And Click Element  css=#btnSendClaim
    Заповнити поля вимоги/скарги  ${claim}  ${document}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Заповнити поля вимоги/скарги
    [Arguments]  ${claim}  ${document}
    Wait Element Visibility And Input Text  css=#titleComplaint  ${claim.data.title}
    Wait Element Visibility And Input Text  css=#descriptionComplaint  ${claim.data.description}
    Run Keyword And Ignore Error  Choose File  css=input[id='fileToUpload']  ${document}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${claim.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${claim.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${claim.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${claim.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${claim.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[0]  # Используем 0 так как @{contactPoint}[2] невалидное значение
    ${telephone}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personPhone  ${telephone}
    ${faxNumber}=  Привести номер телефону до відповідного формату  ${claim.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personFax  ${faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${claim.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-complaint"]
    Sleep  10s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]


Створити чернетку вимоги про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${claim}
    Switch To Tab  3
    Wait Visibility And Click Element  css=#btnSendClaim
    Заповнити поля вимоги/скарги  ${claim}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${document}=${None}
    Switch To Tab  1
    Відкрити детальну інформацію по лотам
    ${tender_type}=  Отримати інформацію з procurementMethodType
    Wait Visibility And Click Element  css=a[tooltip='Подати вимогу на даний лот']
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'belowThreshold' in '${tender_type}'  Wait Visibility And Click Element  xpath=//button[@data-id='btn-send-claim']
    Заповнити поля вимоги/скарги  ${claim}  ${document}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити чернетку вимоги про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}
    Switch To Tab  1
    Відкрити детальну інформацію по лотам
    Wait Visibility And Click Element  css=a[tooltip='Подати вимогу на даний лот']
    Заповнити поля вимоги/скарги  ${claim}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити скаргу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${document}=${None}
    Wait until keyword succeeds  5min  10s  Звірити статус  ${username}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Sleep  1
    Wait Visibility And Click Element  css=a[ng-click="act.showChooseCmplWnd(b.id, 'award', lot.id)"]
    Sleep  1
    Wait Visibility And Click Element  css=button[data-id='btn-send-complaint']
    Sleep  1
    Заповнити поля вимоги/скарги  ${claim}  ${document}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${document}=${None}
    Wait until keyword succeeds  5min  10s  Звірити статус  ${username}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Sleep  1
    Wait Visibility And Click Element  css=a[ng-click="act.showChooseCmplWnd(b.id, 'award', lot.id)"]
    Sleep  1
    Wait Visibility And Click Element  css=button[data-id='btn-send-claim']
    Sleep  1
    Заповнити поля вимоги/скарги  ${claim}  ${document}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Створити чернетку вимоги про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}
    Wait until keyword succeeds  5min  10s  Звірити статус  ${username}  ${tender_uaid}
    Reload And Switch To Tab  1
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Sleep  1
    Wait Visibility And Click Element  css=a[ng-click="act.showChooseCmplWnd(b.id, 'award', lot.id)"]
    Sleep  1
    Wait Visibility And Click Element  css=button[data-id='btn-send-claim']
    Sleep  1
    Заповнити поля вимоги/скарги  ${claim}
    Reload And Switch To Tab  3
    ${result}=  Get Text  xpath=(//span[@data-id='complaint-id'])[1]
    [Return]  ${result}


Скасувати вимогу про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}  ${award_index}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Скасувати вимогу про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Скасувати вимогу про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
    Reload And Switch To Tab  3
    Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//a[@data-id='cancel-claim-action']
    Sleep  1s
    Wait Element Visibility And Input Text  css=#reasonCancelComplaint  ${cancellation_data.data.cancellationReason}
    Wait Visibility And Click Element  css=button[data-id='btn-cancel-complaint']


Підтвердити вирішення вимоги про виправлення умов закупівлі
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  360s


Підтвердити вирішення вимоги про виправлення умов лоту
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  180s


Підтвердити вирішення вимоги про виправлення визначення переможця
    [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}  ${award_index}
    Reload And Switch To Tab  3
    ${confirmation}=  Set Variable  ${confirmation_data.data.satisfied}
    Run Keyword If  '${confirmation}' == 'True'  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-satisfied']
    ...  ELSE  Wait Visibility And Click Element  xpath=//span[contains(@data-id, 'complaint-id') and contains(., '${complaintID}')]/../../..//button[@data-id='complaint-not-satisfied']
    Sleep  1s
    Wait Visibility And Click Element  css=button[data-id='btn-ok']
    Sleep  180s


Привести номер телефону до відповідного формату
    [Arguments]  ${phone}
    ${modified_phone}=  Remove String  ${phone}  ${SPACE}
    ${modified_phone}=  Remove String  ${modified_phone}  -
    ${modified_phone}=  Remove String  ${modified_phone}  (
    ${modified_phone}=  Remove String  ${modified_phone}  )
    ${modified_phone}=  Set Variable If  '+38' in '${modified_phone}'  ${modified_phone}  +38067${modified_phone}
    ${modified_phone}=  Get Substring  ${modified_phone}  0  13
    [Return]  ${modified_phone}


Задати запитання на лот
    [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${question}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-faq')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-faq')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-faq')]
    Wait Visibility And Click Element  css=button[data-id='lot-question']
    Заповнити форму запитання  ${question}


Заповнити форму запитання
    [Arguments]  ${question}
    Wait Element Visibility And Input Text  css=#questionTitle  ${question.data.title}
    Wait Element Visibility And Input Text  css=#questionDescription  ${question.data.description}
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//select[@id='addressCountry']//option[@value='UA']
    Wait Element Visibility And Input Text  css=#addressPostalCode  ${question.data.author.address.postalCode}
    Wait Element Visibility And Input Text  css=#addressRegion  ${question.data.author.address.countryName}
    Wait Element Visibility And Input Text  css=#addressLocality  ${question.data.author.address.locality}
    Wait Element Visibility And Input Text  css=#addressStreet  ${question.data.author.address.streetAddress}
    @{contactPoint} =  Split String  ${question.data.author.contactPoint.name}
    Wait Element Visibility And Input Text  css=#personSurname  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personName  @{contactPoint}[1]
    Wait Element Visibility And Input Text  css=#personPatronymic  @{contactPoint}[0]
    Wait Element Visibility And Input Text  css=#personPhone  ${question.data.author.contactPoint.telephone}
    Wait Element Visibility And Input Text  css=#personFax  ${question.data.author.contactPoint.faxNumber}
    Wait Element Visibility And Input Text  css=#personEmail  ${question.data.author.contactPoint.email}
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-send-question"]
    Sleep  5s
    Wait Visibility And Click Element  xpath=//button[@data-id="btn-close"]
    Sleep  90s


Подати цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}
    Run Keyword Unless  'Неможливість' in '${TEST_NAME}'  Wait For Element With Reload  xpath=//button[@data-id='createBidBtn']  1
    Click Element  xpath=//button[@data-id='createBidBtn']

    Run Keyword And Return If  '${mode}' == 'open_esco'  Подати цінову пропозицію для ESCO  ${bid}  ${lots_ids}  ${features_ids}

    ${bid_value}=  Set Variable If  ${NUMBER_OF_LOTS} == 0  ${bid.data.value.amount}  ${bid.data.lotValues[0].value.amount}

    ${value_amount}=  privatmarket_service.convert_float_to_string  ${bid_value}
    Sleep  2s

    ${status}  ${elements}=  Run Keyword And Ignore Error  Get Webelements  xpath=//button[contains(@id, 'dropdownMenu')]
    ${count}=  Run Keyword If
    ...  '${status}' == 'PASS'  Get_Length  ${elements}
    ...  ELSE  Set Variable  0

    :FOR  ${item}  In Range  0  ${count}
    \  ${item}=  privatmarket_service.sum_of_numbers  ${item}  1
    \  Click Element  xpath=(//button[contains(@id, 'dropdownMenu')])[${item}]
    \  Run Keyword Unless  '${MODE}' == 'framework_selection'  Click Element  xpath=(//ul[@class='dropdown-menu btn-feature-dropdown-menu'])[${item}]/li[1]
    \  Sleep  1s

    ${input_field}=  Set Variable If  ${NUMBER_OF_LOTS} == 0  input[id='price']  input[id^='userprice-lot']

    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword If  'Неможливість' in '${TEST_NAME}'  Відмітити лот
    ...  ELSE IF  'dialogue' in '${scenarios_name}'  Відмітити лот
    ...  ELSE  Wait Element Visibility And Input Text  css=${input_field}  ${value_amount}

    Run Keyword If  'на другому етапі' in '${TEST_NAME}'  Wait Element Visibility And Input Text  css=${input_field}  ${value_amount}

    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Until Element Is Visible  css=select[data-id='filetype']
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='modalOkBtn']
    Wait For Ajax

    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'below' in '${scenarios_name}' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  css=label[data-id='toggle-qualified']
    Run Keyword Unless  'single_item' in '${scenarios_name}' or 'below' in '${scenarios_name}' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  css=label[data-id='toggle-eligible']

    Wait Visibility And Click Element  xpath=//select[contains(@class,'company-scale')]/option[@value='string:${bid.data.tenderers[0].scale}']

    Wait Element Visibility And Input Text  css=input[data-id='postalCode']  ${bid.data.tenderers[0].address.postalCode}
    Wait Element Visibility And Input Text  css=input[data-id='countryName']  ${bid.data.tenderers[0].address.countryName}
    Wait Element Visibility And Input Text  css=input[data-id='region']  ${bid.data.tenderers[0].address.region}
    Wait Element Visibility And Input Text  css=input[data-id='locality']  ${bid.data.tenderers[0].address.locality}
    Wait Element Visibility And Input Text  css=input[data-id='streetAddress']  ${bid.data.tenderers[0].address.streetAddress}
    ${modified_phone}=  Привести номер телефону до відповідного формату  ${bid.data.tenderers[0].contactPoint.telephone}
    Wait Element Visibility And Input Text  css=input[data-id='fullNameUa']  ${bid.data.tenderers[0].contactPoint.name}
    Wait Element Visibility And Input Text  css=input[data-id='phone']  ${modified_phone}
    Wait Element Visibility And Input Text  css=input[data-id='email']  ${bid.data.tenderers[0].contactPoint.email}
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword Unless  'на другому етапі' in '${TEST_NAME}' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  xpath=//span[contains(text(),'автоматично')]
    Wait Visibility And Click Element  xpath=//button[contains(@class,'submit')]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Подати цінову пропозицію для ESCO
    [Arguments]  ${bid}  ${lots_ids}  ${features_ids}
    Wait Element Visibility And Input Text  xpath=//input[@ng-model='lot.esco.userYears']  ${bid.data.lotValues[0].value.contractDuration.years}
    Wait Element Visibility And Input Text  xpath=//input[@ng-model='lot.esco.userDays']  ${bid.data.lotValues[0].value.contractDuration.days}
    ${yearlyPaymentsPercentage}=  Convert To Number  ${bid.data.lotValues[0].value.yearlyPaymentsPercentage}  4
    ${yearlyPaymentsPercentage}=  Привести до відсотків  ${yearlyPaymentsPercentage}
    Wait Element Visibility And Input Text  xpath=//input[@ng-model='lot.esco.userContractDuration']  ${yearlyPaymentsPercentage}
    ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${bid.data.lotValues[0].value}  annualCostsReduction

    @{value}=  Run Keyword If  ${presence}  Get From Dictionary  ${bid.data.lotValues[0].value}  annualCostsReduction
    ${cost_length}=  Get Length  ${value}
    :FOR   ${index}   IN RANGE  0  ${cost_length}
    \  ${elem_index}=  privatmarket_service.sum_of_numbers  ${index}  1
    \  ${cost}=  Convert To String  ${value[${index}]}
    \  Wait Element Visibility And Input Text  xpath=(//input[contains(@ng-model,'lot.esco.userAnnualCost')])[${elem_index}]  ${cost}

    @{params}=  Get From Dictionary  ${bid.data}  parameters
    ${param_length}=  Get Length  ${params}
    :FOR   ${index}   IN RANGE  0  ${param_length}
    \  ${value}=  Привести до відсотків  ${params[${index}]['value']}
    \  ${meat_value}=  Convert To Number  ${value}  2
    \  Sleep  1s
    \  Execute JavaScript    window.scrollTo(${0},${0})
    \  Sleep  1s
    \  Wait Visibility And Click Element  xpath=//button[contains(@id,'${params[${index}]['code']}')]
    \  Sleep  1s
    \  Wait Visibility And Click Element  xpath=//ul[contains(@aria-labelledby,'${params[${index}]['code']}')]/li//span[contains(text(),'${meat_value}')]

    Execute Javascript  document.getElementById('chk0').click()

    Wait Visibility And Click Element  xpath=//button[@data-id='save-bid-btn']

    Wait Visibility And Click Element  xpath=//button[@data-id='save-bid-btn']
    Wait Visibility And Click Element  xpath=//button[@data-id='modalOkBtn']

    Wait Visibility And Click Element  xpath=//label[@for='chkSelfQualified']
    Wait Visibility And Click Element  xpath=//label[@for='chkSelfEligible']

    Wait Element Visibility And Input Text  xpath=//input[@data-id='postalCode']   ${bid.data.tenderers[0].address.postalCode}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='countryName']   ${bid.data.tenderers[0].address.countryName}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='region']   ${bid.data.tenderers[0].address.region}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='locality']   ${bid.data.tenderers[0].address.locality}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='streetAddress']   ${bid.data.tenderers[0].address.streetAddress}

    Wait Element Visibility And Input Text  xpath=//input[@data-id='fullNameUa']   ${bid.data.tenderers[0].contactPoint.name}
    ${phone}=  Привести номер телефону до відповідного формату  ${bid.data.tenderers[0].contactPoint.telephone}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='phone']   ${phone}
    Wait Element Visibility And Input Text  xpath=//input[@data-id='email']   ${bid.data.tenderers[0].contactPoint.email}

    Wait Visibility And Click Element  xpath=//button[@data-id='save-bid-btn']
    Wait Visibility And Click Element  xpath=//button[contains(@class,'payment-submit')]
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Відмітити лот
    Execute Javascript  document.querySelector(".checkbox-container input").style = 'display:block'
    Wait Visibility And Click Element  css=.checkbox-container input


Отримати інформацію із пропозиції
    [Arguments]  ${username}  ${tender_uaid}  ${field}
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]
    ${class}=  Get Element Attribute  xpath=//a[contains(@ng-class, 'lot-parts')]@class
    Run Keyword Unless  'checked' in '${class}'  Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]

    Run Keyword And Return If  '${field}' == 'lotValues[0].value.amount'  Отримати інформацію з пропозиції ${field}
    Run Keyword And Return If  '${field}' == 'value.amount'  Отримати інформацію з пропозиції ${field}
    Run Keyword And Return If  '${field}' == 'status'  Отримати інформацію з пропозиції ${field}
    [Return]  ${result}


Отримати інформацію з пропозиції lotValues[0].value.amount
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[2]
    ${text_new}=  Strip String  ${value}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з пропозиції value.amount
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids')]//td[2]/span
    ${text_new}=  Strip String  ${value}
    ${text_new}=  Replace String  ${text_new}  ${SPACE}  ${EMPTY}
    ${result}=  convert to number  ${text_new}
    [Return]  ${result}


Отримати інформацію з пропозиції status
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[4]
    ${value}=  Run Keyword If
    ...  '${value}' != 'Недійсна' and 'після редагування інформації про тендер' in '${TEST_NAME}'  Wait Until Keyword Succeeds  10min  30s  Дочекатися зміни статусу пропозиції
    ...  ELSE  Set Variable  ${value}
    ${value}=  Set Variable If  '${value}' == 'Недійсна'  invalid  ${value}
    [Return]  ${value}


Дочекатися зміни статусу пропозиції
    Reload Page
    Wait Until Element Is Visible  xpath=//a[contains(@ng-class, 'lot-parts')]  ${COMMONWAIT}
    Click Element  xpath=//a[contains(@ng-class, 'lot-parts')]
    Element Should Contain  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[4]  Недійсна
    ${value}=  Отримати текст елемента  xpath=//tr[contains(@ng-repeat, 'currBids[lot.id] ')]//td[4]
    [Return]  ${value}


Завантажити документ в ставку
    [Arguments]  ${username}  ${filePath}  ${tenderId}  ${doc_type}=documents  ${doc_type}=${None}
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tenderId}
    Wait For Element With Reload  xpath=//button[@data-id="editBidBtn"]  1  1
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Wait For Ajax
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//file-uploader[@data-id='common-documents']//select[@data-id='filetype']//option[2]
    Sleep  1s
    Run Keyword And Ignore Error  Wait Visibility And Click Element  xpath=//file-uploader[@data-id='common-documents']//select[@data-id='filelang']//option[@value='string:en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("file-uploader[data-id='common-documents'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=file-uploader[data-id='common-documents'] input[data-id='input-file']  ${filePath}
    Sleep  5s
    Click Button  css=button[data-id='save-bid-btn']
    Sleep  2s
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Click Button  css=button[data-id='save-bid-btn']
    Sleep  10s
    Run Keyword Unless  '${mode}' == 'open_esco' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  xpath=//span[contains(text(),'автоматично')]
    Wait Visibility And Click Element  xpath=//button[contains(@class,'submit')]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  90s



Змінити документ в ставці
    [Arguments]  ${username}  ${tender_uaid}  ${path}  ${doc_id}  ${doc_type}=documents
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Run Keyword Unless  'openUA' in '${mode}'  Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword And Ignore Error  Execute Javascript  var s = angular.element($('[data-id=common-documents]').get(0)).scope(); s.$ctrl.changedDoc=s.$ctrl.docs[0];
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("file-uploader[data-id='common-documents'] input[data-id='input-file']").style = ''
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=file-uploader[data-id='common-documents'] input[data-id='input-single-file']  ${filePath}
    Sleep  5s
    Run Keyword If  'openUA' in '${mode}'  Click Button  css=button[data-id='save-bid-btn']
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Click Button  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword Unless  '${mode}' == 'open_esco' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  xpath=//span[contains(text(),'автоматично')]
    Wait Visibility And Click Element  xpath=//button[contains(@class,'submit')]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Змінити документацію в ставці
    [Arguments]  ${username}  ${tender_uaid}  ${doc_data}  ${doc_id}
    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    ${tender_type}=  Отримати інформацію з procurementMethodType
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Wait For Ajax
    Wait Visibility And Click Element  css=label[data-id="confidentiality-toggle"]

    Run Keyword If  'aboveThresholdEU' in '${tender_type}'
    ...  Run Keywords
    ...  Wait Element Visibility And Input Text  css=textarea[data-if="confidentiality-rationale-text"]  ${doc_data.data.confidentialityRationale}
    ...  AND  Sleep  1s
    ...  AND  Wait Visibility And Click Element  css=button[data-id="save-confidentiality"]

    Sleep  10s
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Sleep  1s
    Run Keyword Unless  '${mode}' == 'open_esco' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  xpath=//span[contains(text(),'автоматично')]
    Wait Visibility And Click Element  xpath=//button[contains(@class,'submit')]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Змінити цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}  ${field}  ${value}

    ${scenarios_name}=  privatmarket_service.get_scenarios_name
    Run Keyword If  '${field}' == 'status'  Wait Visibility And Click Element  xpath=//button[@data-id="createBidBtn"]
    ...  ELSE  Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Wait For Ajax
    Run Keyword Unless  '${field}' == 'status'  Wait Until Element Is Visible  css=select[data-id='filetype']  ${COMMONWAIT}
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modalOkBtn']
    Wait For Ajax
    ${value}=  privatmarket_service.convert_float_to_string  ${value}

    ${value_field}=  Set Variable If  ${NUMBER_OF_LOTS} == 0  input[id='price']  input[id^='userprice-lot']

    Run Keyword If  'value.amount' in '${field}'  Wait Element Visibility And Input Text  css=${value_field}  ${value}
    Click Button  css=button[data-id='save-bid-btn']
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modalOkBtn']
    Wait Visibility And Click Element  css=button[data-id='save-bid-btn']
    Wait For Ajax
    Run Keyword Unless  '${mode}' == 'open_esco' or 'framework_selection' in '${scenarios_name}'
    ...  Wait Visibility And Click Element  xpath=//span[contains(text(),'автоматично')]
    Wait Visibility And Click Element  xpath=//button[contains(@class,'submit')]
    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Sleep  60s


Скасувати цінову пропозицію
    [Arguments]  ${username}  ${tender_uaid}
    Wait Visibility And Click Element  xpath=//button[@data-id="editBidBtn"]
    Sleep  2s
    Wait Visibility And Click Element  css=button[data-id='delete-bid-btn']


Отримати посилання на аукціон для учасника
    [Arguments]  ${username}  ${tender_uaid}
    Wait For Element With Reload  xpath=//a[contains(@href, 'https://auction-sandbox.prozorro.gov.ua/')]  1  30
    ${result}=  Get Element Attribute  xpath=//a[contains(@href, 'https://auction-sandbox.prozorro.gov.ua/')]@href
    [Return]  ${result}


Задати запитання на тендер
    [Arguments]  ${username}  ${tender_uaid}  ${question}
    Switch To Tab  2
    Wait Visibility And Click Element  css=button[data-id='ask-ptr']
    Заповнити форму запитання  ${question}


Задати запитання на предмет
    [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
    Відкрити детальну інформацію по позиціям
    Wait Visibility And Click Element  xpath=//div[@class='lot-info']//section[contains(., '${item_id}')]//a[@ng-click='act.sendItemEnquiry(adb.id)']
    Заповнити форму запитання  ${question}


Перевести тендер на статус очікування обробки мостом
    [Arguments]  ${username}  ${tender_uaid}
    ${status}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${tender_data_title}  5s
    Run Keyword If  '${status}' == 'False'  privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
    Wait Until Keyword Succeeds  10min  10s  Дочекатися зміни статусу тендера на  active.stage2.waiting


Дочекатися зміни статусу тендера на
    [Arguments]  ${status}
    Reload Page
    Wait Until Element Is Visible  ${tender_data_status}  ${COMMONWAIT}
    ${current_status}=  Get Element Attribute  ${tender_data_status}@data-tender-status
    Should Be Equal  ${status}  ${current_status}  msg=Statuses are not equal


Активувати другий етап
    [Arguments]  ${username}  ${tender_uaid}
    Log  ${tender_uaid}
#    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
#    Wait Visibility And Click Element  xpath=//button[@data-id='editProcBtn']
#    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']    # unexpected behavior
#    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
#    sleep  5s
#    Wait Until Element Is Visible  xpath=//span[@title='Лоти та предмети закупівлі']  ${COMMONWAIT}
#    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
#    sleep  5s
#    Wait Until Element Is Visible  xpath=//span[@title='Нецінові показники']  ${COMMONWAIT}
#    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
#    sleep  5s
#    Wait Until Element Is Visible  xpath=//span[@title='Документація']  ${COMMONWAIT}
#    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
#    sleep  5s
#    Wait Until Element Is Visible  xpath=//span[@title='Перевірка та публікація']  ${COMMONWAIT}
#    sleep  5s
#    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
#    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    Reload Page
    Run Keyword IF  '${MODE}' == 'open_competitive_dialogue'  Wait For Element With Reload  css=[data-tender-status='active.tendering']  1

    Wait Until Element Is Visible  xpath=//span[@id='tenderId']  ${COMMONWAIT}
    ${value}=  Отримати текст елемента  xpath=//span[@id='tenderId']
    ${id}=  Strip String  ${value}
    Should Be Equal  ${tender_uaid}  ${id}  msg=tenderID are not equal


Отримати тендер другого етапу та зберегти його
    [Arguments]  ${username}  ${tender_uaid}
    Log  ${tender_uaid}
    privatmarket.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}

    Run Keyword If  'тендер другого етапу' in '${TEST_NAME}' or 'на другому етапі' in '${TEST_NAME}'
    ...  Wait Visibility And Click Element  xpath=//a[@ng-click='act.move2NextStage()']

    Run Keyword And Ignore Error  Wait Visibility And Click Element  css=button[data-id='modal-close']
    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
    sleep  5s
    Wait Until Element Is Visible  xpath=//span[@title='Лоти та предмети закупівлі']  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
    sleep  5s
    Wait Until Element Is Visible  xpath=//span[@title='Нецінові показники']  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
    sleep  5s
    Wait Until Element Is Visible  xpath=//span[@title='Документація']  ${COMMONWAIT}
    Wait Visibility And Click Element  ${locator_tenderadd.btnsave}
    sleep  5s
    Wait Until Element Is Visible  xpath=//span[@title='Перевірка та публікація']  ${COMMONWAIT}
    sleep  5s
    Wait Visibility And Click Element  ${locator_tenderCreation.buttonSend}
    Close Confirmation In Editor  Закупівля поставлена в чергу на відправку в ProZorro. Статус закупівлі Ви можете відстежувати в особистому кабінеті.
    sleep  30s


Отримати доступ до договору
    [Arguments]  ${username}  ${contract_uaid}
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
	Wait Until Element Is Visible  xpath=//span[@data-id='contractID']
	${id}=  Отримати текст елемента  xpath=//span[@data-id='contractID']
	Should Be Equal  ${contract_uaid}  ${id}  msg=contractID are not equal
	Page Should Contain Element  xpath=//button[@ng-click='act.toChange()']


Внести зміну в договір
    [Arguments]  ${username}  ${contract_uaid}  ${change_data}
    privatmarket.Пошук договору по ідентифікатору  ${username}  ${contract_uaid}
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.toChange()']
    Wait Until Element Is Visible  css=div.change
    Wait Element Visibility And Input Text  xpath=//textarea[@data-id='rationale']  ${change_data.data.rationale}
    Wait Visibility And Click Element  xpath=//a[@ng-click='act.setRationale()']
    ${rationaleTypes_count}=  Get Length  ${change_data.data.rationaleTypes}
    : FOR  ${index}  IN RANGE  0  ${rationaleTypes_count}
    \  ${rationaleTypes_xpath}=  Set Variable  //label[contains(@for,'${change_data.data.rationaleTypes[${index}]}')]
    \  Click Element  xpath=${rationaleTypes_xpath}
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.saveType()']
    Wait Visibility And Click Element  xpath=//input[@ng-model='local.currentChange.dateSigned']
    Wait Visibility And Click Element  css=div.datepicker-days td.today.day
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.saveChange()']
    Sleep  60s
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
    Wait Visibility And Click Element  css=div.change-info div#noEcp
    Sleep  1s
    Run Keyword  Завантажити ЕЦП
    Sleep  3min


Додати документацію до зміни в договорі
    [Arguments]  ${username}  ${contract_uaid}  ${file_path}
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.toChange()']
    Wait Visibility And Click Element  xpath=//select[contains(@id,'chooseType')]//option[@value=42]
    Wait Visibility And Click Element  xpath=//select[contains(@id,'chooseLang')]//option[@value='en']
    Sleep  1s
    Run Keyword And Ignore Error  Execute Javascript  document.querySelector("input[id^=inputFile]").setAttribute('class','');
    Sleep  1s
    Run Keyword And Ignore Error  Choose File  css=input[id^=inputFile]  ${file_path}
    Sleep  30


Отримати інформацію із документа до договору
    [Arguments]  ${username}  ${contract_uaid}  ${doc_id}  ${field}
    ${result}=  privatmarket.Отримати інформацію із документа  ${username}  ${contract_uaid}  ${doc_id}  ${field}
    [Return]  ${result}


Отримати документ до договору
    [Arguments]  ${username}  ${contract_uaid}  ${doc_id}
    ${file_name}=  privatmarket.Отримати документ  ${username}  ${contract_uaid}  ${doc_id}
    [Return]  ${file_name}


Редагувати поле договору
    [Arguments]  ${username}  ${contract_uaid}  ${field_name}  ${value}
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.toChange()']
    Run Keyword If  '${field_name}' == 'description'  Wait Element Visibility And Input Text  css=textarea[data-id='procurementDescription']  ${value}


Редагувати зміну
    [Arguments]  ${username}  ${contract_uaid}  ${field_name}  ${value}
    Reload Page
    Wait Visibility And Click Element  xpath=//a[contains(@ng-class, 'lot-cont')]
    Wait Visibility And Click Element  xpath=//button[@ng-click='act.toChange()']


Застосувати зміну
    [Arguments]  ${username}  ${contract_uaid}  ${dateSigned}
    Fail  Ключевое слово не реализовано


Завантажити документацію до договору
    [Arguments]  ${username}  ${contract_uaid}  ${file_path}
    Fail  Ключевое слово не реализовано


Внести зміни в договір
    [Arguments]  ${username}  ${contract_uaid}  ${data}
    Fail  Ключевое слово не реализовано


Завершити договір
    [Arguments]  ${username}  ${contract_uaid}
    Fail  Ключевое слово не реализовано


Затвердити постачальників
    [Arguments]  ${username}  ${tender_uaid}
    Wait For Element With Reload  xpath=//button[@data-id='finishQualBtn']  1
    Execute JavaScript    window.scrollTo(${0},${0})
    Wait Visibility And Click Element  xpath=//button[@data-id='finishQualBtn']
    sleep  15s


Встановити ціну за одиницю для контракту
    [Arguments]  ${username}  ${tender_uaid}  ${contract_data}
    ${index}=  Set Variable If
    ...  'ціну за одиницю для першого контракту' in '${TEST_NAME}'  1
    ...  'ціну за одиницю для другого контракту' in '${TEST_NAME}'  2
    ...  'ціну за одиницю для третього контракту' in '${TEST_NAME}'  3
    ${value}=  convert_float_to_string  ${contract_data.data.unitPrices[0].value.amount}
    Wait Until Keyword Succeeds  15min  30s  Дочекатися можливості завантажити рамкову угоду
    Wait Visibility And Click Element  xpath=(//div[@class='agreement-flex-table-item']//button)[${index}]

    ${count}=  Get Matching Xpath Count  xpath=(//div[contains(@class,'agreement-flex-table-item-body')])[${index}]//input[contains(@name,'unit_price')]
    :FOR  ${i}  In Range  0  ${count}
    \  ${xpath_index}=  Evaluate  ${i}+1
    \  Wait Element Visibility And Input Text  xpath=((//div[contains(@class,'agreement-flex-table-item-body')])[${index}]//input[contains(@name,'unit_price')])[${xpath_index}]  ${contract_data.data.unitPrices[0].value.amount}
    Wait Visibility And Click Element  xpath=(//div[@class='agreement-table'])[${index}]

    Wait Visibility And Click Element  xpath=(//button[contains(@ng-click,'vm.publishContractUnitPrices(contract)')])[${index}]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']

    Wait Visibility And Click Element  xpath=//button[contains(text(),'Зберігти зміни')]
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']


Дочекатися можливості завантажити рамкову угоду
    Reload Page
    Wait Visibility And Click Element  css=a#agreementBtn
    Element Should Be Visible  xpath=//input[@name='agreementTitle']


Зареєструвати угоду
    [Arguments]  ${username}  ${tender_uaid}  ${period}
    Wait Until Keyword Succeeds  15min  30s  Дочекатися можливості завантажити рамкову угоду
    Wait Element Visibility And Input Text  xpath=//input[@name='agreementTitle']  ${tender_uaid}
    Wait Element Visibility And Input Text  xpath=//input[@name='agreementNumber']  ${tender_uaid}
    ${startDate}=  privatmarket_service.convert_date_to_format  ${period['startDate']}  %d-%m-%Y %H:%M
    ${endDate}=  privatmarket_service.convert_date_to_format  ${period['endDate']}  %d-%m-%Y %H:%M
    Wait Element Visibility And Input Text  xpath=//input[contains(@data-id,'dateSigned')]  ${startDate}
    Wait Element Visibility And Input Text  xpath=//input[contains(@data-id,'Start')]  ${startDate}
    Wait Element Visibility And Input Text  xpath=//input[contains(@data-id,'End')]  ${endDate}
    ${file_path}  ${file_name}  ${file_content}=  create_fake_doc
    Wait For Ajax
    Wait Visibility And Click Element  xpath=//select[@data-id='filetype']/option[6]
    Sleep  1s
    Wait Visibility And Click Element  xpath=//select[@data-id='filelang']/option[2]
    Sleep  1s
    Execute Javascript  document.querySelector("input[data-id='input-file']").style = "";
    Sleep  1s
    Choose File  css=input[data-id='input-file']  ${file_path}
    Sleep  20s
    Wait Visibility And Click Element  xpath=//button[@ng-click='vm.onSendAgreement()']
    Wait Visibility And Click Element  xpath=//button[@data-id='modal-close']
    sleep  120s
    Reload Page
    Wait Visibility And Click Element  css=a#agreementBtn
    Wait Visibility And Click Element  css=div.agreement div#noEcp
    Завантажити ЕЦП
    sleep  150s