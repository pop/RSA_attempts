
io.write("What is your message ")
local msg = io.read()

local p = 3 
local q = 17 
local n = p*q
local t = (p-1)*(q-1)
local e = 7

i = 2
while true do
    if e*i % t == 1 % t then
        d = i
        break
    end
    i = i+1
end

print("d = "..d)

function convert_input(msg)
    local table ={0}
    for i = 1, string.len(msg), 1 do
        table[i] = tonumber(string.byte(msg, i))
    end
    return table
end

t = convert_input(msg)

function encrypt(t, e, n)
    for i = 1, #t, 1 do 
        t[i] = (t[i]^e)%n
    end
    return t 
end

function decrypt(c, d, n)
    local m = {0}
    for i = 1, #c, 1 do
        m[i] = (c[i]^d)%n
        print(c[i], c[i]^d, (c[i]^d)%n)
    end
    return m;
end

function print_output(arr)
    for i = 1, #arr, 1 do
        io.write((arr[i]).." ")
    end
end

local c = encrypt(t, e, n)
io.write("encrypted message = ")
print_output(c)

m = decrypt(c, d, n)
io.write("decrypted encrypted message = ")
print_output(m)
