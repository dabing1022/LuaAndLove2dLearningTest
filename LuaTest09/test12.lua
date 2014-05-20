local test = { 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p' }
local remove = { a = true, b = true, c = true, e = true, f = true, p = true }

local function dump(table)
	for k, v in pairs( table ) do
		print(k)
		print(v)
		print("*********")
	end
end

-- 1 delete from last, not first
function deleteTest01()

	for i = #test, 1, -1 do
		if remove[test[i]] then
			table.remove(test, i)
		end
	end

	dump(test)
end

-- 2 while
function deleteTest02()
	local i = 1
	while i <= #test do
		if remove[test[i]] then
			table.remove(test, i)
		else
			i = i + 1
		end
	end

	dump(test)
end

-- 3 removeItem
function deleteTest03()
	function table.removeItem(list, item, removeAll)
	    local rmCount = 0
	    for i = 1, #list do
	        if list[i - rmCount] == item then
	            table.remove(list, i - rmCount)
	            if removeAll then
	                rmCount = rmCount + 1
	            else
	                break
	            end
	        end
	    end
	end

	for k, v in pairs( remove ) do
		table.removeItem(test, k)
	end

	dump(test)
end


-- deleteTest01()
-- deleteTest02()
deleteTest03()








