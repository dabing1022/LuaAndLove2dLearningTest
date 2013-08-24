-- Lua Libraries

money = 5
print("--------assert---------")
assert(money > 0, "You need money!")

print("--------garbagecollector--------")
print(collectgarbage("count"))


print("--------ipairs--------")
t = {1, 2, 3, 4, test = "test", 5, 6}
t[3] = nil
for i,v in ipairs(t) do
    print(i, v)
end

a = {"One", "Two", "Three", "Four"}
print(next(a, 3))

t = {one = "Childhood", two = "dabing", three = "Andy"}
for k,v in pairs(t) do
    print(k, v)
end


print("----------math------------------")
print(math.randomseed(os.time()))

for n=1, 50 do
    print(math.random(5, 25))
end
print(math.random())
print(math.random(10))
print(math.random(5, 25))


print("---set randomseed 5-----")
math.randomseed(5)
for n=1, 10 do
    print(math.random())
end


print("---set randomseed 5-----")
math.randomseed(6)
for n=1, 10 do
    print(math.random())
end


print("---set randomseed 5 again-----")
math.randomseed(5)
for n=1, 10 do
    print(math.random())
end


print("---set randomseed 100-----")
math.randomseed(100)
print(math.random(1000))


print("---set randomseed 102-----")
math.randomseed(102)
print(math.random(1000))

print("--------os.time---------")
print(os.time())
for n=1, 20 do
    print(os.time())
end
print(tostring(os.time()):reverse():sub(1,6))
