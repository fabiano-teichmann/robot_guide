import os
import time

from db_connect import db_connect


@db_connect
def get_one_document(client, collection, query):
    db = client['test']
    col = db[collection]
    return col.find_one(query)


@db_connect
def get_many_document(client, collection, query, limit=5):
    db = client['test']
    col = db[collection]
    return col.find(query).limit(limit)

