local tableA = {name="childhood", 5, 10, 15, sex="male", someKey = function() return "test" end}
print(#tableA)
table.insert(tableA, 2, 3)

print(tableA[1])        -- 5
print(tableA[2])        -- 3
print(tableA[3])        -- 10
print(tableA[4])        -- 15
print(tableA[100])      -- nil


local b = {}

table.insert(b,3)


local c = {}
c[5] = 6
print(c[5])