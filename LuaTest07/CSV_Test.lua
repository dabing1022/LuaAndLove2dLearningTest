function GetLines(filename)
    index = 0
    myLines = {}
    for line in io.lines(filename) do
        index = index + 1
        myLines[index] = line
    end
    return index, myLines
end

function GetValues(myString)
    num = 0
    values = {}
    if myString ~= nil then
        while string.find(myString, ";") ~= nil do
            local i, j = string.find(myString, ";")
            num = num + 1
            values[num] = string.sub(myString, 1, j - 1)
            myString = string.sub(myString, j + 1, string.len(myString))
        end
        num = num + 1
        values[num] = myString
    end
    return num, values
end


myCharacters = {}
numLines, allLines = GetLines("CSV_Test.csv")
print(numLines, #allLines)
print(allLines[1])
count, myLabels = GetValues(allLines[1])
print(count)
print(#myLabels)
for index = 2, numLines do
    count, charHold = GetValues(allLines[index])
    myCharacters[index-1] = {}
    for index2 = 1, count do
        myCharacters[index-1][index2] = charHold[index2]
    end
end

print(#myLabels)
--for index = 1, 3 do
--    for index2 = 1, #myLabels do
--        print(myLabels[index2], myCharacters[index][index2])
--    end
--end
