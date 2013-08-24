print("------------------thread-----------------------")

thread = coroutine.create(function() print("Started") end)
print("---", coroutine.status(thread))
coroutine.resume(thread)
print("---", coroutine.status(thread))

print(coroutine.running(thread))
thread = coroutine.create(function() print("Hello") end)
print(coroutine.running(thread))
coroutine.resume(thread)
print("---", coroutine.status(thread))


print("----------------")

thread2 = coroutine.wrap(function() print("Hello") end)
thread2()


print("----------------")
co = coroutine.create(function() print("Childhood") end)
print(co)
print(type(co))
coroutine.resume(co)
print(coroutine.status(co))
