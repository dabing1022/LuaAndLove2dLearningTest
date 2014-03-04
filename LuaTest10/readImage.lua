M = {}
function M.readfile(path)
    local file = io.open(path, "r")
    if file then
        local content = file:read("*a")
        io.close(file)
        return content
    end
    return nil
end

local file = M.readfile("test.jpg")
print(type(file))