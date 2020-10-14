from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options

import requests

# res = requests.get(r'https://kyfw.12306.cn/otn/leftTicket/queryTicketPrice?train_no=240000G1010P&from_station_no=01&to_station_no=11&seat_types=OM9&train_date=2020-10-22')
# print(res.text)

opt = Options()
opt.add_argument('--headless')
opt.add_argument('--disable-gpu')
opt.add_argument('blink-settings=imagesEnabled=false')
driver = Chrome(chrome_options=opt)

cookies = [{'domain': 'www.baidu.com', 'httpOnly': False, 'name': 'H_PS_PSSID', 'path': '/', 'secure': False, 'value': '32820_32617_1421_31253_32706_32230_7517_32270_7605_32117_32719'}, {'domain': 'www.baidu.com', 'expiry': 1633884806, 'httpOnly': False, 'name': 'BAIDUID', 'path': '/', 'secure': False, 'value': 'ACAEC8EB3A9041FF513D81A0BD0593E5:FG=1'}, {'domain': 'www.baidu.com', 'expiry': 3749832453, 'httpOnly': False, 'name': 'BIDUPSID', 'path': '/', 'secure': False, 'value': 'ACAEC8EB3A9041FFD376826491D5E63F'}, {'domain': 'www.baidu.com', 'expiry': 3749832453, 'httpOnly': False, 'name': 'PSTM', 'path': '/', 'secure': False, 'value': '1602348806'}, {'domain': 'www.baidu.com', 'expiry': 1603212807, 'httpOnly': False, 'name': 'BD_UPN', 'path': '/', 'secure': False, 'value': '123353'}, {'domain': 'www.baidu.com', 'httpOnly': False, 'name': 'BD_HOME', 'path': '/', 'secure': False, 'value': '1'}]

# for cookie in cookies:
#     print(cookie)
#     driver.add_cookie(cookie)

driver.get(r'https://www.baidu.com/')
tt = driver.page_source
cookie = driver.get_cookies()
print(cookie)

driver.close()

with open('baidu.html', 'w') as f:
    f.write(tt)
