-- string test
print("-------------**string test**--------------")

function string:getFrequency()
    local inst={}
    function tally(char)
        char=string.upper(char)
        inst[char]=(inst[char] or 0)+1
    end
    self:gsub("%a", tally)
    return inst
end


testString = "Hello, how are you?"
tbl = testString:getFrequency()
for k,v in pairs(tbl) do
    print(k, v)
end

print("--------------------------------------")
local a = string.byte("one")
local b = string.byte("two")
local c = string.byte("three")
print(a, b, c)
print(string.byte("t"))
print(string.byte("w"))
print(string.byte("o"))
print(string.byte("h"))
print(string.byte("r"))
print(string.byte("e"))

local m = (string.byte("t") + string.byte("w") + string.byte("o")) / 3
print("m : ", m)
local n = (string.byte("t") + string.byte("h") + string.byte("r") + 2 * string.byte("e")) / 5
n = math.floor(n)
print("n : ", n)


print("--------------------------------------")
print(string.byte("three", 1, 5))
-- t ASCII 116
print("\116")
