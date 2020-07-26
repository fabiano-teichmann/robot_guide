import os
from exception import NotFound
from pymongo import MongoClient


def db_connect(func):
    
    def core(*args):
        client = connect()
        print(*args)
        query = func(client, *args)
        client.close()

        if not query:
            raise NotFound(*args)

        return query

    def connect():
        print('Connect db')
        host = os.environ.get('MONGODB_URI')
        client = MongoClient(host)
        return client

    return core
