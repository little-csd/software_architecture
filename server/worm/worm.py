import requests
import re
from time import sleep
from selenium.webdriver import Chrome
from selenium.webdriver.chrome.options import Options

station_name = 'worm/station.txt'
index_url = 'https://www.12306.cn/index/'
js_new_window = 'window.open()'
query_url = 'https://kyfw.12306.cn/otn/leftTicket/init?linktypeid=dc&fs={}&ts={}&date={}&flag=N,N,Y'

# 'G415\n北京南\n上海\n06:19\n12:23\n06:04\n当日到达\n候补\n5\n有 -- -- -- -- -- -- -- -- 预订'

def get_station():
    url = 'https://kyfw.12306.cn/otn/resources/js/framework/station_name.js?station_version=1.9142'
    response = requests.get(url).text
    name = re.findall(r'.*?\|(.*?)\|.*?\|.*?\|.*?\|.*?',response)
    referred = re.findall(r'.*?\|.*?\|(.*?)\|.*?\|.*?\|.*?',response)
    station = dict(zip(name,referred))
    file = open('station.txt','w',encoding='utf-8')
    file.write(str(station))
    file.close()
    return station

def read_station(uri):
    s = ''
    with open(uri, 'r') as f:
        s = f.read()
    return eval(s)

def create_opt():
    opt = Options()
    # opt.add_argument('--headless')
    # opt.add_argument('--disable-gpu')
    # opt.add_argument('blink-settings=imagesEnabled=false')
    return opt

class Spider:

    def make_url(self, fs, ts, date):
        fs = '{},{}'.format(fs,self.smap[fs])
        ts = '{},{}'.format(ts,self.smap[ts])
        return query_url.format(fs,ts,date)

    def make_handle(self, key):
        driver = self.driver
        driver.execute_script(js_new_window)
        h = driver.window_handles[-1]
        # print(driver.window_handles)
        self.hmap[key] = h
        driver.switch_to_window(h)
    
    def make_web_element(self, key, fs, ts, date):
        driver = self.driver
        self.qmap[key] = (fs,ts,date)
        url = self.make_url(fs, ts, date)
        driver.get(url)
        sleep(0.5) # 等待页面渲染完成
        l = driver.find_element_by_id('queryLeftTable')
        ll = l.find_elements_by_xpath('tr')
        self.wmap[key] = ll
        if len(ll) == 0:
            with open('output.html') as f:
                f.write(driver.page_source)

    def get_train_msgs(self, key):
        w = self.wmap.get(key)
        if w == None:
            return []
        siz = len(w)
        res = []
        for i in range(0,siz,2):
            t = w[i].text.split('\n')[0:6]
            t.append(w[i].get_attribute('id'))
            res.append(t)
        return res

    def pull(self, key, fs, ts, date):
        h = self.hmap.get(key)
        if h == None:
            self.make_handle(key)
            self.make_web_element(key, fs, ts, date)
        else:
            self.driver.switch_to_window(h)
            q = self.qmap.get(key)
            if q[0] != fs or q[1] != ts or q[2] != date:
                self.make_web_element(key, fs, ts, date)
        return self.get_train_msgs(key)

    # ukey: 用户 id, tkey 票的 id
    def get_price(self, ukey, tkey):
        h = self.hmap.get(ukey)
        w = self.wmap.get(ukey)
        if h == None or w == None:
            return [-1,-1,-1]
        self.driver.switch_to_window(h)
        siz = len(w)
        for i in range(0,siz,2):
            if w[i].get_attribute('id') == tkey:
                break
        if w[i+1].is_displayed() == False:
            w[i].click()
            sleep(0.5)
        login_block = self.driver.find_element_by_class_name('modal-login')
        # close_icon = login_block.find_element_by_class_name('close')
        if login_block.is_displayed():
            print('login block detected...')
            self.driver.execute_script('$(\'.modal-login\').hide();$(\'.mask\').hide();')
            # sleep(0.5)
            # close_icon.click()
            # sleep(0.5)
            w[i].click()
            sleep(0.2)
        return w[i+1].text.split(' ')

    def __init__(self):
        self.hmap = {} # handle map，一个用户最多一个 handle
        self.wmap = {} # web element map, key 和上面相同, 都是 user 的 id
        self.qmap = {} # 每次查询的内容， key 和上面相同
        self.smap = read_station(station_name)
        self.driver = Chrome(chrome_options=create_opt())
        self.driver.maximize_window()
        self.driver.get(index_url)

from xpinyin import Pinyin
 
def sort_by_pinyin(lis):
    pin=Pinyin()
    result=[]
    for item in lis:
        result.append((pin.get_pinyin(item),item))
    result.sort()
    for i in range(len(result)):
        result[i]=result[i][1]
    return result

def postprocess_station():
    pin = Pinyin()
    s = ''
    with open('station.txt') as f:
        s = f.read()
    d = eval(s)
    m = {}
    for k in d.keys():
        item = pin.get_pinyin(k).upper()
        t = m.get(item[0])
        if t == None:
            m[item[0]] = [k]
        else:
            t.append(k)
    for k in m.keys():
        lis = sort_by_pinyin(m[k])
        m[k] = lis
    tmp = sorted(m.items(),key=lambda x:x[0])
    mm = {}
    for item in tmp:
        mm[item[0]] = item[1]
    with open('station_post.txt', 'w') as f:
        f.write(str(mm).replace('\'', '\"'))

# fromStationText
# toStationText
# form_cities

# 1. 填充 url
# 2. 进入页面
# 3. l = driver.find_element_by_id('queryLeftTable')
# 4. ll = l.find_elements_by_xpath('tr')
# 5. for k in ll: 过滤掉 text 为空的孩子
# 6. 剩下的孩子调用 text 然后正则分割
# 连续的两个 tr 一个是车次信息, 另一个则是价格信息
