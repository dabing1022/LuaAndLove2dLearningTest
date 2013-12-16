function table.unique(t)
    local r = {}
    local n = {}
    for i = #t, 1, -1 do
        local v = t[i]
        if not r[v] then
            r[v] = true
            n[#n + 1] = v
        end
    end
    return n
end


test = {2, 2, 3, 3, 5, 5}
a = table.unique(test)
for i , v in ipairs(a) do
    print(v)
end

function table.unique2(t)
    local r = {}
    local n = {}
    for k, v in pairs(t) do
        
    end
end