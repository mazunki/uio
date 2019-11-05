class MyList(list):
    def __init__(self, *args, **kwargs):
        super().__init__([*args])

poop = MyList(1,2,3)

print(poop)
