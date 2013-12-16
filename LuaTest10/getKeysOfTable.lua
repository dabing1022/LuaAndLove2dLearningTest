function table.keys(t)
    local keys = {}
    for k, v in pairs(t) do
        keys[#keys + 1] = k
    end
    return keys
end

function table.values(t)
    local values = {}
    for k, v in pairs(t) do
        values[#values + 1] = v
    end
    return values
end


test = {name = "childhoodandy", sex = "male", 30, 100}

keys = table.keys(test)
for i, v in pairs(keys) do
    print(i, v)
    print("-----")
    print(test[i])
end
print("==================")
values = table.values(test)
for i, v in pairs(values) do
    print(i, v)
end