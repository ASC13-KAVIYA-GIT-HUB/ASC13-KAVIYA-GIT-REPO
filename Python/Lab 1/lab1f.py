class ArrayStore:
    def __init__(self):
        self.arr = []

    def accept(self, nums):
        self.arr = nums[:10]

    def display_for(self):
        for n in self.arr:
            print(n, end=' ')
        print()

    def display_while(self):
        i = 0
        while i < len(self.arr):
            print(self.arr[i], end=' ')
            i += 1
        print()

    def sort(self):
        self.arr.sort()

    def count(self, num):
        return self.arr.count(num)

    def insert(self, num, pos):
        if 0 <= pos <= len(self.arr):
            self.arr.insert(pos, num)

    def unique(self):
        return list(dict.fromkeys(self.arr))

store = ArrayStore()
store.accept([9, 2, 2, 9, 10, 9])
store.display_for()
store.display_while()
store.sort()
store.display_for()
print(store.count(9))
store.insert(5, 2)
store.display_for()
print(store.unique())
