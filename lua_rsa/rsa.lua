-------------------------------
-- FileName: rsa.lua
-- Author: Elijah Voigt
-- Description: A crude implementation of RSA written in Lua; for educational purposes only.
-- Date: 04.20.2014
-------------------------------
-- Preamble:
--  > This isn't done by any means. In fact it's probably never going to be done.
--  I studied the RSA algorithm and implemented it to the best of my ability,
--  but I appear to hitting way past the largest numbers Lua can handle, so
--  until I learn how to implement a "large numbers" library (something I don't
--  currently have the energy nor the patients to deal with), this project is dead.
--  > If you're interested in how most of the basic RSA algorithm would be implemented
--  (the manipulation of values to generate the encrypted/decrypted outputs, etc)
--  feel free to look through the code, however it is not currently functioning.
--
--  Thank you,
--  Elijah


-- Getting input from user
io.write("What is your message ")
local msg = io.read()

-- Hard-coding in small numbers
-- These would be esay to generate or get from the user
local p = 3 
local q = 17 
local n = p*q
local t = (p-1)*(q-1)
local e = 7

-- This block gets a valid 'd' value, 
-- used in the decryption algorithm
i = 2
while true do
    if e*i % t == 1 % t then
        d = i
        break
    end
    i = i+1
end

print("d = "..d)

-- This block converts the user's string input into a table of characters,
-- which are much easier to manipulate (ascii values are ver managable)
function convert_input(msg)
    local table ={0}
    for i = 1, string.len(msg), 1 do
        table[i] = tonumber(string.byte(msg, i))
    end
    return table
end

t = convert_input(msg)

-- This function in theory encrypts the message
function encrypt(t, e, n)
    for i = 1, #t, 1 do 
        t[i] = (t[i]^e)%n
    end
    return t 
end

-- This function in theory decrypts the message
function decrypt(c, d, n)
    local m = {0}
    for i = 1, #c, 1 do
        m[i] = (c[i]^d)%n
        print(c[i], c[i]^d, (c[i]^d)%n)
    end
    return m;
end

-- This prints a table with a space between each entry.
-- It would print the encrypted and decrypted message
function print_output(arr)
    for i = 1, #arr, 1 do
        io.write((arr[i]).." ")
    end
end

-- C is a variable created and encrypted.
c = encrypt(t, e, n)
io.write("encrypted message = ")
print_output(c)

-- 'M' is the decrypted message 'C'
m = decrypt(c, d, n)
io.write("decrypted encrypted message = ")
print_output(m)
