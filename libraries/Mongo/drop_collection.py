from db_connect import db_connect

@db_connect
def drop_collection(client, collection):

    try:
        db = client['test']
        db.drop_collection(collection)
    except Exception as e:
        raise e
    return True


