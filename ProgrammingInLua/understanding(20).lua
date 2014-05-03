-- String

-- String 库中的一些函数是非常简单的:string.len(s)返回字符串 s 的长度;
-- string.rep(s, n)返回重复 n 次字符串 s 的串;
-- 你使用 string.rep("a", 2^20)可以创建一个 1M bytes 的字符 串(比如,为了测试需要);
-- string.lower(s)将 s 中的大写字母转换成小写(string.upper 将小写转换成大写)。

local name = "abc"
print(string.len(name))	-- 3

local name2 = string.rep(name, 2)
print(name2)	-- abcabc

local name3 = string.rep("dabing", 3)
print(name3)	-- dabingdabingdabing

local name4 = string.upper(name)
print(name4)	-- ABC

local name5 = "childhood"
local name6 = string.sub(name5, 1, 3)
local name7 = string.sub(name5, 3, -1)
local name7_1 = string.sub(name5, 3, -6)
local name8 = string.sub(name5, 3)
print(name6)	-- chi
print(name7)	-- ildhood
print(name7_1)  -- il
print(name8)	-- ildhood

local name9 = "[childhood]"
local name9 = string.sub(name9, 2, -2)
print(name9)	-- childhood

-- ASCII 
print(string.char(97))	-- a
i = 97
print(string.char(i, i+1, i+2))	-- abc

-- string.format
print(string.format("pi = %.4f", 3.141592654))	-- 3.1416

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
print(i, j)	-- 1 5
print(string.sub(s, i, j+2))	-- hello w
i, j = string.find(s, "world")	
print(i, j)	-- 7 11
i, j = string.find(s, "l")	
print(i, j)	-- 3 3
print(string.find(s, "lll"))	-- nil



print("--------string.gsub-------------")
-- string.gsub 函数有三个参数:目标串,模式串,替换串。
-- 第四个参数是可选的,用来限制替换的范围
s = string.gsub("childhoodandy", "andy", "dabing")
print(s)	-- childhooddabing

s = "dabbbbing"
s1, count = string.gsub(s, "b", "x")
print(s1, count)	-- daxxxxing 4


print("--------------模式-----------------")
s = "today  31/12/2013, Tuesday"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))	-- 31/12/2013

-- ====================================
-- 字符类
-- .	任意字符
-- %a 	字母
-- %c 	控制字符
-- %d 	数字
-- %l 	小写字母
-- %p 	标点字符
-- %s 	空白符
-- %u 	大写字母
-- %w 	字母和数字
-- %x 	十六进制数字
-- %z 	代表0的字符
-- 字符类的大写形式表示小写所代表的集合的补集
-- ------------------------------------
-- 【在模式匹配中有一些特殊字符，有着特殊的意义】
-- 		                 $  %  ^  * (   )  -  +   .  ?  [  ]
-- 记忆：键盘上的字符      4  5  6  8  9  0  -   =  .   ?  [  ]
-- '%'  1. 用作特殊字符的转义字符 2.用于所有的非字母的字符
-- '\'  lua转义符，可以转移引号
-- '%.' 匹配点
-- '%%' 匹配字符'%'
-- 1. 模式串是普通的字符串，当用于函数的时候，'%'才作为转义字符
-- 2. 使用方括号讲字符类或者字符括起来创建自己的字符类（char-set）
-- [%w_] 		匹配字母数字和下划线
-- [01]  		匹配二进制数字
-- [%[%]] 		匹配一对方括号
-- [0-9] 		等同于%d
-- [0-9a-fA-F]  等同于%x
-- [0-7] 		匹配8进制数
-- [\n] 		匹配换行符
-- 3. 在字符集的开始处使用 '^' 表示其补集
-- [^\n]		匹配任何非换行符号的字符
-- [^%s] 		等同于%S
-- ------------------------------------
-- +			匹配前一字符1次或多次
-- -			匹配前一字符0次或多次[最短匹配]
-- *			匹配前一字符0次或多次[最长匹配]
-- ？			匹配前一字符0次或1次
-- ====================================

test = "hello, up-down!"
print(string.gsub(test, "%A", ".")) -- hello..up.down. 4

text = "I am from China, my name is ChildhoodAndy. Blog:http://childhood.logdown.com"
print(string.gsub(text, "[ABCamog]", "?")) -- I ?? fr?? ?hin?, ?y n??e is ?hildh??d?ndy. ?l??:http://childh??d.l??d?wn.c??	23

-- '+' 匹配一个或者多个字符，总是进行最长的匹配。
-- '%a+' 匹配一个或多个字母或一个单词
print(string.gsub("one, and two; and three", "%a+", "word")) -- word, word word; word word	5

-- '%d+' 匹配一个或多个数字（整数）
print(string.find("the number 1298 is even", "%d+")) -- 12  15

-- '*' 匹配一个字符0次或多次出现 典型应用是匹配空白
-- ’%(%s*%)' 匹配一对圆括号()或者括号之间的空白
print(string.gsub("( Let's   rock! ! !) haha!!!", "%(%s*%)", "?"))

test = "int x; /* x */ int y; /* y */"
-- '.*' 进行最长匹配，匹配字符串中第一个"/*" 和 最后一个"*/" 之间
-- '.-' 进行最短匹配，匹配字符串中第一个"/*" 和 第一个"*/" 之间
print(string.gsub(test, "/%*.*%*/", "<COMMENT>")) -- int x; <COMMENT>	1
print(string.gsub(test, "/%*.-%*/", "<COMMENT>")) -- int x; <COMMENT> int y; <COMMENT>	2

print(string.gsub("+32 abcdefg hijklmn -28 + 33 - 44 +1024 -2048", "[+-]?%d+", "number")) -- number abcdefg hijklmn number + number - number number number	6

-- 以'^'开头的模式只匹配目标串的开始部分，以'$'结尾的模式只匹配目标串的结尾部分
print(string.gsub("333abc", "^%d", "d")) -- d33abc	1
print(string.gsub("333abc", "%a$", "d")) -- 333abd	1
-- '%b' 匹配对称的字符，常写为 '%bxy', x,y是任意两个不同的字符
print(string.gsub("a (12345) b", "%b()", ""))  -- a  b	1

--================================= Captures ================================
-- 捕获：使用模式串的一部分匹配目标串的一部分，用圆括号扩起想捕获的模式
pair = "name andy = Anna andy2"
i, j, key, value = string.find(pair, "(%a+)%s*=%s*(%a+)")
print(i, j, key, value)	 -- 6	16	andy	Anna

date = "17/7/1990"
_, _, d, m, y = string.find(date, "(%d+)/(%d+)/(%d+)")
print(d, m, y)

-- '%d' (d代表1-9的数字)表示第d个捕获的拷贝
s = [[then he said: "it's all right"!]]
a, b, c, quotedPart = string.find(s, "([\"\'])(.-)%1")
print(a, b, c, quotedPart)

s = "hello Lua!"
print(string.gsub(s, "(%a)", "%1-%1"))	-- h-he-el-ll-lo-o L-Lu-ua-a!	8

print(string.sub("shibing1", 1, -2))