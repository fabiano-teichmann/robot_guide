class NotFound(Exception):
    def __init__(self, *args):
        super().__init__(f"Not found query - {args}")


