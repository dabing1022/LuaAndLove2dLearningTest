-- String

-- String 库中的一些函数是非常简单的:string.len(s)返回字符串 s 的长度;
-- string.rep(s, n)返回重复 n 次字符串 s 的串;
-- 你使用 string.rep("a", 2^20)可以创建一个 1M bytes 的字符 串(比如,为了测试需要);
-- string.lower(s)将 s 中的大写字母转换成小写(string.upper 将小写转换成大写)。

local name = "abc"
print(string.len(name))

local name2 = string.rep(name, 2)
print(name2)

local name3 = string.rep("dabing", 3)
print(name3)

local name4 = string.upper(name)
print(name4)

local name5 = "childhood"
local name6 = string.sub(name5, 1, 3)
local name7 = string.sub(name5, 3, -1)
local name8 = string.sub(name5, 3)
print(name6)
print(name7)
print(name8)

local name9 = "[childhood]"
local name9 = string.sub(name9, 2, -2)
print(name9)

-- ASCII 
print(string.char(97))
i = 97
print(string.char(i, i+1, i+2))

-- string.format
print(string.format("pi = %.4f", 3.141592654))

-------------------模式匹配函数
-- string.find
-- string.gfind
-- string.gsub

-- string.find的基本应用就是用来在目标串(subject string)内搜索匹配指定的模式的串。
-- 函数如果找到匹配的串返回他的位置,否则返回 nil.
-- 最简单的模式就是一个单词, 仅仅匹配单词本身。比如,模式'hello'仅仅匹配目标串中的"hello"。
-- 当查找到模式的时候, 函数返回两个值:匹配串开始索引和结束索引。
-- string.find 函数第三个参数是可选的:标示目标串中搜索的起始位置。
print("--------string.find-------------")
local s = "hello world"
local i, j = string.find(s, "hello")
print(i, j)
print(string.sub(s, i, j+2))
i, j = string.find(s, "world")
print(i, j)
i, j = string.find(s, "l")
print(i, j)
print(string.find(s, "lll"))



print("--------string.gsub-------------")
-- string.gsub 函数有三个参数:目标串,模式串,替换串。
-- 第四个参数是可选的,用来限制替换的范围
s = string.gsub("childhoodandy", "andy", "dabing")
print(s)

s = "dabbbbing"
s1, count = string.gsub(s, "b", "x")
print(s1, count)


print("--------------模式-----------------")
s = "today  31/12/2013, Tuesday"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))