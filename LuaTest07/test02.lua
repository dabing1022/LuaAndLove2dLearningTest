-- load data from a .csv file
local function loadFile(path)
        local nums = 0
        local lines = {}
        for line in io.lines(path) do
                nums = nums + 1
                lines[nums] = line
        end

        return nums, lines
end

-- make line string to table
local function makeLine(line_text)
        local nums = 0
        local values = {}
        if line_text ~= nil then
                while string.find(line_text, ",") ~= nil do
                        nums = nums + 1
                        i, j = string.find(line_text, ",")
                        values[nums] = string.sub(line_text, 1, j-1)
                        line_text = string.sub(line_text, j+1, string.len(line_text))
                end
                nums = nums + 1
                values[nums] = line_text
        end

        return nums, values
end

function loadcsv(path)
        if path == nil then return nil, nil, nil end

        local data = {}
        nums, lines = loadFile(path)
        print("nums", nums)

        labelNum, labels = makeLine(lines[1])
        print("labelNum" .. labelNum)
        print(labels)
        print("start")
        for i=2, nums do
                print("load csv.......")
                tmpNum, data[i-1] = makeLine(lines[i])
        end
        print("end")
        return nums-1, data, labels
end

local a, b, c = loadcsv("sorteData.csv")
print(a)
print(b)
print(c)

local m, n = loadFile("sorteData.csv")
print(m)
print(n)

for k,v in pairs(n) do
        print(k)
        print("$$$$$$$$$$$$$")
        print(v)
end

-- for k,v in pairs(b) do
--         print(k)
--         print("------")
--         print(v)
-- end
print("*******************************")
for k,v in pairs(c) do
        print(k)
        print("=====")
        print(v)
end