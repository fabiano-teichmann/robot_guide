import os


def connect(func):
    def auth(**kwargs):
        user = kwargs['user'] if kwargs.get('user') else os.environ.get('RBMQ_USER')
        password = kwargs['pass'] if kwargs.get('pass') else os.environ.get('RBMQ_PASS')
        host = kwargs['host'] if kwargs.get('host') else os.environ.get('RBMQ_HOST')
        port = 15672
        timeout = kwargs['timeout'] if kwargs.get('timeout ') else 30
        url = f'http://{host}:{port}/api'
        kwargs.update({'url': url, 'auth': (user, password), 'timeout': timeout})
        return func(**kwargs)
    return auth
