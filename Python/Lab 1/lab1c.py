def for_loop(n):
    for i in range(1, 11):
        print(f"{n} x {i} = {n*i}")

def while_loop(n):
    i = 1
    while i <= 10:
        print(f"{n} x {i} = {n*i}")
        i += 1

def do_while(n):
    i = 1
    while True:
        print(f"{n} x {i} = {n*i}")
        i += 1
        if i > 10:
            break

n = int(input("Enter a number: "))
print("\nFor loop:")
for_loop(n)

print("\nWhile loop:")
while_loop(n)

print("\nDo-while simulation:")
do_while(n)
