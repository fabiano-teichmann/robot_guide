import os

from db_connect import db_connect


@db_connect
def insert_one(client, collection, document):
    db = client['test']
    col = db[collection]
    return col.insert_one(document)