---------------理解1-----------------
local class_mt = {}

function class_mt:__index(key)
    return self.__baseclass[key]
end

class = setmetatable({ __baseclass = {} }, class_mt)

function class:new(...)
    local c = {}
    c.__baseclass = self
    setmetatable(c, getmetatable(self))
    if c.init then
        c:init(...)
    end
    return c
end
---------------理解2-----------------
Window = {}
Window.prototype = {x = 0, y = 0, width = 100, height = 100}
Window.mt = {}
function Window.new(o)
	setmetatable(o, Window.mt)
	return o
end

function Window.mt:__index(key)
	return Window.prototype[key]
end

local testWindow = Window.new({name = "dabing"})
print(testWindow.x) -- 0
print(testWindow.width) -- 100
---------------理解3-----------------
local mt = {__index = function(t) return t.___ end}
function setDefault(t, d)
	t.___ = d
	setmetatable(t, mt)
end
local tab = {x = 10, y = 20}
print(tab.x, tab.y, tab.z) -- 10, 20, nil
setDefault(tab, 30)
print(tab.x, tab.y, tab.z) -- 10, 20, 30
---------------理解4-----------------
local key = {}
local mt = {__index = function(t) return t[key] end}
function setDefault(t, d)
	t[key] = d
	setmetatable(t, mt)
end
