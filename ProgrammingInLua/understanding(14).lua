-- 环境
-- environment
-- _G

for n, _ in pairs(_G) do
	print(n)
end

-- bad 
val = 6
_G["a"] = _G["val"]
print(a)