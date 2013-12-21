-- LUA协程


-- coroutine.create(f)
-- 函数参数[接受单个参数，这个参数为coroutine的主函数]
-- 函数返回值[返回一个thread对象]
-- 函数作用[创建一个新的协程，协程的主函数定义了该协程内的任务流程]


-- coroutine.resume(co, [, var1, ...])
-- 函数参数[第一个参数：coroutine.create的返回值，即一个thread对象]
-- 函数参数[第二个参数：coroutine中执行需要的参数，是一个变长参数，可以传任意多个]
-- 函数返回值[如果程序没有任何运行错误，则返回true，之后的返回值是前一个调用coroutine.yield中传入的参数值]
-- 函数返回值[如果程序遇到运行错误，则返回false，加上错误信息]
-- 函数作用[当你第一次调用coroutine.rusume方法时，coroutine从主函数的第一行开始执行，之后在coroutine开始执行后，它会一直运行到
--         自身终止或者是coroutine的下一次yield函数]

-- coroutine.yield(...)
-- 函数参数[变长参数]
-- 函数返回值[如果程序没有任何运行错误，则返回true，之后的返回值是前一个调用coroutine.resume()中传入的参数值]
-- 函数返回值[如果程序遇到运行错误，则返回false，加上错误信息]
-- 函数作用[挂起当前执行的协程]

-- coroutine.running()
-- 函数参数[空]
-- 函数返回值[返回当前协程，如果它被主线程调用的话，返回nil]

-- coroutine.status()
-- 函数参数[空]
-- 函数返回值[返回当前协程的状态，有suspended, running, normal, dead]
-----------------------------------------------------------------
print("01 ------------------------------------------------------")
local co = coroutine.create(
	function()
		print("hi")
		print("coroutine running is ")
		print(coroutine.running())
	end
)

print(type(co))
print(co)
print(coroutine.running())
coroutine.resume(co)
print(coroutine.running())

-- 协程3个状态： 挂起 suspended、 运行 、 停止 dead
-- 创建协程的时候开始状态为挂起状态，不会自动运行
-- status
print(coroutine.status(co))

-- resume 挂起-->运行
coroutine.resume(co)

-- 打印出"hi"(执行完rotoutine create的函数）后便进入终止状态
print(coroutine.status(co))

-------------------------------------------------------------------
print("02 ------------------------------------------------------")

co = coroutine.create(function()
	for i = 1, 10 do
		print("co", i)
		coroutine.yield()
	end
end)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print("nothing happened")
print(coroutine.status(co))  -- dead
print(coroutine.resume(co))  -- false	cannot resume dead coroutine
coroutine.resume(co)
coroutine.resume(co)

-------------------------------------------------------------------
print("03 ------------------------------------------------------")

co = coroutine.create(function(a, b, c)
	print("co", a, b, c)
end)

coroutine.resume(co, 1, 2, 3)

print("======")

co = coroutine.create(function(a, b)
	coroutine.yield(a + b, a - b)
	print(a + b, a - b)
end)

print(coroutine.resume(co , 20, 10)) -- coroutine.yield(30, 10) , resume此时返回true还会额外返回yield的参数30、10
coroutine.resume(co)

print("======")

co = coroutine.create(function()
	print("co", coroutine.yield())
end)
coroutine.resume(co)
coroutine.resume(co, 4, 5)

print("======")

co = coroutine.create(function()
	return 6, 7
end)
print(coroutine.resume(co))

-------------------------------------------------------------------
print("04 ------------------------------------------------------")

function foo(a)
    print("foo", a)
    return coroutine.yield(2 * a)
end

co = coroutine.create(function ( a, b )
    print("co-body", a, b)
    -- local r = foo(a + 1)
    print("foo", a + 1)
    local r = coroutine.yield(2 * (a + 1))
    print("co-body", r)
    local r, s, t = coroutine.yield(a + b, a - b)
    print("co-body", r, s, t)
    return b, "end"
end)

print("main", coroutine.resume(co, 1, 10))
print("main", coroutine.resume(co, "ChildhoodAndy"))
print("main", coroutine.resume(co, "x", "y", "z"))
print("main", coroutine.resume(co, "x", "y"))


-- coroutine.yield挂起时将参数当传给上次coroutine.resume当返回值
-- coroutine.resume恢复时将参数传给上次coroutine.yield的返回值
-- result 
--co-body	1	10
--foo	2
--main	true	4
--co-body	ChildhoodAndy
--main	true	11	-9
--co-body	x	y	z
--main	true	10	end
--main	false	cannot resume dead coroutine

-------------------------------------------------------------------
print("05 ------------------------------------------------------")

local clock = os.clock
function sleep(n)
	local t0 = clock()
	while clock() - t0 <= n do
	end
end

print("call back way ...")

local bob = {}
function bob.walkto(callback, name)
	print("bob is walking to ", name)
	sleep(2)
	print("bob already in front of ", name)
	callback()
end

function bob.say(callback, words)
	print("bob say ", words)
	sleep(2)
	callback()
end

local jane = {}
function jane.say(words)
	print("jane say", words)
end

bob.walkto(function()
	bob.say(function()
		jane.say("Fine. Thank you! And you?")
	end, "hello, jane! How are you?")
end, "jane")

----------------------------------------------------------------------
print("coroutine way ... ")

local bob = {}
function bob.walkto(name)
	print("bob is walking to ", name)
	sleep(2)
	print("bob already in front of ", name)
end

function bob.say(words)
	print("bob say ", words)
	sleep(2)
end

local jane = {}
function jane.say(words)
	print("jane say", words)
end

co = coroutine.create(function()
	bob.walkto("jane")
	local r = coroutine.yield()	
	r()
	local m = coroutine.yield()
	m()
end)

coroutine.resume(co)
coroutine.resume(co, function() bob.say("hello, jane! How are you?") end)
coroutine.resume(co, function() jane.say("Fine. Thank you! And you?") end)