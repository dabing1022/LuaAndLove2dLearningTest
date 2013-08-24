local lives = 3
local score = 10
local health = 100
print("You have " .. lives .. " lives left")

local function writeToFileSingle(value, filename)
    local hfile = io.open(filename, "w")
    -- 打开可能会失败
    if hfile == nil then
        return
    end
    hfile:write(value)
    hfile:close()
end

writeToFileSingle(3, "file3.data")
writeToFileSingle(score, "score")
writeToFileSingle(health, "health")


local function readFromFileSingle(filename)
    local hfile = io.open(filename, "r")
    if hfile==nil then return end
    local value = hfile:read("*a")
    hfile:close()
    return value
end

print(readFromFileSingle("score"))

print("----------------")
local results = {}
local hfile = io.open("file2.txt")
if hfile==nil then return end
for line in hfile:lines() do
    table.insert(results, line)
end
for k,v in pairs(results) do
    print(k, v)
end
