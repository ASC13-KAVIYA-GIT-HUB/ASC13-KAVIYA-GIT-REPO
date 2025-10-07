def DigitInWords(number):
    words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    print(f"Digits in words for {number}:")
    for digit in str(number):
        print(words[int(digit)])

DigitInWords(12045)