-- 1、string.gmatch(返回查找到字符串的迭代器)

-- t = {}
-- s = "from=world, to=Lua"
-- for k, v in string.gmatch(s, "(%w+)=(%w+)") do
--  t[k]=v
-- end
-- for k, v in pairs(t) do
--  print(k,v)
-- end

-- string.gmatch(字符串,模式字符串，起始位置)： 在字符串中查找模式字符串，返回值为一个迭代器(function类型)

-- 2、string.gsub(字符串,模式化字符串，替换字符串)：返回替换之后的字符串，以及替换的次数

-- 3、string.gfind（字符串,模式字符串，起始位置）： 返回在字符串中所匹配的模式字符串的一个迭代器

-- 4、string.find（字符串,模式字符串，起始位置）：他只查一个，匹配一个之后就不继续了
-- 5、string.match(字符串,模式字符串，起始位置)只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1.
-- 在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil.
-- 6、string.reverse(字符串)返回一个字符串的倒序排列

-- 7、string.dump(function) 返回指定函数的二进制代码(函数必须是一个Lua函数，并且没有上值)


t = {}
s = "from=world, to=Lua"

for k, v in string.gmatch(s, "(%w+)=(%w+)") do
 t[k]=v
end


for k, v in pairs(t) do
 print(k,v)
end

----------------------
local title = "english,中文名,公式(for npc)"
local name,chinese,func = string.match(title,"(.-),(.-),(.+)")
print(name)
print(chinese)
print(func)
