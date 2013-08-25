function GetLines(filename)
    indx = 0
    myLines = {}
    for line in io.lines(filename) do
        indx = indx + 1
        myLines[indx] = line
    end
    return indx, myLines
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
for indx = 2, numLines do
    count, charHold = GetValues(allLines[indx])
    myCharacters[indx-1] = {}
    for indx2 = 1, count do
        myCharacters[indx-1][indx2] = charHold[indx2]
    end
end

print(#myLabels)
--for indx = 1, 3 do
--    for indx2 = 1, #myLabels do
--        print(myLabels[indx2], myCharacters[indx][indx2])
--    end
--end
