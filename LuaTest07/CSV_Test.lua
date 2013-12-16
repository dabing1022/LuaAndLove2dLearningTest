function GetLines(filename)
    index = 0
    myLines = {}
    for line in io.lines(filename) do
        index = index + 1
        myLines[index] = line
        print(index)
    end
    return index, myLines
end

function GetValues(myString)
    num = 0
    values = {}
    if myString ~= nil then
        while string.find(myString, ",") ~= nil do
            local i, j = string.find(myString, ",")
            num = num + 1
            values[num] = string.sub(myString, 1, j - 1)
            print("=========" .. values[num])
            myString = string.sub(myString, j + 1, string.len(myString))
            print(num .. "==" .. myString .. "\n")
        end
        num = num + 1
        values[num] = myString
    end
    return num, values
end

function ParseCSVLine (line,sep) 
    local res = {}
    local pos = 1
    sep = sep or ','
    while true do 
        local c = string.sub(line,pos,pos)
        if (c == "") then break end
        if (c == '"') then
            -- quoted value (ignore separator within)
            local txt = ""
            repeat
                local startp,endp = string.find(line,'^%b""',pos)
                txt = txt..string.sub(line,startp+1,endp-1)
                pos = endp + 1
                c = string.sub(line,pos,pos) 
                if (c == '"') then txt = txt..'"' end 
                -- check first char AFTER quoted string, if it is another
                -- quoted string without separator, then append it
                -- this is the way to "escape" the quote char in a quote. example:
                --   value1,"blub""blip""boing",value3  will result in blub"blip"boing  for the middle
            until (c ~= '"')
            table.insert(res,txt)
            assert(c == sep or c == "")
            pos = pos + 1
        else    
            -- no quotes used, just look for the first separator
            local startp,endp = string.find(line,sep,pos)
            if (startp) then 
                table.insert(res,string.sub(line,pos,startp-1))
                pos = endp + 1
            else
                -- no separator found -> use rest of string and terminate
                table.insert(res,string.sub(line,pos))
                break
            end 
        end
    end
    return res
end



myCharacters = {}
numLines, allLines = GetLines("CSV_Test.csv")
print(numLines, #allLines)
print(allLines[1])
count, myLabels = GetValues(allLines[1])
print(count)
print(#myLabels)

local t = ParseCSVLine(allLines[1], ",")
for k,v in pairs(t) do
    print(v)
end

--[
for i = 1, #myLabels do
    print(i .. "======" .. myLabels[i])
end
--]]
