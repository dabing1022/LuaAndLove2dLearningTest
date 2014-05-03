function utfstrlen(str)
	local len = #str;
	local left = len;
	local cnt = 0;
	local arr={0,0xc0,0xe0,0xf0,0xf8,0xfc};
	while left ~= 0 do
		local tmp=string.byte(str,-left);
		local i=#arr;
		while arr[i] do
			if tmp>=arr[i] then 
				left=left-i;
				break;
			end
				i=i-1;	
		end
		cnt=cnt+1;
	end
	return cnt;
end

function string.utf8len(str)
    local len  = #str
    local left = len
    local cnt  = 0
    local arr  = {0, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc}
    while left ~= 0 do
        local tmp = string.byte(str, -left)
        local i   = #arr
        while arr[i] do
            if tmp >= arr[i] then
                left = left - i
                break
            end
            i = i - 1
        end
        cnt = cnt + 1
    end
    return cnt
end

function string.urldecode(str)
    str = string.gsub (str, "+", " ")
    str = string.gsub (str, "%%(%x%x)", function(h) return string.char(tonum(h,16)) end)
    str = string.gsub (str, "\r\n", "\n")
    return str
end

local str = "I can fly!"
local str2 = "我可以 飞翔！"
local len = string.len(str)
local len2 = string.utf8len(str2)
print(len)
print(utfstrlen(str2))
print(string.utf8len(str2))

for i = 1, len do
	print(string.sub(str, i, i))
end

print(string.urldecode(str2))
for i = 1, len2 do
	
end
