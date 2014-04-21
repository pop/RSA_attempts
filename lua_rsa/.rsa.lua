t = {}
-- io.write("Please enter a max random number value: ")
max = (os.time() % arg[1])
file = arg[2]

print("Generating primes between ", 2, " and ", max)
for i = 2, max, 1 do
    check = true
    for j = 2, i-1, 1 do
        if i % j ~= 0 then
            check = true
        else
            check = false
            break
        end
    end
    if check == true then
        table.insert(t, i)
    end
    i = i+1
end

ts = {}
max = 30
print("Generating primes between ", 2, " and ", max)
for i = 2, max, 1 do
    check = true
    for j = 2, i-1, 1 do
        if i % j ~= 0 then
            check = true
        else
            check = false
            break
        end
    end
    if check == true then
        table.insert(ts, i)
    end
    i = i+1
end

rand_one_pos = math.random(#t)
rand_two_pos = math.random(#t)
rand_three_pos = math.random(#ts)
while true do
    if rand_one_pos == rand_two_pos then
        rand_two_pos = math.random(#t)
    else
        break
    end
end

while true do 
    if rand_one_pos == rand_three_pos or rand_two_pos == rand_three_pos then
        rand_three_pos = math.randomseed(#ts)
    else
        break
    end
end

-- dir = io.open(file)
-- file = dir.read(dir, '*all')

p = t[rand_one_pos]
q = t[rand_two_pos]
n = p*q
totient = (p-1)*(q-1)
e = ts[rand_three_pos] 

i = 2
while true do
    if e*i % totient == 1 % totient then
        d = i
        break
    end
    i = i+1
end

print("p: ", p)
print("q: ", q)
print("n: ", n)
print("totient: ", totient)
print("e(public key): ", e)
print("d(private key): ", d)
print("file says: ")
print(file)
--print("Length of file: ", #file)
--------------------------------------------------------------- above this line works
encrypted = math.pow(5,e)
print("five in the equation", encrypted)
encrypted = encrypted%n
print("five in the equation", encrypted)
-- dir = io.open(file)
-- file = dir.read(dir, '*all')

-- f = {}
-- h = {}
-- for i = 0, #file, 1 do
--     f[i] = string.sub(file, i, i)
-- end

-- for i = 0, #file, 1 do
--     if string.byte(f[i]) ~= nil then
--         h[i] = ((string.byte(f[i]))^e)%n
--         print("h[i]",string.char(h[i]),"f[i]",f[i])
--         h[i] = ((h[i])^d)%n
--         print("h[i]",string.char(h[i]),"f[i]",f[i])
--     end
-- end

