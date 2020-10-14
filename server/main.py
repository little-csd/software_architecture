from flask import Flask
from flask import request
import proto.login_pb2 as Register
from src.mongo import Mongo
from google.protobuf import json_format
import json

mongo = Mongo()
app = Flask('ticket')

@app.route('/login', methods=['POST'])
def login():
    data = json.loads(request.data)
    print(data)
    rsp = Register.LoginRsp()
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

@app.route('/train')
def train():
    data = json.loads(request.data)
    print(data)

    return ''

@app.route('/')
def hello():
    return 'hello world!'


"""
/login 为登录注册相关
"""