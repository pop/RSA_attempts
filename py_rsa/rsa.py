# FileName: rsa.py
# Author: Elijah Voigt
# Description: A crude implementation of RSA written in Python
#              Not intended for actual data incription.
#              Intended just for educational purposes.
# Date: April 27, 2014

# Math is used for power the power function
import math
# sys is used for getting command-line args
import sys

##print(len(sys.argv))

# The following variables are initialized to the values in the wiki example
# Their values are all overloaded through comand line args
# The variable that tells the program weather or not to encrypt and decrypt the message
# This is utilized when the user enters -h or -v
go = 1
# p and q are prime numbers used to generate n and t
p = 61
q = 53
n = p*q
t = (p-1)*(q-1)
# e is the public key
e = 17
# m is the message
m = "Give Elijah Voigt a job"
# d is the private key
d = 0
# Not gonna lie, the wiki said public and private keys are n%e and n%d respectively
# But I have no idea how to implement this, so I'm going to keep it as is
# Peraps v0.2 will have a legitimate rsa... maybe...
public = 0
private = 0

# I'm too lazy to type sys.argv a million times...
argv = sys.argv

# This block parses through the command line arguments
# It's not the easiest way to parse args, but it's the first way I knew how
for i in range(1, len(argv), 1):
    if(argv[i] == "-p"):
        p = int(argv[i+1])
        go += 1
    elif(argv[i] == "-q"):
        q = int(argv[i+1])
        go += 1
    elif(argv[i] == "-e"):
        e = int(argv[i+1])
        go += 1
        en = 1
    elif(argv[i] == "-m"):
        m = str(argv[i+1])
        go += 1
    elif(argv[i] == "-h" or argv[i] == "--help"):
        print("Help:")
        print("rsa.py -p [prime #X] -q [prime #Y] -e [prime #Z] -m 'Secret Message'")
        print("[It is suggested that p and q be much larger than e]")
        print("[The message (-m '---') must be in quotes]")
        print("rsa.py -h -> This help message -v -> Version")
        go = 0
    elif(argv[i] == "-v" or argv[i] == "--version"):
        print("Version:")
        print("RCPRSAI [Really Crude Python RSA Implementation] v0.1")
        print("Avaliable for free! Take it, break it, learn from it")
        print("For more info visit https://github.com/ElijahCaine")
        go = 0

# This block generates the private key
def get_d(d):
    if(d == 0):
        i = 2
        while True:
            # d is set to satisfy the congruence relation (d * e) == (1 % t)
            if e*i % t == 1 % t:
                d = i
                break
            i += 1
    return d

# This converts the string input into a list 
def convert_input(msg):
    l = [] 
    for i in range (0, len(msg), 1):
        l.extend(msg[i])
        l[i] = ord(l[i])
    return l

# This iterates through each element in the list and encrypts it
def encrypt_msg(t, e, n):
    tmp = []
    for i in range(0, len(t), 1):
        tmp.append((pow(t[i],e))%n)
    return tmp

# This decrypts the messge which is in list form
def decrypt_msg(c, d, n):
    tmp = []
    for i in range (0, len(c), 1):
        tmp.append(pow(c[i], d)%n)
##    print(m)
    return tmp

# This takes in a list and converts returns the string version
def convert_to_str(li):
    tmp = ""
    for i in range(0, len(li), 1):
        tmp += str(chr(li[i]))
    return tmp

# This is where the functions are called and the magic happens
if(go):
    if(go < 5):
        d = get_d(d)
        print("\nWARNING: Even less secure")
        print("Some (or all) custom values missing. Using defaults.")
        print("To enter custom values view the README or call the script with the -h argument")
        print("|p:", p, "|q:", q, "|n:", n, "|t:", t, "|e:", e, "|m:", m, "|d:", d, "|")

    d = get_d(d)
    # public = n%e
    # private = n%d
    print("\nPublic key: ", e)
    print("Priavte key: ", d)

    t = convert_input(m)
    ##print(t)
    c = encrypt_msg(t, e, n)
    k = convert_to_str(c)
    print("Encrypted Message:",k)
    ##print(c)
    ##print(t)
    m = decrypt_msg(c, d, n)
    ##print(m)
    k = convert_to_str(m)
    print("Decrypted Message:",k)
