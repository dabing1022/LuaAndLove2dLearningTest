function readFromFile(filename)
    local results = {}
    local hfile = io.open(filename)
    if hfile== nil then return end
    local lineNo = 0
    for line in hfile:lines() do
        table.insert(results, line)
        lineNo = lineNo + 1
        if lineNo == 1 then
            _G["score"] = line
        elseif lineNo == 2 then 
            _G["lives"] = line
        elseif lineNo == 3 then
            _G["health"] = line
        elseif lineNo == 4 then
            _G["level"] = line
        end
    end
    return results
end


for k,v in pairs(readFromFile("file4.txt")) do
    print(k, v)
end
