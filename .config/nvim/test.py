#!/usr/bin/env python3

def print_line(num):
    for x in range(num):
        print(x)

def main(num):
    for x in num:
        print_line(x)

if __name__ == "__main__":
    main(10)
    
