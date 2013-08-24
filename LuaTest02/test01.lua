-- A
print("\65")

-- 引号里面带引号的情况
message = 'That\'s "Jack O\'Neill", with two ll\'s'
print(message)

message2 = "That's \"Jack O'Neill\", with two ll's"
print(message2)

testmsg = [=[ One ]=]
print(testmsg)
testmsg = [======[ One ]======]
print(testmsg)


--Code blocks and Scopes
i = 1
print("i = ", i)
local i = 2
print("i = ", i)


-- and or
print("==============And Or============")
testing = nil
print(testing)
print(testing and 5)
print(testing or 5)
print(not testing)

testing = 15
print(testing)
print(testing and 5)
print(testing or 5)
print(not testing)

print("==============string length============")
print(#"this sentence length is")
