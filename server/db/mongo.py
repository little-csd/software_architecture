import pymongo

class Mongo:

    def insert_user(self, data):
        print('insert data = ', end='')
        print(data)
        self.user.insert_one(data)
    
    def find_user(self, cond):
        return self.user.find_one(cond)

    def find_train(self, cond):
        return self.train.find(cond)

    def __init__(self):
        self.client = pymongo.MongoClient(host='localhost')
        self.db = self.client['test1']

        # user 表
        self.user = self.db.user
        self.user.remove()

        # 车次表
        self.train = self.db.train
        self.train.remove()