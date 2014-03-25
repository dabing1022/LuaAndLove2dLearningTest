local tbtest = {[1]=11,[2]=22,[3]=33,[4]=44,[5]=55,[6]=66,[7]=77,[8]=88,[9] = nil, [10] = nil, [11]=44}
local tbtest = {11, 22, 33, 44, 55, 66, 77, 88}

  print("完整的数组")
  num = 0
  for k,v in pairs(tbtest) do
    print("k   =  "..k,"    v   =  "..v)
    num = num + 1
  end

  print("数组的长度是  "..(#tbtest))
  print("数组的长度是  ".. num)

  function aaaa(t, item, removeAll)

    for i = #t, 1, -1 do
        print("删除后数组的长度是  "..(#t))
        if t[i] == item then
            print("要删除的索引是"..i)
            table.remove(t, i)
            if not removeAll then 
              break 
            end
        end
    end
  end
  aaaa(tbtest, 44, false)
  print("删除后的数组")
  for k,v in pairs(tbtest) do
    print("k   =  "..k,"    v   =  "..v)
  end


  function table.indexOfKey(list, key, value, from, useMaxN)
  local len = (useMaxN and #list) or table.maxn(list)
  if from == nil then
    from = 1
  end
  local item = nil
  for i = from, len do
    item = list[i]
    if item ~= nil and item[key] == value then
      return i
    end
  end
  return -1
end      

local test = {{aa = 2}, {bb = 3, cc = 6, ff = 10}, {dd = 5}}
local test2 = {{aa = 2}, {[1] = 3, [3] = 6, [6] = 10}, {dd = 5, [100] = 200}}
local test3 = {[2]={[1] = 1 , c =3},
                 [3]={c = 13 , d =4},
                 [4]={e = 1 , f =53}
               }
-- print(table.indexOfKey(test, "bb", 3))
-- print(table.indexOfKey(test, "cc", 7))
-- print(table.indexOfKey(test2, 1, 3)) -- 2
-- print(table.indexOfKey(test2, 3, 6)) -- 2
-- print(table.indexOfKey(test2, 6, 10)) -- 2
-- print(table.indexOfKey(test2, 100, 200)) -- 3
print(table.indexOfKey(test3, "c", 13)) 
print(table.indexOfKey(test3, 1, 1)) 

function table.map(t, fun)
    for k,v in pairs(t) do
        t[k] = fun(v, k)
    end
end   

function method(param1, param2)
  print(param1 .. "===" .. param2)
end

local t = {a = 1, b = 2, c = 3}
table.map(t, method)

