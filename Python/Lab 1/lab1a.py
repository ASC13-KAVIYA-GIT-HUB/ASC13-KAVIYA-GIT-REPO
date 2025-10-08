def add(*args):
    
    if any(isinstance(arg, str) for arg in args):
        return ' '.join(str(arg) for arg in args)
    
    elif all(isinstance(arg, (int, float)) for arg in args):
        return sum(args)
    else:
        print("Unsupported argument types")


print(add(10, 20))      
print(add(10, 20, 30))     
print(add(10.5, 20.1))    
print(add("Hello", 20))
