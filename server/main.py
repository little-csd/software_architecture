from flask import Flask
from flask import request
from db.mongo import Mongo
from worm.worm import Spider

from google.protobuf import json_format
import json

from proto.login_pb2 import LoginRsp
from proto.train_pb2 import *

mongo = Mongo()
app = Flask('ticket')
spider = Spider()

@app.route('/login', methods=['POST'])
def login():
    data = json.loads(request.data)
    print(data)
    rsp = LoginRsp()
    if verify_user(data):
        rsp.ok = True
    else:
        rsp.ok = False
        rsp.errno = 'Register failed'
    return rsp.SerializeToString()

def verify_user(data):
    res = mongo.find_user({'id': data['id']})
    print('verify user id = {} \n\tmessage = {}'.format(data['id'], res))
    if None == res:
        mongo.insert_user(data)
        return True
    else:
        if data['pwd'] == res['pwd']:
            return True
        else:
            return False

@app.route('/train', methods=['POST'])
def train():
    print('train request detected')
    data = json.loads(request.data)
    print('train request come in: {}'.format(data))
    msgs = spider.pull(data['id'], data['fs'], data['ts'], data['day'])
    print('train requst find {} terms'.format(len(msgs)))
    rsp = TrainRsp()
    for msg in msgs:
        ticket = rsp.tickets.add()
        ticket.kid = msg[0]
        ticket.fStation = msg[1]
        ticket.tStation = msg[2]
        ticket.fTime = msg[3]
        ticket.tTime = msg[4]
        ticket.duration = msg[5]
        ticket.tid = msg[6]
    return rsp.SerializeToString()

@app.route('/price', methods=['POST'])
def price():
    print('price request detected')
    data = json.loads(request.data)
    print('price request come in: {}'.format(data))
    prices = spider.get_price(data['id'], data['tid'])
    print('generate prices = {}'.format(prices))
    if len(prices) == 1 and prices[0] == '':
        return PriceRsp().SerializeToString()
    rsp = PriceRsp()
    for s in prices:
        rsp.prices.append(s)
    return rsp.SerializeToString()


@app.route('/')
def hello():
    return 'hello world!'


"""
/login 为登录注册相关
/train 为车次查询
/price 为价格查询
"""
