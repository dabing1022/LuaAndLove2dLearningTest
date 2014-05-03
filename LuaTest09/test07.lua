local bulletToRemove = {}
function GameContainer:onEnterFrame(dt)
	freamCount = freamCount + 1;--帧数累计
	local bullet = nil;--当前子弹
	
	--每20帧射出一发子弹
	if(freamCount >= 20) then
		freamCount = 0;
		if(#bulletPoolArr > 0) then--废弃子弹池
			bullet = table.remove(bulletPoolArr);--取出废弃子弹
		else
			bullet = display.newSprite("#img_3.png");--如果废弃子弹池中无，则new新子弹
		end;

		-- batch:addChild(bullet);--添加新子弹
		bulletArr[#bulletArr + 1] = bullet;--放入运动数组
		bullet:setPositionX(lead.xx);--设置子弹起始坐标
		bullet:setPositionY(lead.yy);
	end;
	
	--遍历运动数组，移动或者删除子弹
	local xx = 0;
	 for  i = #bulletArr,1,-1 do
	 	bullet = bulletArr[i];
	 	xx = bullet:getPositionX();
	 	if(xx > GameManager.windowsWidth) then--子弹到边界，移除
	 		bulletPoolArr[#bulletPoolArr + 1] = bullet
	 		bulletToRemove[#bulletToRemove + 1] = i
	 		-- batch:removeChild(bullet);
	 	else
	 		bullet:setPositionX(bulletSpeed + xx);--速度运行子弹
	 	end;
	 end;

	 for i, index in ipairs(bulletToRemove) do
	 	table.remove(bulletArr, index)
	 end

end

print("====================================")
local bulletToRemove = {}
function GameContainer:onEnterFrame(dt)
	freamCount = freamCount + 1;--帧数累计
	local bullet = nil;--当前子弹
	
	--每20帧射出一发子弹
	if(freamCount >= 20) then
		freamCount = 0;
		if(#bulletPoolArr > 0) then--废弃子弹池
			bullet = table.remove(bulletPoolArr);--取出废弃子弹
		else
			bullet = display.newSprite("#img_3.png");--如果废弃子弹池中无，则new新子弹
			bullet:retain()
		end;

		batch:addChild(bullet);--添加新子弹
		bulletArr[#bulletArr + 1] = bullet;--放入运动数组
		bullet:setPositionX(lead.xx);--设置子弹起始坐标
		bullet:setPositionY(lead.yy);
	end;
	
	--遍历运动数组，移动或者删除子弹
	local xx = 0;
	 for  i = #bulletArr,1,-1 do
	 	bullet = bulletArr[i];
	 	xx = bullet:getPositionX();
	 	if(xx > GameManager.windowsWidth) then--子弹到边界，移除
	 		bulletPoolArr[#bulletPoolArr + 1] = bullet
	 		bulletToRemove[#bulletToRemove + 1] = i
	 		batch:removeChild(bullet);
	 	else
	 		bullet:setPositionX(bulletSpeed + xx);--速度运行子弹
	 	end;
	 end;

	 for i, index in ipairs(bulletToRemove) do
	 	table.remove(bulletArr, index)
	 end

end