import json
import requests

from connect import connect


@connect
def get_message_queue(queue: str, count: int = 1, ackmode: str = 'ack_requeue_true', requeue: bool = False, **kwargs):
    """

    :param queue: str name queue  if queue name contain / %2  use CUSTOMER_ANALYSIS_NEEDED%2FCUSTOMER_ANALYSIS'
    :param count:  int total message
    :param ackmode: default ack_requeue_false for message removed queue  if not remove use ack_requeue_true
    :param requeue:
    :param kwargs: dict if not pass de parameters use values default
    :return: dict
    """
    path = f'/queues/%2f/{queue}/get'
    body = {"count": count, "requeue": requeue, "encoding": "auto", "ackmode": ackmode}
    url = kwargs['url'] + path
    headers = {'Content-Type': 'application/json'}
    response = requests.post(url=url, auth=kwargs['auth'],
                         headers=headers,
                         data=json.dumps(body),
                         timeout=kwargs['timeout'])
    try:
        payload = [x.get('payload') for x in response.json()]
    except:
        return response.json().get('error')
    return payload
