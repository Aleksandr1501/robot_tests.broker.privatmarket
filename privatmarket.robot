*** Settings ***
Library  Selenium2Screenshots
Library  String
Library  DateTime
Library  Selenium2Library
Library  Collections
Library  DebugLibrary
Library  privatmarket_service.py

*** Variables ***
${COMMONWAIT}	30

${tender_data_title}											xpath=//div[contains(@class,'title-div')]
${tender_data_description}										css=div.description
${tender_data_procurementMethodType}							css=div#tenderType
${tender_data_value.amount}										css=div[ng-if='model.budjet'] div.info-item-val
${tender_data_tenderID}											xpath=//div[.='Тендер ID:']/following-sibling::div
${tender_data_procuringEntity.name}								css=a[ng-click='act.openCard()']
${tender_data_enquiryPeriod.startDate}							xpath=(//div[@class='period ng-scope']/div[@class='info-item'])[1]
${tender_data_enquiryPeriod.endDate}							xpath=(//div[@class='period ng-scope']/div[@class='info-item'])[2]
${tender_data_tenderPeriod.startDate}							xpath=(//div[@class='period ng-scope']/div[@class='info-item'])[3]
${tender_data_tenderPeriod.endDate}								xpath=(//div[@class='period ng-scope']/div[@class='info-item'])[4]
${tender_data_auctionPeriod.startDate}							xpath=(//div[@class='period ng-scope']/div[@class='info-item'])[5]
${tender_data_minimalStep.amount}								css=div[ng-if='model.ad.minimalStep.amount'] div.info-item-val
${tender_data_items.description}								css=section[ng-repeat='adb in model.items'] div[title]
${tender_data_items.deliveryDate.endDate}						xpath=//div[contains(@class,'delivery-info')]//div[.='Конец:']/following-sibling::div
${tender_data_items.deliveryLocation.latitude}					css=span.latitude
${tender_data_items.deliveryLocation.longitude}					css=span.longitude
${tender_data_items.deliveryAddress.countryName}				xpath=//div[.='Адрес:']/following-sibling::div
${tender_data_items.deliveryAddress.postalCode}					xpath=//div[.='Адрес:']/following-sibling::div
${tender_data_items.deliveryAddress.region}						xpath=//div[.='Адрес:']/following-sibling::div
${tender_data_items.deliveryAddress.locality}					xpath=//div[.='Адрес:']/following-sibling::div
${tender_data_items.deliveryAddress.streetAddress}				xpath=//div[.='Адрес:']/following-sibling::div
${tender_data_items.classification.scheme}						xpath=//div[@ng-if="adb.classification"]
${tender_data_items.classification.id}							xpath=//div[@ng-if="adb.classification"]
${tender_data_items.classification.description}					xpath=//div[@ng-if="adb.classification"]
${tender_data_items.additionalClassifications[0].scheme}		xpath=//div[@ng-repeat='cl in adb.additionalClassifications'][1]
${tender_data_items.additionalClassifications[0].id}			xpath=//div[@ng-repeat='cl in adb.additionalClassifications'][1]
${tender_data_items.additionalClassifications[0].description}	xpath=//div[@ng-repeat='cl in adb.additionalClassifications'][1]
${tender_data_items.unit.name}									xpath=//div[.='Количество:']/following-sibling::div
${tender_data_items.unit.code}									xpath=//div[.='Количество:']/following-sibling::div
${tender_data_items.quantity}									xpath=//div[.='Количество:']/following-sibling::div
${tender_data_questions[0].description}							css=div.description
${tender_data_questions[0].date}								xpath=//div[@class = 'question-head title']/b[2]
${tender_data_questions[0].title}								css=div.question-head.title span
${tender_data_questions[0].answer}								css=div[ng-bind-html='q.answer']
${tender_data_bids}												xpath=(//table[@class='bids']//tr)[2]
${complaints[0].title}											xpath=(//div[@class='title']/span)[1]
${complaints[0].description}									xpath=(//div[@ng-bind-html='q.description'])[1]
${complaints[0].documents.title}								xpath=(//span[@class='file-name'])[1]
${complaints[0].status}											xpath=(//div[contains(@ng-if,'q.status')])[1]

${locator_tenderCreation.buttonEdit}			xpath=//button[@ng-click='act.createAfp()']
${locator_tenderCreation.buttonSave}			css=button.btn.btn-success
${locator_tenderCreation.buttonBack}			xpath=//a[@ng-click='act.goBack()']
${locator_tenderCreation.description}			css=textarea[ng-model='model.filterData.adbName']

${locator_tenderClaim.buttonCreate}				css=button[ng-click='act.createAfp()']
${locator_tenderClaim.fieldPrice}				xpath=//input[@ng-model='model.price']
${locator_tenderClaim.checkedLot.fieldPrice}	xpath=//input[@ng-model='model.checkedLot.userPrice']
${locator_tenderClaim.fieldEmail}				css=input[ng-model='model.person.email']
${locator_tenderClaim.buttonSend}				css=button[ng-click='act.sendAfp()']
${locator_tenderClaim.buttonCancel}				css=button[ng-click='act.delAfp()']
${locator_tenderClaim.buttonGoBack}				css=a[ng-click='act.ret2Ad()']
${locator_tender.ajax_overflow}					xpath=//div[@class='ajax_overflow']


*** Keywords ***
Підготувати дані для оголошення тендера
	${INITIAL_TENDER_DATA} =  test_tender_data
	[return]	${INITIAL_TENDER_DATA}


Підготувати клієнт для користувача
	[Arguments]  ${username}
	log  ${username}
	[Documentation]  Відкрити брaвзер, створити обєкт api wrapper, тощо

	${service args}=    Create List	--ignore-ssl-errors=true	--ssl-protocol=tlsv1
	${browser} = 	Convert To Lowercase	${USERS.users['${username}'].browser}

	Run Keyword If	'phantomjs' in '${browser}'	Run Keywords	Create Webdriver	PhantomJS	${username}	service_args=${service args}
	...   AND   Go To			${USERS.users['${username}'].homepage}
	...   ELSE	Open Browser	${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${username}

	Set Window Position		@{USERS.users['${username}'].position}
	Maximize Browser Window
	Run Keyword If	'Provider' in '${username}'	Login	${username}


Пошук тендера по ідентифікатору
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  tenderId
	Mark Step								_tender_search_start
	Mark Step								${ARGUMENTS[1]}

	Switch browser							${ARGUMENTS[0]}
	Go to									${USERS.users['${ARGUMENTS[0]}'].homepage}
	Wait Until Element Is Enabled			id=tenders	timeout=${COMMONWAIT}
	Switch To Frame							id=tenders
	Wait For Ajax
	Wait Until Element Is Visible			xpath=//*[@id='sidebar']//input	timeout=${COMMONWAIT}
	Wait Until Element Not Stale			xpath=//*[@id='sidebar']//input	40
	Wait Until Element Is Enabled			xpath=(//div[@class='tender-name_info tender-col'])[1]	timeout=${COMMONWAIT}

	${suite_name} = 	Convert To Lowercase	${SUITE_NAME}
	${education_type} =	Run Keyword If	'negotiation' in '${suite_name}'	Set Variable	False
		...  ELSE	Set Variable	True
	${current_type} =						Get text	css=div.test-mode-aside
	${check_result} =						Run Keyword If	'Войти в обучающий режим' in '${current_type}'	Set Variable  True
	Run Keyword If							${check_result} and ${education_type}	Switch To Education Mode

	Wait For Ajax
	Wait Until Element Not Stale			xpath=(//div[@class='tenders_sm_info'])[1]	40
	Wait Until Element Is Enabled			xpath=(//div[@class='tenders_sm_info'])[1]	timeout=${COMMONWAIT}
	Clear Element Text						xpath=//*[@id='sidebar']//input
	sleep									1s
	Input Text								xpath=//*[@id='sidebar']//input	${ARGUMENTS[1]}
	Wait For Tender							${ARGUMENTS[1]}
	sleep									3s
	Wait Until Element Not Stale			css=span[id='${ARGUMENTS[1]}'] div.tenders_sm_info	40
	Mark Step								befor_click
	Click Element By JS						span[id='${ARGUMENTS[1]}'] div.tenders_sm_info
	Wait For Ajax
	Wait Until Element Is Not Visible		xpath=//*[@id='sidebar']//input	20s
	sleep									2s
	Wait Until Element Is Visible			xpath=//div[contains(@class,'title-div')]	timeout=${COMMONWAIT}
	Mark Step								_tender_search_end


Відкрити детальну інформацию по позиціям
	Wait Until Element Is Visible			css=div.info-item-val a
	Wait Until Element Not Stale			css=div.info-item-val a	40
	@{itemsList}=							Get Webelements	//div[@class='info-item-val']/a
	${item_list_length} = 					Get Length	${itemsList}

	: FOR    ${INDEX}    IN RANGE    0    ${item_list_length}
		\  ${locator_index} =				Evaluate	${INDEX}+1
		\  Wait Until Element Is Visible	xpath=(//div[@class='info-item-val']/a)[${locator_index}]
		\  Scroll Page To Element			xpath=(//div[@class='info-item-val']/a)[${locator_index}]
		\  Wait Until Element Not Stale		${itemsList[${INDEX}]}	40
		\  Click Element					${itemsList[${INDEX}]}
		\  Wait Until Element Is Visible	xpath=(//div[@ng-if='adb.classification'])[${locator_index}]


Створити тендер
	[Arguments]  @{ARGUMENTS}
	Fail  Функція не підтримується майданчиком


Отримати інформацію із тендера
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  element

	Switch browser					${ARGUMENTS[0]}
	Wait Until Element Is Visible		xpath=//div[contains(@class,'title-div')]	timeout=${COMMONWAIT}

	#check tender type
	${item} =	Run Keyword If	'багатопредметного' in '${TEST_NAME}'	Отримати номер позиції	${ARGUMENTS[1]}
		...  ELSE	Convert To Integer	0
	${result1} =	Отримати інформацію зі сторінки	${item}	${ARGUMENTS[1]}

	${element_class} =	Get Element Attribute	css=div[ng-show='adb.showCl']@class
	Run Keyword If	'ng-hide' in '${element_class}'	Відкрити детальну інформацию по позиціям
	[return]	${result1}


Отримати інформацію зі сторінки
	[Arguments]  ${item}  ${base_element}
	[Documentation]
	...	${item} ==  item
	...	${element} ==  element

	${element} = 	Replace String	${base_element}	items[${item}]	items
	Run Keyword If	'questions' in '${element}'		Switch To Tab	2
	...  ELSE	Run Keyword If	'complaints' in '${element}'	Switch To Tab	3
	...  ELSE	Switch To Tab	1

	Run Keyword And Return If	'${element}' == 'value.amount'				Отримати число			${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'minimalStep.amount'		Отримати число			${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'enquiryPeriod.startDate'	Отримати дату та час	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'enquiryPeriod.endDate'		Отримати дату та час	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'tenderPeriod.startDate'	Отримати дату та час	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'tenderPeriod.endDate'		Отримати дату та час	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'questions[0].date'			Отримати дату та час	${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'bids'						Перевірити присутність bids

	Run Keyword And Return If	'${element}' == 'items.classification.scheme'						Отримати строку		${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'items.classification.id'							Отримати строку		${element}	2	${item}
	Run Keyword And Return If	'${element}' == 'items.description'									Отримати текст елемента	${element}	${item}
	Run Keyword And Return If	'${element}' == 'items.quantity'									Отримати ціле число	${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'items.classification.description'					Отримати класифікацію		${element}	${item}
	Run Keyword And Return If	'${element}' == 'items.additionalClassifications[0].scheme'			Отримати строку	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'items.additionalClassifications[0].id'				Отримати строку	${element}	2	${item}
	Run Keyword And Return If	'${element}' == 'items.additionalClassifications[0].description'	Отримати класифікацію	${element}	${item}

	Run Keyword And Return If	'${element}' == 'items.deliveryAddress.postalCode'		Отримати частину адреси	${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryAddress.countryName'		Отримати частину адреси	${element}	1	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryAddress.region'			Отримати частину адреси	${element}	2	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryAddress.locality'		Отримати частину адреси	${element}	3	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryAddress.streetAddress'	Отримати частину адреси	${element}	4	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryDate.endDate'			Отримати дату та час	${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'items.unit.name'						Отримати назву			${element}	${item}
	Run Keyword And Return If	'${element}' == 'items.unit.code'						Отримати код			${element}	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryLocation.latitude'		Отримати число			${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'items.deliveryLocation.longitude'		Отримати число			${element}	0	${item}
	Run Keyword And Return If	'${element}' == 'auctionPeriod.startDate'				Отримати інформацію з ${element}	${element}	${item}
	Run Keyword And Return If	'${element}' == 'procurementMethodType'					Отримати інформацію з ${element}	${element}

	Run Keyword If	'${element}' == 'questions[0].title'		Wait For Element With Reload	${tender_data_${element}}	2
	Run Keyword If	'${element}' == 'questions[0].answer'		Wait For Element With Reload	${tender_data_${element}}	2

	Wait Until Element Is Visible	${tender_data_${element}}	timeout=${COMMONWAIT}
	${result_full} =				Get Text	${tender_data_${element}}
	${result} =						Strip String	${result_full}
	[return]	${result}


Отримати текст елемента
	[Arguments]  ${element_name}  ${item}
	Wait Until Element Is Visible	${tender_data_${element_name}}
	@{itemsList}=					Get Webelements	${tender_data_${element_name}}
	${num} =						Set Variable	${item}
	${result_full} =				Get Text		${itemsList[${num}]}
	[return]	${result_full}


Отримати строку
	[Arguments]  ${element_name}  ${position_number}  ${item}
	${result_full} =				Отримати текст елемента	${element_name}	${item}
	${result} =						Strip String	${result_full}
	${result} =						Replace String	${result}	,	${EMPTY}
	${result} =						Replace String	${result}	:	${EMPTY}
	${values_list} =				Split String	${result}
	[return]	${values_list[${position_number}]}


Отримати число
	[Arguments]  ${element_name}  ${position_number}  ${item}
	${value}=	Отримати строку		${element_name}	${position_number}	${item}
	${result}=	Convert To Number	${value}
	[return]	${result}


Отримати ціле число
	[Arguments]  ${element_name}  ${position_number}  ${item}
	${value}=	Отримати строку		${element_name}	${position_number}	${item}
	${result}=	Convert To Integer	${value}
	[return]	${result}


Отримати дату та час
	[Arguments]  ${element_name}  ${shift}  ${item}
	${result_full} =	Отримати текст елемента	${element_name}	${item}
	${work_string} =	Replace String		${result_full}	${SPACE},${SPACE}	${SPACE}
	${work_string} =	Replace String		${result_full}	,${SPACE}	${SPACE}
	${values_list} =	Split String		${work_string}
	${day} =			Convert To String	${values_list[0 + ${shift}]}
	${month} =			get_month_number	${values_list[1 + ${shift}]}
	${year} =			Convert To String	${values_list[2 + ${shift}]}
	${time} =			Convert To String	${values_list[3 + ${shift}]}
	${result}=			Convert To String	${year}-${month}-${day} ${time}
	[return]	${result}


Отримати частину адреси
	[Arguments]  ${element_name}  ${position_number}  ${item}
	${result_full} =	Отримати текст елемента	${element_name}	${item}
	${result} =			Strip String	${result_full}
	${values_list} =	Split String	${result}		,${SPACE}
	${length} =	Get Length	${values_list}
	${result} =	Run Keyword If	'${position_number}' == '4' and ${length} > 5	Set variable	${values_list[4]}, ${values_list[5]}
		...  ELSE	Set variable	${values_list[${position_number}]}
	[return]	${result}


Отримати класифікацію
	[Arguments]  ${element_name}  ${item}
	${result_full} =	Отримати текст елемента	${element_name}	${item}
	${reg_expresion} =	Set Variable	[A-zА-Яа-яёЁЇїІіЄєҐґ\\s]+\: \\w+[\\d\\.\\-]+ ([А-Яа-яёЁЇїІіЄєҐґ\\s;,\\"_\\(\\)]+)
	${result} =			Get Regexp Matches	${result_full}	${reg_expresion}	1
	[return]	${result[0]}


Отримати назву
	[Arguments]  ${element_name}  ${item}
	${result_full} =	Отримати текст елемента	${element_name}	${item}
	${result} =	Run Keyword If	'килограмм' in '${result_full}'	Set Variable	кілограм
		...  ELSE	Set Variable	${result_full}
	[return]	${result}


Отримати код
	[Arguments]  ${element_name}  ${item}
	${result_full} =	Отримати текст елемента	${element_name}	${item}
	${result} =	Run Keyword If	'килограмм' in '${result_full}'	Set Variable	KGM
		...  ELSE	Set Variable	${result_full}
	[return]	${result}


Отримати номер позиції
	[Arguments]  ${element_name}
	Mark Step  _in_type_check
	${item} =	Get Regexp Matches	${element_name}	items\\[(\\d)\\]	1
	${length} =	Get Length	${item}
	${result} =	Run Keyword If	'${length}' == '0'	Set Variable	0
		...  ELSE	Convert To Integer	${item[0]}
	Mark Step	_after_type_check name = ${element_name} item=${item[0]} result=${result}
	[return]  ${result}


Перевірити присутність bids
	Element Should Not Be Visible	${tender_data_${element}}
	#element is not visible
	[return]	${None}


Отримати інформацію з auctionPeriod.startDate
	[Arguments]  ${element}  ${item}
	Wait For Element With Reload	${tender_data_${element}}	1
	${start_date} =					Отримати дату та час	${element}	1	${item}
	[return]  ${start_date}


Отримати інформацію з procurementMethodType
	[Arguments]  ${element_name}
	${method_name} =	Get text	${tender_data_${element_name}}
	${method_type} =	get_procurement_method_type	${method_name}
	[return]  ${method_type}


Внести зміни в тендер
	[Arguments]  @{ARGUMENTS}
	Fail  Функція не підтримується майданчиком


Створити вимогу
	[Arguments]  ${user}  ${tender_id}  ${complaints}
	privatmarket.Пошук тендера по ідентифікатору	${user}	${tenderId}
	Mark Step							_start_complaint
	Switch To Tab						3
	Wait Enable And Click Element		xpath=//button[contains(@ng-click, 'act.setComplaintOnlyTender()')]
	Mark Step							_fill_data
	Wait For Ajax
	Wait For Element Value				css=input[ng-model='model.person.phone']
	Wait Until Element Is Visible		xpath=//input[@ng-model='model.complaint.user.title']	timeout=${COMMONWAIT}
	Wait Until Element Is Enabled		xpath=//input[@ng-model='model.complaint.user.title']	timeout=${COMMONWAIT}
	Input Text							xpath=//input[@ng-model='model.complaint.user.title']	${complaints.data.title}
	Input Text							css=div.info-item-val textarea							${complaints.data.description}
	Scroll Page To Element				xpath=//input[@ng-model='model.person.email']
	Input Text							xpath=//input[@ng-model='model.person.email']			${USERS.users['${user}'].email}
	Click Button						css=button[ng-click='act.saveComplaint()']
	Wait For Ajax
	Wait Until Element Is Enabled		css=div.alert-info	timeout=${COMMONWAIT}
	Wait Until Element Not Stale		css=div.alert-info	40
	Wait Until Element Contains			css=div.alert-info	Ваше требование успешно сохранено!	timeout=10
	${claim_data} =	Create Dictionary	id=123
	${claim_resp} =	Create Dictionary	data=${claim_data}
	[return]  ${claim_resp}


Завантажити документацію до вимоги
	[Arguments]  ${user}  ${tender_id}  ${complaints}  ${document}
	${correctFilePath} = 				Replace String	${document}	\\	\/
	Execute Javascript					$("#fileToUpload").removeClass();
	Choose File							css=input#fileToUpload	${correctFilePath}
	sleep								5s
	Wait Until Element Is Visible		css=div.file-item
	[return]  ${document}


Подати вимогу
	[Arguments]  ${user}  ${tender_id}  ${complaints}  ${confrimation_data}
	Click Button						xpath=//button[@ng-click='act.sendComplaint()']
	Mark Step							_start_complaint_finished
	Wait For Ajax
	Wait Until Element Is Enabled		css=div.alert-info	timeout=${COMMONWAIT}
	Wait Until Element Not Stale		css=div.alert-info	40
	Wait Until Element Contains			css=div.alert-info	Ваше требование успешно отправлено!	timeout=10
	Wait For Ajax
	sleep								3s
	Wait Until Element Is Not Visible	xpath=//input[@ng-model="model.question.title"]	timeout=${COMMONWAIT}
	Wait For Ajax
	Wait Until Element Not Stale		css=span[ng-click='act.hideModal()']	40
	Click Element						css=span[ng-click='act.hideModal()']
	sleep								3s
	Wait Until Element Is Not Visible	css=div.info-item-val textarea	timeout=30

Скасувати вимогу
	[Arguments]    ${user}  ${tender_id}  ${claim_data}  ${cancellation_data}
	Wait Until Element Is Visible		css=a[ng-click='act.showCancelComplaintWnd(q)']	timeout=${COMMONWAIT}
	Wait Until Element Is Enabled		css=a[ng-click='act.showCancelComplaintWnd(q)']	timeout=${COMMONWAIT}
	Click element						css=a[ng-click='act.showCancelComplaintWnd(q)']

	Wait Until Element Is Visible		xpath=//textarea[@ng-model='model.cancelComplaint.reason']	timeout=${COMMONWAIT}
	Wait Until Element Is Enabled		xpath=//textarea[@ng-model='model.cancelComplaint.reason']	timeout=${COMMONWAIT}
	Wait Until Element Not Stale		xpath=//textarea[@ng-model='model.cancelComplaint.reason']	40
	Input Text							xpath=//textarea[@ng-model='model.cancelComplaint.reason']	${cancellation_data.data.cancellationReason}
	Click Button						css=button[ng-click='act.cancelComplaint()']
	Wait For Ajax
	Wait Until Element Is Not Visible	css=button[ng-click='act.cancelComplaint()']	timeout=${COMMONWAIT}
	Wait Until Element Contains			css=div[ng-if*='cancelled'	Отменена автором	timeout=${COMMONWAIT}


Задати питання
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  tenderId
	...	${ARGUMENTS[2]} ==  question_id

	Mark Step  Пошук тендера по ідентифікатору ${ARGUMENTS[0]} ${ARGUMENTS[1]}
	privatmarket.Пошук тендера по ідентифікатору		${ARGUMENTS[0]}	${ARGUMENTS[1]}
	Mark Step							_asking_question_start
	Wait For Ajax
	Mark Step							_asking_question_select_right_tab
	Switch To Tab						2
	Wait Until Element Not Stale		xpath=//button[@ng-click='act.sendEnquiry()']	40
	Wait Until Element Is Enabled		xpath=//button[@ng-click='act.sendEnquiry()']				timeout=10
	Click Button						xpath=//button[@ng-click='act.sendEnquiry()']
	Mark Step							_asking_question_send
	Wait For Ajax
	sleep								4s
	Wait For Element Value				css=input[ng-model='model.person.phone']
	Wait Until Element Not Stale		xpath=//input[@ng-model="model.question.title"]	40
	Wait Until Element Is Visible		xpath=//input[@ng-model="model.question.title"]				timeout=10
	Wait Until Element Is Enabled		xpath=//input[@ng-model="model.question.title"]				timeout=10
	Input text							xpath=//input[@ng-model="model.question.title"]				${ARGUMENTS[2].data.title}
	Input text							xpath=//textarea[@ng-model='model.question.description']	${ARGUMENTS[2].data.description}
	Input text							xpath=//input[@ng-model='model.person.email']				${USERS.users['${ARGUMENTS[0]}'].email}
	Click Button						xpath=//button[@ng-click='act.sendQuestion()']
	Mark Step							_asking_question_finished
	Wait For Ajax
	Mark Step							_asking_question_wait_for_allert
	Wait Until Element Is Enabled		xpath=//div[@class='alert-info ng-scope ng-binding']	timeout=${COMMONWAIT}
	Wait Until Element Not Stale		xpath=//div[@class='alert-info ng-scope ng-binding']	40
	Wait Until Element Contains			xpath=//div[@class='alert-info ng-scope ng-binding']	Ваш вопрос успешно помещен в очередь на отправку. Спасибо за обращение!	timeout=10
	Wait For Ajax
	Wait Until Element Not Stale		css=span[ng-click='act.hideModal()']	40
	Click Element						css=span[ng-click='act.hideModal()']
	Wait Until Element Is Not Visible	xpath=//input[@ng-model="model.question.title"]	timeout=20
	Mark Step							_asking_question_end


Оновити сторінку з тендером
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  tenderId

	privatmarket.Пошук тендера по ідентифікатору		@{ARGUMENTS}[0]	@{ARGUMENTS}[1]


Подати цінову пропозицію
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  tenderId
	...	${ARGUMENTS[2]} ==  bid

	Run Keyword If	'без прив’язки до лоту' in '${TEST_NAME}'	Fail  Така ситуація не може виникнути
	Run Keyword If	'без нецінового показника' in '${TEST_NAME}'	Fail  Така ситуація не може виникнути

	Switch browser						${ARGUMENTS[0]}
	privatmarket.Пошук тендера по ідентифікатору	${ARGUMENTS[0]}   ${ARGUMENTS[1]}

	Відкрити заявку
	sleep								5s
	Mark Step							_claim_creation_set_price
	Wait Until Element Not Stale		${locator_tenderClaim.fieldEmail}	40
	Run Keyword If	'multiLotTender' in '${SUITE_NAME}'	Input Text	${locator_tenderClaim.checkedLot.fieldPrice}	${Arguments[2].data.lotValues[1]['value']['amount']}
		...  ELSE	Input Text	${locator_tenderClaim.fieldPrice}	${Arguments[2].data.value.amount}

	click element						${locator_tenderClaim.fieldEmail}
	Input Text							${locator_tenderClaim.fieldEmail}	${USERS.users['${ARGUMENTS[0]}'].email}
	Mark Step							_claim_creation_send_request
	Click element						css=input[ng-disabled='model.selfQualifiedDisabled']
	Click element						css=input[ng-disabled='model.selfEligibleDisabled']
	sleep								5s
	Scroll Page To Element				${locator_tenderClaim.buttonSend}
	Click Button						${locator_tenderClaim.buttonSend}
	Wait For Ajax Overflow Vanish
	Close confirmation					Ваша заявка была успешно помещена в очередь на отправку!
	Mark Step							_claim_creation_save_information
	Wait Until Element Is Visible		css=div.afp-info.ng-scope.ng-binding
	wait until element contains			css=div.afp-info.ng-scope.ng-binding	Номер заявки
	Wait For Ajax
	${claim_id}=						Get text			css=div.afp-info.ng-scope.ng-binding
	${result}=							Get Regexp Matches	${claim_id}	Номер заявки: (\\d*),	1

	Run Keyword If	'openUA' in '${SUITE_NAME}'	Run Keywords	Click Element	css=a[ng-click='act.ret2Ad()']
	...   AND   Wait For Element With Reload	xpath=//table[@class='bids']//tr[1]/td[4 and contains(., 'Отправлена')]	1
	[return]	${Arguments[2]}


Дочекатися статусу заявки
	[Arguments]  ${status}
	Wait Until Element Is Visible		xpath=//table[@class='bids']//tr[1]/td[4]
	Wait Until Keyword Succeeds			1min	10s	Element Should contain	xpath=//table[@class='bids']//tr[1]/td[4]	${status}


Відкрити заявку
	Wait For Ajax
	Mark Step							_claim_creation_start
	Wait Until Element Is Visible		xpath=//span[@class='state-label ng-binding']
	Mark Step							_claim_creation_get_tender_status

	${tender_status} =	Run Keyword If	'multiLotTender' in '${SUITE_NAME}'	Get text	xpath=(//span[@class='state-label ng-binding'])[2]
		...  ELSE	Get text	xpath=//span[@class='state-label ng-binding']

	Run Keyword Unless	'до початку періоду подачі' in '${TEST_NAME}'	Run Keyword If	'${tender_status}' == 'Период уточнений завершен'	Wait For Element With Reload	${locator_tenderClaim.buttonCreate}	1

	Scroll Page To Element				${locator_tenderClaim.buttonCreate}
	Sleep								2s
	Wait Until Element Not Stale		${locator_tenderClaim.buttonCreate}	30
	Wait Enable And Click Element		${locator_tenderClaim.buttonCreate}
	Wait Until Element Is Not Visible	${locator_tenderClaim.buttonCreate}	50s
	Wait For Element Value				css=input[ng-model='model.person.lastName']
	Mark Step							_claim_creation_wait_data_load
	sleep								5s
	Wait Until Element Is Enabled		${locator_tenderClaim.fieldEmail}	20


Змінити цінову пропозицію
	[Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
	privatmarket.Пошук тендера по ідентифікатору	${username}   ${tender_uaid}
	Wait For Ajax

	Mark Step							_claim_edit_start
	Wait Enable And Click Element		${locator_tenderClaim.buttonCreate}
	Wait For Ajax
	Wait For Element Value				css=input[ng-model='model.person.lastName']
	Wait Until Element Is Enabled		${locator_tenderClaim.fieldEmail}	${COMMONWAIT}
	sleep								5s

	Run Keyword 						Змінити ${fieldname}	${fieldvalue}
	Run Keyword Unless	'openUA' in '${SUITE_NAME}'	Run Keywords	Click Element	${locator_tenderClaim.fieldEmail}
	...   AND   Input Text	${locator_tenderClaim.fieldEmail}	${USERS.users['${username}'].email}

	Scroll Page To Element				${locator_tenderClaim.buttonSend}
	Click Button						${locator_tenderClaim.buttonSend}

	${test_name} =	Convert To Lowercase	${TEST_NAME}
	Run Keyword If	'оновити статус цінової пропозиції'	in ${test_name}	Close confirmation	Ваша заявка была успешно сохранена!
		...  ELSE	Close confirmation	Ваша заявка была успешно помещена в очередь на отправку!

	Mark Step							_claim_edit_save_information
	Wait Until Element Is Visible		css=div.afp-info.ng-scope.ng-binding
	Wait For Ajax
	${claim_id}=						Get text			css=div.afp-info.ng-scope.ng-binding
	${result}=							Get Regexp Matches	${claim_id}	Номер заявки: (\\d*),	1
	[return]	${fieldname}


Змінити parameters.0.value
	[Arguments]  ${fieldvalue}
	Select From List	xpath=(//select[@ng-model='feature.userValue'])[1]	${fieldvalue}


Змінити lotValues.0.value.amount
	[Arguments]  ${fieldvalue}
	Input Text	${locator_tenderClaim.checkedLot.fieldPrice}	${fieldvalue}


Змінити value.amount
	[Arguments]  ${fieldvalue}
	Run Keyword If	'multiLotTender' in '${SUITE_NAME}'	Input Text	${locator_tenderClaim.checkedLot.fieldPrice}	${fieldvalue}
		...  ELSE	Input Text	${locator_tenderClaim.fieldPrice}	${fieldvalue}


Змінити status
	[Arguments]  ${fieldvalue}
	Mark Step	_change_status
#	лише клікаємо зберегти, нічого не змінюючи


Скасувати цінову пропозицію
	[Arguments]  @{ARGUMENTS}
	[Documentation]
	...	${ARGUMENTS[0]} ==  username
	...	${ARGUMENTS[1]} ==  tenderId

	privatmarket.Пошук тендера по ідентифікатору	${ARGUMENTS[0]}	${ARGUMENTS[1]}
	Wait For Ajax
	Wait Enable And Click Element		${locator_tenderClaim.buttonCreate}
	Wait Enable And Click Element		${locator_tenderClaim.buttonCancel}
	Close Confirmation					Ваша заявка успешно отменена!
	Wait Until Element Is Enabled		${locator_tenderClaim.buttonCreate}	${COMMONWAIT}
	[return]	${ARGUMENTS[1]}


Отримати пропозицію
	[Arguments]  ${username}  ${tender_uaid}
	${button_of_send_claim_text} =	Get text	${locator_tenderClaim.buttonCreate}
	${status} =	Set Variable If	'Подать заявку' in '${button_of_send_claim_text}'	invalid	unknown
	${bid} =	get_bid_data	${status}
	[return]	${bid}


Відповісти на питання
	[Arguments]  @{ARGUMENTS}
	Fail  Функція не підтримується майданчиком


Завантажити документ в ставку
	[Arguments]  ${user}  ${filePath}  ${tenderId}
	privatmarket.Пошук тендера по ідентифікатору	${user}   ${tenderId}
	Відкрити заявку
	Input Text							${locator_tenderClaim.fieldEmail}	${USERS.users['${user}'].email}

	Mark Step							_3
	Wait Until Element Is Enabled		css=button[ng-click='act.chooseFile()']	${COMMONWAIT}
	Scroll Page To Element				css=button[ng-click='act.chooseFile()']
	sleep  3s
	Mark Step							_read_file_data
	${fileContent} =					readFileContent	${filePath}
	${correctFilePath} = 				Replace String		${filePath}	\\	\/
	Mark Step							${fileContent}
	Mark Step							${correctFilePath}

	Execute Javascript					$("#fileToUpload").removeClass();
	Choose File							css=input#fileToUpload	${correctFilePath}

	${upload_response} =	Зберегти доданий файл	${filePath}
	#before step for Change File
	privatmarket.Пошук тендера по ідентифікатору	${user}	${tenderId}
	[return]	${upload_response}


Зберегти доданий файл
	[Arguments]  ${filePath}
	Wait Until Element Is Not Visible	css=div[ng-show='progressVisible'] div.progress-bar	timeout=30
	Sleep								5s
	Wait Until Element Is Visible		xpath=(//div[contains(@class, 'file-item')])[1]	timeout=30
	Click Button						${locator_tenderClaim.buttonSend}
	Close confirmation					Ваша заявка была успешно сохранена!
	${dateModified}						Get text	css=span.file-tlm
	Click Element						${locator_tenderClaim.buttonGoBack}
	wait until element is visible		css=table.bids tr
	Wait For Element With Reload		xpath=//table[@class='bids']//tr[1]/td//img[contains(@src,'clip_icon.png')]	1

	#получим ссылку на файл и его id
	Scroll Page To Element				css=a[ng-click='act.showDocWin(b)']
	Click Element						css=a[ng-click='act.showDocWin(b)']
	Wait For Ajax
	Wait Until Element Is Enabled		css=div.modal div.file-item	5s
	${url} = 							Execute Javascript	var scope = angular.element($("div.modal div.file-item")).scope(); return scope.file.url
	${uploaded_file_data} =				fill_file_data  ${url}  ${filePath}  ${dateModified}  ${dateModified}
	${upload_response} = 				Create Dictionary
	Set To Dictionary					${upload_response}	upload_response	${uploaded_file_data}
	[return]	${upload_response}


Змінити документ в ставці
	[Arguments]  ${user}  ${filePath}  ${bidid}  ${docid}
	Відкрити заявку
	Scroll Page To Element				css=button[ng-click='act.chooseFile()']
	sleep  2s

	Mark Step							_read_file_data
	${fileContent} =					readFileContent	${filePath}
	${correctFilePath} = 				Replace String		${filePath}	\\	\/
	Mark Step							${fileContent}
	Mark Step							${correctFilePath}

	Execute Javascript					$("#fileToUpload").removeClass();
	Execute Javascript					angular.element($("input[ng-model='model.fileName']")).scope().$parent.act.changeFile(angular.element("div.file-item").scope().file);
	Choose File   						css=input#fileToUpload    ${correctFilePath}

	Wait Until Element Is Not Visible	css=div[ng-show='progressVisible'] div.progress-bar	timeout=30
	Sleep								5s
	Wait Until Element Is Visible		xpath=(//div[contains(@class, 'file-item')])[1]	timeout=30
	Click Button						${locator_tenderClaim.buttonSend}
	Close confirmation					Ваша заявка была успешно сохранена!

	${uploaded_file_data} =				Зберегти доданий файл	${filePath}
	[return]  ${uploaded_file_data}


Обробити скаргу
	[Arguments]  @{ARGUMENTS}
#	TODO  Не реализована возможность
	Fail  Функція не підтримується майданчиком


Отримати посилання на аукціон для глядача
	[Arguments]  ${user}  ${tenderId}
	${result} =	Отримати посилання на аукціон	${user}  ${tenderId}


Отримати посилання на аукціон для учасника
	[Arguments]  ${user}  ${tenderId}
	${result} =	Отримати посилання на аукціон	${user}  ${tenderId}


Отримати посилання на аукціон
	[Arguments]  ${user}  ${tenderId}
	privatmarket.Пошук тендера по ідентифікатору	${user}   ${tenderId}
	Wait For Element With Reload					css=a[ng-click='act.takePart()']	1
	Execute Javascript								return angular.element($("a[ng-click='act.takePart()']")).scope().model.ad.auctionUrl;


#Custom Keywords
Login
	[Arguments]  ${username}
	Click Element						xpath=//span[.='Мой кабинет']
	Wait Until Element Is Visible		id=p24__login__field	${COMMONWAIT}
	Execute Javascript					$('#p24__login__field').val(${USERS.users['${username}'].login})
	Check If Element Stale				xpath=//div[@id="login_modal" and @style='display: block;']//input[@type='password']
	Input Text							xpath=//div[@id="login_modal" and @style='display: block;']//input[@type='password']	${USERS.users['${username}'].password}
	Click Element						xpath=//div[@id="login_modal" and @style='display: block;']//button[@type='submit']
	Wait Until Element Is Visible		css=ul.user-menu  timeout=30


Wait For Ajax
	Wait For Condition	return window.jQuery!=undefined && jQuery.active==0	${COMMONWAIT}


Wait Until Element Not Stale
	[Arguments]  ${locator}  ${time}
	sleep 			2s
	${left_time} =	Evaluate  ${time}-2
	${element_state} =	Check If Element Stale	${locator}
	run keyword if  ${element_state} and ${left_time} > 0	Wait Until Element Not Stale	${locator}	${left_time}


Check If Element Stale
	[Arguments]  ${locator}
	${element} =	Get Webelement	${locator}
	${element_state} =	is_element_not_stale	${element}
	[return]  ${element_state}


Switch To Frame
	[Arguments]  ${frameId}
	Wait Until Element Is enabled	${frameId}	${COMMONWAIT}
	Select Frame					${frameId}


Wait Enable And Click Element
	[Arguments]  ${elementLocator}
	Wait Until Element Is enabled	${elementLocator}	${COMMONWAIT}
	Click Element					${elementLocator}
	Wait For Ajax


Wait Visibulity And Click Element
	[Arguments]  ${elementLocator}
	Wait Until Element Is Visible	${elementLocator}	${COMMONWAIT}
	Click Element					${elementLocator}


Mark Step
	[Arguments]  ${stepName}
	${time} =	Get Time
	log to console	_${stepName} - ${time}


Change Feild Value
	[Arguments]	${locator}	${value}
	Wait For Ajax
	${cssLocator} =	Get Substring	${locator}	4
	sleep							4s
	Wait For Condition				return window.$($("${cssLocator}")).val()!=''	${COMMONWAIT}
	Input Text						${locator}	${value}
	Mark Step						_feild_value_was_changed


Close Confirmation
	[Arguments]	${confirmation_text}
	Wait For Ajax
	Wait Until Element Is Visible		css=p.ng-binding	${COMMONWAIT}	${COMMONWAIT}
	Wait Until Element Contains			css=p.ng-binding	${confirmation_text}	${COMMONWAIT}
	sleep								2s
	Wait Visibulity And Click Element	xpath=//button[@ng-click='close()']
	Wait Until Element Is Not Visible	xpath=//button[@ng-controller='inFrameModalCtrl']	${COMMONWAIT}


Wait For Element Value
	[Arguments]	${locator}
	Wait For Ajax
	${cssLocator} =	Get Substring	${locator}	4
	Wait For Condition				return window.$($("${cssLocator}")).val()!='' && window.$($("${cssLocator}")).val()!='None'	${COMMONWAIT}
	${value}=	get value			${locator}
	Mark Step						_value_when_we_wait_it_${value}


Scroll Page To Element
	[Arguments]	${locator}
	${cssLocator} =		Run Keyword If	'css' in '${TEST_NAME}'	Get Substring	${locator}	4
		...  ELSE	Get Substring	${locator}	6
	${js_expresion} =	Run Keyword If	'css' in '${TEST_NAME}'	Convert To String	return window.$("${cssLocator}")[0].scrollIntoView()
		...  ELSE	Convert To String	return window.$x("${cssLocator}")[0].scrollIntoView()
	Sleep	2s


Wait For Tender
	[Arguments]	${tender_id}
	Wait Until Keyword Succeeds			10min	15s	Try Search Tender	${tender_id}


Try Search Tender
	[Arguments]	${tender_id}
	Click Element						xpath=//div[@class="search-aside"]/span
	Wait For Ajax Overflow Vanish
	Wait Until Element Is Enabled		id=${tender_id}	timeout=10
	[return]	true


Switch To Education Mode
	Wait Until Element Is Enabled		css=div.test-mode-aside a	timeout=${COMMONWAIT}
	Sleep								3s
	Click Element						css=div.test-mode-aside a
	Wait Until Element Contains			css=div.test-mode-aside a	Выйти из обучающего режима	${COMMONWAIT}
	Wait For Ajax Overflow Vanish


Reload And Switch To Tab
	[Arguments]  ${tab_number}
	Reload Page
	Switch To Frame		id=tenders
	Switch To Tab		${tab_number}
	Wait For Ajax


Switch To Tab
	[Arguments]  ${tab_number}
	${class} =	Get Element Attribute	xpath=(//ul[@class='widget-header-block']//a)[${tab_number}]@class
	Run Keyword Unless	'white-icon' in '${class}'	Wait Visibulity And Click Element	xpath=(//ul[@class='widget-header-block']//a)[${tab_number}]


Wait For Element With Reload
	[Arguments]  ${locator}  ${tab_number}
	Mark Step							_i_will_wait
	Wait Until Keyword Succeeds			4min	10s	Try Search Element	${locator}	${tab_number}


Try Search Element
	[Arguments]	${locator}  ${tab_number}
	Mark Step							_i_start
	Reload And Switch To Tab			${tab_number}
	Mark Step							_i_reloaded
	Wait For Ajax
	Wait Until Element Is Visible		${locator}	5
	Wait Until Element Is Enabled		${locator}	5
	[return]	true


Wait For Ajax Overflow Vanish
	Wait Until Element Is Not Visible	${locator_tender.ajax_overflow}	${COMMONWAIT}


Click element by JS
	[Arguments]	${locator}
	Execute Javascript					window.$("${locator}").mouseup()
