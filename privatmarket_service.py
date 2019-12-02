# coding=utf-8

import os
import sys
from dateutil import parser
from datetime import datetime
from pytz import timezone
import re
import datetime
import dateutil.parser
from datetime import timedelta


def modify_test_data(initial_data):
    # set user name
    # initial_data['procuringEntity']['name'] = u'Товариство З Обмеженою Відповідальністю \'Мак Медіа Прінт\''
    initial_data['procuringEntity']['name'] = u'ТОВ \"СФ \"РУБІЖНЕ\"'
    if 'contactPoint' in initial_data['procuringEntity']:
        initial_data['procuringEntity']['contactPoint']['telephone'] = u'+380670444580'
        initial_data['procuringEntity']['contactPoint']['url'] = u'https://dadadad.com'
    initial_data['procuringEntity']['identifier']['legalName'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"СІЛЬСЬКОГОСПОДАРСЬКА ФІРМА \"РУБІЖНЕ\"'
    initial_data['procuringEntity']['identifier']['id'] = u'38580144'
    # #
    initial_data['buyers'][0]['identifier']['id'] = u'38580144'
    initial_data['buyers'][0]['identifier']['legalName'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"СІЛЬСЬКОГОСПОДАРСЬКА ФІРМА \"РУБІЖНЕ\"'
    initial_data['buyers'][0]['name'] = u'ТОВ \"СФ \"РУБІЖНЕ\"'
    initial_data['tender']['tenderPeriod']['startDate'] = add_day_to_date(initial_data['tender']['tenderPeriod']['startDate'])

    # initial_data['procuringEntity']['name'] = u'Макстрой Діск, Товариство З Обмеженою Відповідальністю'
    # initial_data['procuringEntity']['name'] = u'ФОП ОГАНІН ОЛЕКСАНДР ПЕТРОВИЧ'
    return initial_data

def convert_date_to_format(date, format):
    dat = dateutil.parser.parse(date)
    return dat.strftime(format)

def add_day_to_date(date):
    dat = parser.parse(date)
    new_date = (dat + timedelta(days=1)).strftime('%Y-%m-%dT%H:%M:%S%z')
    new = parser.parse(new_date).isoformat()
    return new

def get_currency_type(currency):
    if isinstance(currency, str):
        currency = currency.decode("utf-8")
    currency_dictionary = {
        u'грн': 'UAH'
    }
    currency_type = currency_dictionary.get(currency)
    if currency_type:
        return currency_type
    else:
        return currency


def get_month_number(month_name):
    monthes = [u"января", u"февраля", u"марта", u"апреля", u"мая", u"июня",
               u"июля", u"августа", u"сентября", u"октября", u"ноября", u"декабря",
               u"янв.", u"февр.", u"мар.", u"апр.", u"мая.", u"июн.",
               u"июл.", u"авг.", u"сент.", u"окт.", u"нояб.", u"дек.",
               u"січ.", u"лют.", u"бер.", u"квіт.", u"трав.", u"черв.",
               u"лип.", u"серп.", u"вер.", u"жовт.", u"лист.", u"груд.",
               u"січня", u"лютого", u"березня", u"квітня", u"травня", u"червня",
               u"липня", u"серпня", u"вересня", u"жовтня", u"листопада", u"грудня"]
    return monthes.index(month_name) % 12 + 1


def get_time_with_offset(date):
    date_obj = datetime.datetime.strptime(date, "%Y-%m-%d %H:%M")
    time_zone = timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime('%Y-%m-%d %H:%M:%S.%f%z')


# def get_time_with_offset_formatted(date, input_format_date, output_format):
#     date_obj = datetime.datetime.strptime(date, input_format_date)
#     time_zone = timezone('Europe/Kiev')
#     localized_date = time_zone.localize(date_obj)
#     return localized_date.strftime(output_format)

def get_time_with_offset_formatted(date, input_format_date):
    tz = timezone('Europe/Kiev')
    date_obj = datetime.datetime.strptime(date, input_format_date)
    res = tz.localize(date_obj)
    result = res.isoformat()
    return result


def get_current_date():
    now = datetime.now()
    return now.strftime('%d-%m-%Y')


def get_unit_code(name):
    dictionary = {
        u'кілограми': u'KGM',
        u'пара': u'PR',
        u'літр': u'LTR',
        u'набір': u'SET',
        u'пачок': u'NMP',
        u'метри': u'MTR',
        u'лот': u'LO',
        u'послуга': u'E48',
        u'метри кубічні': u'MTQ',
        u'ящик': u'BX',
        u'рейс': u'E54',
        u'тони': u'TNE',
        u'метри квадратні': u'MTK',
        u'кілометри': u'KMT',
        u'штуки': u'H87',
        u'місяць': u'MON',
        u'пачка': u'RM',
        u'упаковка': u'PK',
        u'гектар': u'HAR',
        u'блок': u'D64',
        u'Флакон': u'VI'
    }
    expected_name = dictionary.get(name)
    if expected_name:
        return expected_name
    else:
        return name


def get_unit_name(current_name):
    if isinstance(current_name, str):
        current_name = current_name.decode("utf-8")
    dictionary = {
        u'кілограми': {u'килограмм', u'килограмма', u'килограммов'},
        u'пара': {u'пара', u'пары', u'пар'},
        u'літр': {u'литр', u'литра', u'литров'},
        u'набір': {u'набор', u'набора', u'наборов'},
        u'пачок': {u'пачка', u'пачек', u'пачки'},
        u'метри': {u'метр', u'метра', u'метров'},
        u'лот': {u'лот', u'лоты', u'лотов'},
        u'послуга': {u'услуга', u'услуг', u'услуги'},
        u'метри кубічні': {u'метр кубический', u'метра кубического', u'метров кубических'},
        u'ящик': {u'ящик', u'ящика', u'ящиков'},
        u'рейс': {u'рейс', u'рейса', u'рейсов'},
        u'тони': {u'тонна', u'тонны', u'тонн'},
        u'метри квадратні': {u'метр квадратный', u'метра квадратного', u'метров квадратных'},
        u'кілометри': {u'километр', u'километров', u'километра'},
        u'штуки': {u'штука', u'штуки', u'штук', u'Штуки'},
        u'місяць': {u'месяц', u'месяца', u'месяцев'},
        u'пачка': {u'пачка', u'пачек', u'пачкики'},
        u'упаковка': {u'упаковка', u'упаковок', u'упаковки'},
        u'гектар': {u'гектар', u'гектара', u'гектаров'},
        u'блок': {u'блок', u'блока', u'блоков'}
    }

    expected_name = None
    dictionary.get(current_name)
    for name, variants in dictionary.iteritems():
        if current_name in variants:
            expected_name = name

    if expected_name:
        return expected_name
    else:
        return current_name


def get_unit_name_ru(current_name):
    if isinstance(current_name, str):
        current_name = current_name.decode("utf-8")
    dictionary = {
        u'килограмм': {u'килограмм', u'килограмма', u'килограммов', u'кілограми'},
        u'пара': {u'пара', u'пары', u'пар'},
        u'литр': {u'литр', u'литра', u'литров'},
        u'набора': {u'набір', u'набора', u'наборов'},
        u'пачек': {u'пачка', u'пачек', u'пачки'},
        u'метр': {u'метр', u'метра', u'метров'},
        u'лот': {u'лот', u'лоты', u'лотов'},
        u'услуга': {u'услуга', u'услуг', u'услуги'},
        u'метр .куб.': {u'метр кубический', u'метра кубического', u'метров кубических'},
        u'ящик': {u'ящик', u'ящика', u'ящиков'},
        u'рейс': {u'рейс', u'рейса', u'рейсов'},
        u'тонны': {u'тонна', u'тонны', u'тонн'},
        u'метр квадратный': {u'метр квадратный', u'метра квадратного', u'метров квадратных'},
        u'километры': {u'километр', u'километров', u'километра'},
        u'штуки': {u'штука', u'штуки', u'штук'},
        u'месяц': {u'месяц', u'месяца', u'месяцев'},
        u'пачка': {u'пачка', u'пачек', u'пачкики'},
        u'упаковка': {u'упаковка', u'упаковок', u'упаковки'},
        u'гектар': {u'гектар', u'гектара', u'гектаров'},
        u'блок': {u'блок', u'блока', u'блоков'}
    }

    expected_name = None
    dictionary.get(current_name)
    for name, variants in dictionary.iteritems():
        if current_name in variants:
            expected_name = name

    if expected_name:
        return expected_name
    else:
        return current_name


def get_classification_type(classifications):
    classifications_dictionary = {
        u'ДК 016:2010': u'ДКПП',
        u'ДК 021:2015': u'CPV',
        u'ДК 18-2000': u'ДК018',
        u'ДК003: 2010': u'ДК003',
        u'ДК003:2010': u'ДК003',
        u'ДК 015-97': u'ДК015',
        u'ДК021': u'CPV'

    }
    classifications_type = classifications_dictionary.get(classifications)
    if classifications_type:
        return classifications_type
    else:
        return classifications


def get_status_type(status_name):
    status_name = status_name.strip()
    type_dictionary = {
        u'Период уточнений': 'active.enquiries',
        u'Період уточнень': 'active.enquiries',
        u'Период уточнений завершен': 'active.enquiries.ended',
        u'Період уточнень завершено': 'active.enquiries.ended',
        u'Подача предложений': 'active.tendering',
        u'Подача пропозицій': 'active.tendering',
        u'Торги': 'active.auction',
        u'Квалификация победителя': 'active.qualification',
        u'Квалификація переможця': 'active.qualification',
        u'Предложения рассмотрены': 'active.awarded',
        u'Пропозиції розглянуті': 'active.awarded',
        u'Закупка не состоялась': 'unsuccessful',
        u'Закупівля не відбулась': 'unsuccessful',
        u'Завершено': 'complete',
        u'Отменено': 'cancelled',
        u'Відмінено': 'cancelled',
        u'Розглядається': 'pending',
        u'Кваліфікація учасника': 'active.pre-qualification',
        u'Пауза перед аукціоном': 'active.pre-qualification.stand-still',
        u'Прекваліфікація': 'active.pre-qualification',
        u'Преквалификация': 'active.pre-qualification'
    }
    type_name = type_dictionary.get(status_name)
    return type_name


def convert_float_to_string(number):
    result = number
    if type(number) is float:
        return format(number, '.2f')
    else:
        return result


def get_claim_status (status):
    type_dictionary = {
        u'Вiдправлено': 'claim',
        u'Отримано вiдповiдь': 'answered',
        u'Задоволено': 'resolved',
        u'Скасовано': 'cancelled',
        u'Не вирiшена, обробляється': 'pending',
        u'Залишена без відповіді': 'ignored',
        u'Не задоволено': 'declined',
        u'Вимога відхилена': 'invalid',
        u'Запит для пiдтверждения скасування': 'stopping'
    }
    type_name = type_dictionary.get(status)
    return type_name


def get_procurementMethod_Type (type):
    type_dictionary = {
        u'Конкурентний діалог з публікацією англійською мовою 1-ий етап': 'competitiveDialogueEU',
        u'Конкурентний діалог 1-ий етап': 'competitiveDialogueUA',
        u'Переговорна процедура для потреб оборони': 'aboveThresholdUA.defense',
        u'Укладання рамкової угоди': 'closeFrameworkAgreementUA',
        u'Допорогові закупівлі': 'belowThreshold',
        u'Переговорна процедура': 'negotiation',
        u'Звіт про укладений договір': 'reporting',
        u'Відкриті торги': 'aboveThresholdUA',
        u'Відкриті торги з публікацією англійською мовою': 'aboveThresholdEU',
        u'Відкриті торги для закупівлі енергосервісу': 'esco'
    }
    type_name = type_dictionary.get(type)
    return type_name


def sum_of_numbers(number, value):
    number = int(number) + int(value)
    return number


def abs_number(number):
    return abs(int(number))


def get_abs_item_index(lot_index, item_index, items_count):
    abs_index = ((int(lot_index)-1) * int(items_count)) + int(item_index)
    return abs_index


def get_match_from_string(string, pattern, group):
    result = 'null';
    p = re.compile(pattern)
    m = p.search(string)

    if p.search(string):
        return m.group(int(group))
    return result


def get_percent(value):
    value = value * 100
    return format(value, '.0f')


def get_conversion_to_int(value):
    return int(float(value))


def get_cause(cause_text):
    cause_dictionary = {
        u'Закупівля творів мистецтва або закупівля, пов’язана із захистом прав інтелектуальної власності, або укладення договору про закупівлю з переможцем архітектурного чи мистецького конкурсу': u'artContestIP',
        u'Відсутність конкуренції (у тому числі з технічних причин) на відповідному ринку, внаслідок чого договір про закупівлю може бути укладено лише з одним постачальником, завідсутності при цьому альтернативи': u'noCompetition',
        u'Нагальна потреба у здійсненні закупівлі у зв’язку з виникненням особливих економічних чи соціальних обставин, яка унеможливлює дотримання замовниками строків для проведення тендеру, а саме пов’язаних з негайною ліквідацією наслідків надзвичайних ситуацій, а також наданням у встановленому порядку Україною гуманітарної допомоги іншим державам. Застосування переговорної процедури закупівлі в таких випадках здійснюється за рішенням замовника щодо кожної процедури': u'quick',
        u'Якщо замовником було двічі відмінено тендер через відсутність достатньої кількостіучасників,прицьому предмет закупівлі, його технічні та якісніхарактеристики, атакож вимогидо учасника не повинні відрізнятисявід вимог, що були визначені замовникому тедерній документації': u'twiceUnsuccessful',
        u'Потреба здійснити додаткову закупівлю в того самого постачальника з метою уніфікації, стандартизації або забезпечення сумісності з наявними товарами, технологіями, роботами чи послугами, якщо заміна попереднього постачальника (виконавця робіт, надавача послуг) може призвести до несумісності або виникнення проблем технічного характеру,пов’язаних з експлуатацією та обслуговуванням': u'additionalPurchase',
        u'Необхідність проведення додаткових будівельних робіт, не зазначених у початковому проекті, але які стали через непередбачувані обставини необхідними для виконання проекту за сукупності таких умов: договір буде укладено з попереднім виконавцем цих робіт, такі роботи технічно чи економічно пов’язані з головним (первинним) договором; загальна вартість додаткових робіт не перевищує 50 відсотків вартості головного (первинного) договору': u'additionalConstruction',
        u'Закупівля юридичних послуг, пов’язаних із захистом прав та інтересів України, у тому числі з метою захисту національної безпеки і оборони, під час врегулювання спорів, розгляду в закордонних юрисдикційних органах справ за участю іноземного суб’єкта та України, на підставі рішення Кабінету Міністрів України або введених в дію відповідно до закону рішень Ради національної безпеки і оборони України': u'stateLegalServices'
    }
    cause_type = cause_dictionary.get(cause_text)
    if cause_type:
        return cause_type
    else:
        return cause_text


def get_items_from_lot(items, lot_id):
    lot_items = []
    for item in items:
        if item['relatedLot'] == lot_id:
            lot_items.append(item)
    return lot_items


def get_ECP_key(path):
    return os.path.join(os.getcwd(), path)


def get_date_formatting(date, format_day):
    return dateutil.parser.parse(date).date().strftime(format_day)


def get_scenarios_name():
    name = ''
    for param in sys.argv:
        if 'txt' in param:
            name = param
    return name


def is_click_button(item_index, items_count, lot_index):
    status = 'false'
    if int(item_index) < int(items_count) and lot_index > 1:
        return 'true'
    return status


def get_milestones_title(title):
    titles = {
        u'підписання договору': 'signingTheContract',
        u'поставка товару': 'deliveryOfGoods',
        u'дата подання заявки': 'submissionDateOfApplications',
        u'дата закінчення звітного періоду': 'endDateOfTheReportingPeriod',
        u'дата виставлення рахунку': 'dateOfInvoicing',
        u'виконання робіт': 'executionOfWorks',
        u'надання послуг': 'submittingServices',
        u'інша подія': 'anotherEvent'
    }
    title_name = titles.get(title)
    return title_name


def get_milestones_code(code):
    codes = {
        u'Аванс': 'prepayment',
        u'Пiсляоплата': 'postpayment'
    }
    code_name = codes.get(code)
    return code_name


def get_milestones_duration_type(type):
    types = {
        u'робочих': 'working',
        u'банківськіх': 'banking',
        u'календарних': 'calendar'
    }
    type_name = types.get(type)
    return type_name


def get_rationaleType (type):
    type_dictionary = {
        u'Зменшення обсягів закупівлі': 'volumeCuts',
        u'Зміна сторонніхпоказників (курсу, тарифів...)': 'thirdParty',
        u'Зміна ціни у зв’язку із зміною ставок податків і зборів': 'taxRate',
        u'Покращення якості предмета закупівлі': 'qualityImprovement',
        u'Узгоджене зменшення ціни': 'priceReduction',
        u'Зміна ціни за одиницю товару': 'itemPriceVariation',
        u'Продовження строку дії договоруна наступний рік': 'fiscalYearExtension',
        u'Продовження строку дії договору (черездокументально підтверджені об’єктивні обставини)': 'durationExtension',

    }
    type_name = type_dictionary.get(type)
    return type_name


def get_mainProcurementCategory (type):
    type_dictionary = {
        'goods': u'Товар',
        'works': u'Роботи',
        'services': u'Послуга'
    }
    type_name = type_dictionary.get(type)
    return type_name


def get_budgetBreakdown (type):
    type_dictionary = {
        'crimea': u'Бюджет Автономної Республіки Крим',
        'fund': u'Бюджет цільових фондів',
        'loan': u'Кредити та позики міжнародних валютно-кредитних організацій',
        'local': u'Місцевий бюджет',
        'other': u'Інше',
        'own': u'Власний бюджет (кошти від господарської діяльності підприємства)',
        'state': u'Державний бюджет України'
    }
    type_name = type_dictionary.get(type)
    return type_name


def change_fake_date():
    return (datetime.datetime.now(timezone('Europe/Kiev')) + timedelta(days=3)).strftime('%Y-%m-%dT%H:%M:%S.%f%z')
