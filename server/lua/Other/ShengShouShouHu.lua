local GoodsID10,GoodsID11,GoodsID12,GoodsID13,GoodsID14 = 83520,83521,83522,83523,83524
API_AddLUAReqFunc("SuperSs")
function SuperSs()
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)
	local SelectItem = API_RequestGetNumber(1)
	local Page = API_RequestGetNumber(2)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local ssExpLevel = API_GetActorExpLevel(ActorID)
	local ssflag=0
	if ssExpLevel >= 50 then
		ssflag=101
	else
		ssflag=101
	end
	local SSSS1 = API_ActorGetGoodsNum(ActorID,83520)--青龙	
	local SSSS2 = API_ActorGetGoodsNum(ActorID,83521)--白虎	
	local SSSS3 = API_ActorGetGoodsNum(ActorID,83522)--朱雀	
	local SSSS4 = API_ActorGetGoodsNum(ActorID,83523)--玄武	
	local SSSS5 = API_ActorGetGoodsNum(ActorID,83524)--麒麟		
	if SelectItem == 2 then
	    API_ResponseWrite('<name>五 圣 兽 守 护 </name>')
	API_ResponseWrite('<img srcres="104013"  tip="逐鹿天下">')
        API_ResponseWrite('<a href="SuperSs?1=11"> 圣兽守护——青龙（物理攻击）</a><text> </text>')
		API_ResponseWrite('><text color="255,0,0">当前拥有：</text>')		
		API_ResponseWrite('<img srcgd="'..GoodsID10..'" tipgd="'..GoodsID10..'" ><text color="255,0,0">×'..SSSS1..'              </text><br><br>')
	API_ResponseWrite('<img srcres="104013"  tip="逐鹿天下">')
        API_ResponseWrite('<a href="SuperSs?1=12"> 圣兽守护——白虎（魔法攻击）</a><text> </text>')
		API_ResponseWrite('><text color="255,0,0">当前拥有：</text>')		
		API_ResponseWrite('<img srcgd="'..GoodsID11..'" tipgd="'..GoodsID11..'" ><text color="255,0,0">×'..SSSS2..'</text><br><br>')	
	API_ResponseWrite('<img srcres="104013"  tip="逐鹿天下">')		
        API_ResponseWrite('<a href="SuperSs?1=13"> 圣兽守护——朱雀（火药攻击）</a><text> </text>')
		API_ResponseWrite('><text color="255,0,0">当前拥有：</text>')		
		API_ResponseWrite('<img srcgd="'..GoodsID12..'" tipgd="'..GoodsID12..'" ><text color="255,0,0">×'..SSSS3..'              </text><br><br>')
	API_ResponseWrite('<img srcres="104013"  tip="逐鹿天下">')		
        API_ResponseWrite('<a href="SuperSs?1=14"> 圣兽守护——玄武（生命上限）</a><text> </text>')
		API_ResponseWrite('><text color="255,0,0">当前拥有：</text>')		
		API_ResponseWrite('<img srcgd="'..GoodsID13..'" tipgd="'..GoodsID13..'" ><text color="255,0,0">×'..SSSS4..'</text><br><br>')
	API_ResponseWrite('<img srcres="104013"  tip="逐鹿天下">')		
        API_ResponseWrite('<a href="SuperSs?1=15"> 圣兽守护——麒麟（基础防御）</a><text> </text>')
		API_ResponseWrite('><text color="255,0,0">当前拥有：</text>')		
		API_ResponseWrite('<img srcgd="'..GoodsID14..'" tipgd="'..GoodsID14..'" ><text color="255,0,0">×'..SSSS5..'              </text>')			
end
		if SelectItem == 11 then
		local QLLvCN = API_VarDataGetNumber(ActorID,1,12001) - math.floor(API_VarDataGetNumber(ActorID,1,12001)/10000) * -1
		local QLLvCN1 = QLLvCN*100
		local QLLvCN3 = QLLvCN + 1
		local QLLvCN4 = QLLvCN3*100
		local QLGoosNum = QLLvCN3*10+90
          API_ResponseWrite('<name>圣兽守护——青龙</name>')
          API_ResponseWrite('<text>圣兽守护——青龙  </text><br>')
          API_ResponseWrite('<text>当前级别为</text><text color="150,255,60"> '..QLLvCN..' 级</text><br>')
       if QLLvCN == 0 then
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 无</text><br>')
       else
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 增加 '..QLLvCN1..' 点物理攻击</text><br>')
       end
       if QLLvCN3 >=ssflag then 
          API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       else
					API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">青龙元神  X  '..QLGoosNum..'</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60"> 增加 '..QLLvCN4..' 点物理攻击</text><br>')
					API_ResponseWrite('<br><a href="SuperSs?1=16">升级青龙守护等级</a><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       end
   end
		if SelectItem == 12 then
		local BHLvCN = API_VarDataGetNumber(ActorID,1,12002) - math.floor(API_VarDataGetNumber(ActorID,1,12002)/10000) * -1
		local BHLvCN1 = BHLvCN*100
		local BHLvCN3 = BHLvCN + 1
		local BHLvCN4 = BHLvCN3*100
		local QLGoosNum = BHLvCN3*10+90
          API_ResponseWrite('<name>圣兽守护——白虎</name>')
          API_ResponseWrite('<text>圣兽守护——白虎  </text><br>')
          API_ResponseWrite('<text>当前级别为</text><text color="150,255,60"> '..BHLvCN..' 级</text><br>')
       if BHLvCN == 0 then
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 无</text><br>')
       else
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 增加 '..BHLvCN1..' 点魔法攻击</text><br>')
       end
       if BHLvCN3 >=ssflag then 
          API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       else
					API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">白虎元神  X  '..QLGoosNum..'</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60"> 增加 '..BHLvCN4..' 点魔法攻击</text><br>')
					API_ResponseWrite('<br><a href="SuperSs?1=17">升级白虎守护等级</a><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       end
   end
	if SelectItem == 13 then
		local ZQLvCN = API_VarDataGetNumber(ActorID,1,12003) - math.floor(API_VarDataGetNumber(ActorID,1,12003)/10000) * -1
		local ZQLvCN1 = ZQLvCN*100 
		local ZQLvCN3 = ZQLvCN + 1
		local ZQLvCN4 = ZQLvCN3*100 
		local QLGoosNum = ZQLvCN3*10+90
          API_ResponseWrite('<name>圣兽守护——朱雀</name>')
          API_ResponseWrite('<text>圣兽守护——朱雀  </text><br>')
          API_ResponseWrite('<text>当前级别为</text><text color="150,255,60"> '..ZQLvCN..' 级</text><br>')
       if ZQLvCN == 0 then
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 无</text><br>')
       else
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 增加 '..ZQLvCN1..' 点火药攻击</text><br>')
       end
       if ZQLvCN3 >=ssflag then 
          API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       else
					API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">朱雀元神  X  '..QLGoosNum..'</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60"> 增加 '..ZQLvCN4..' 点火药攻击</text><br>')
					API_ResponseWrite('<br><a href="SuperSs?1=18">升级朱雀守护等级</a><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       end
    end
	if SelectItem == 14 then
		local XWLvCN = API_VarDataGetNumber(ActorID,1,12006) - math.floor(API_VarDataGetNumber(ActorID,1,12006)/10000) * -1
		local XWLvCN1 = XWLvCN * 500
		local XWLvCN3 = XWLvCN + 1
		local XWLvCN4 = XWLvCN3 * 500
		local QLGoosNum = XWLvCN3*10+90
          API_ResponseWrite('<name>圣兽守护——玄武</name>')
          API_ResponseWrite('<text>圣兽守护——玄武  </text><br>')
          API_ResponseWrite('<text>当前级别为</text><text color="150,255,60"> '..XWLvCN..' 级</text><br>')
       if XWLvCN == 0 then
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 无</text><br>')
       else
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 增加 '..XWLvCN1..' 点生命上限</text><br>')
       end
       if XWLvCN3 >=ssflag then 
          API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       else
					API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">玄武元神  X  '..QLGoosNum..'</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60"> 增加 '..XWLvCN4..' 点生命上限</text><br>')
					API_ResponseWrite('<br><a href="SuperSs?1=19">升级玄武守护等级</a><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       end
   end
	if SelectItem == 15 then
		local QLLLvCN = API_VarDataGetNumber(ActorID,1,12007) - math.floor(API_VarDataGetNumber(ActorID,1,12007)/10000) * -1
		local QLLLvCN1 = QLLLvCN*100
		local QLLLvCN3 = QLLLvCN + 1
		local QLLLvCN4 = QLLLvCN3*100
		local QLGoosNum = QLLLvCN3*10+90
          API_ResponseWrite('<name>圣兽守护——麒麟</name>')
          API_ResponseWrite('<text>圣兽守护——麒麟  </text><br>')
          API_ResponseWrite('<text>当前级别为</text><text color="150,255,60"> '..QLLLvCN..' 级</text><br>')
       if QLLLvCN == 0 then
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 无</text><br>')
       else
          API_ResponseWrite('<text>当前属性：</text><text color="150,255,60"> 增加 '..QLLLvCN1..' 点基础防御</text><br>')
       end
       if QLLLvCN3 >=ssflag then 
          API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60">暂未开放下一级</text><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       else
					API_ResponseWrite('<text>升到下一级别需要材料：</text><text color="150,255,60">麒麟元神  X  '..QLGoosNum..'</text><br>')
          API_ResponseWrite('<text>下级属性：</text><text color="150,255,60"> 增加 '..QLLLvCN4..' 点基础防御</text><br>')
					API_ResponseWrite('<br><a href="SuperSs?1=20">升级麒麟守护等级</a><br>')
          API_ResponseWrite('<br><a href="SuperSs?1=2">  返回</a>')
       end
   end
  if SelectItem == 16 then
        local QLLvCNSJ = API_VarDataGetNumber(ActorID,1,12001) + 1
		local QLLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12001) - math.floor(API_VarDataGetNumber(ActorID,1,12001)/10000) * -1 + 1
        local QLLvCNSJ1 = QLLvCNSJ2 * 10 +90
    if API_ActorGetGoodsNum(ActorID,83520) >= QLLvCNSJ1 then                    
      if API_ActorRemoveGoods(ActorID,83520,QLLvCNSJ1,"删除青龙元神")  then
            API_VarDataSetNumber(ActorID,1,12001,QLLvCNSJ)                          
            QLStatusID = 2134000 + QLLvCNSJ2
            API_ActorAddStatus(ActorID,QLStatusID,-1)     
			API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']将青龙守护升级到['..QLLvCNSJ..']级')		
			API_Trace('['..API_GetActorName(ActorID)..']将青龙守护升级到['..QLLvCNSJ..']级')				
            API_ResponseWrite('<text>升级成功！</text>')
			ShengShou_Buffcallback()
      API_ResponseWrite('<br><br><br><br><br><a href="SuperSs?1=11">还想升级青龙守护等级</a><br>')		
      API_ResponseWrite('<br><a href="SuperSs?1=2">返回圣兽守护</a>')	  
      API_ResponseWrite('<br><br><a>确定</a>')
      else
        API_ResponseWrite('<text>升级失败，请联系黑夜。</text>')
        API_ResponseWrite('<br><br><a>确定</a>')
      end
    else
      API_ResponseWrite('<text>您的所需的物品数量不够，升级青龙等级失败</text>')
      API_ResponseWrite('<br><br><a>确定</a>')
    end
  end
			if SelectItem == 17 then
        local BHLvCNSJ = API_VarDataGetNumber(ActorID,1,12002) + 1
		local BHLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12002) - math.floor(API_VarDataGetNumber(ActorID,1,12002)/10000) * -1 + 1
        local BHLvCNSJ1 = BHLvCNSJ2 * 10 +90
    if API_ActorGetGoodsNum(ActorID,83521) >= BHLvCNSJ1 then                       
      if API_ActorRemoveGoods(ActorID,83521,BHLvCNSJ1,"删除白虎元神")  then  
            API_VarDataSetNumber(ActorID,1,12002,BHLvCNSJ)                                 
            BHStatusID = 2135000 + BHLvCNSJ2
            API_ActorAddStatus(ActorID,BHStatusID,-1)       
			API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']将白虎守护升级到['..BHLvCNSJ..']级')			
			API_Trace('['..API_GetActorName(ActorID)..']将白虎守护升级到['..BHLvCNSJ..']级')					
            API_ResponseWrite('<text>升级成功！</text>')
			ShengShou_Buffcallback()
      API_ResponseWrite('<br><br><br><br><br><a href="SuperSs?1=12">还想升级白虎守护等级</a><br>')		
      API_ResponseWrite('<br><a href="SuperSs?1=2">返回圣兽守护</a>')	  
      API_ResponseWrite('<br><br><a>确定</a>')                                                                              
      else
        API_ResponseWrite('<text>升级失败，请联系黑夜。</text>')
        API_ResponseWrite('<br><br><a>确定</a>')
      end
    else
      API_ResponseWrite('<text>您的所需的物品数量不够，升级白虎等级失败</text>')
      API_ResponseWrite('<br><br><a>确定</a>')
    end
       
    end
			if SelectItem == 18 then
        local ZQLvCNSJ = API_VarDataGetNumber(ActorID,1,12003) + 1
		local ZQLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12003) - math.floor(API_VarDataGetNumber(ActorID,1,12003)/10000) * -1 + 1
        local ZQLvCNSJ1 = ZQLvCNSJ2 * 10 +90
    if API_ActorGetGoodsNum(ActorID,83522) >= ZQLvCNSJ1 then                      
      if API_ActorRemoveGoods(ActorID,83522,ZQLvCNSJ1,"")  then    
            API_VarDataSetNumber(ActorID,1,12003,ZQLvCNSJ)                                  
            ZQStatusID = 2136000 + ZQLvCNSJ2
            API_ActorAddStatus(ActorID,ZQStatusID,-1)        
			API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']将朱雀守护升级到['..ZQLvCNSJ..']级')		
			API_Trace('['..API_GetActorName(ActorID)..']将朱雀守护升级到['..ZQLvCNSJ..']级')				
            API_ResponseWrite('<text>升级成功！</text>')
			ShengShou_Buffcallback()
      API_ResponseWrite('<br><br><br><br><br><a href="SuperSs?1=13">还想升级朱雀守护等级</a><br>')		
      API_ResponseWrite('<br><a href="SuperSs?1=2">返回圣兽守护</a>')	  
      API_ResponseWrite('<br><br><a>确定</a>')                                                                                   
      else
        API_ResponseWrite('<text>升级失败，请联系黑夜。</text>')
        API_ResponseWrite('<br><br><a>确定</a>')
      end
    else
      API_ResponseWrite('<text>您的所需的物品数量不够，升级朱雀等级失败</text>')
      API_ResponseWrite('<br><br><a>确定</a>')
    end
    
    end
			if SelectItem == 19 then
			
        local XWLvCNSJ = API_VarDataGetNumber(ActorID,1,12006) + 1
		local XWLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12006) - math.floor(API_VarDataGetNumber(ActorID,1,12006)/10000) * -1 + 1
        local XWLvCNSJ1 = XWLvCNSJ2 * 10 +90
    if API_ActorGetGoodsNum(ActorID,83523) >= XWLvCNSJ1 then                      
      if API_ActorRemoveGoods(ActorID,83523,XWLvCNSJ1,"")  then   
            API_VarDataSetNumber(ActorID,1,12006,XWLvCNSJ)                                
            XWStatusID = 2137000 + XWLvCNSJ2
            API_ActorAddStatus(ActorID,XWStatusID,-1)       
			API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']将玄武守护升级到['..XWLvCNSJ..']级')		
			API_Trace('['..API_GetActorName(ActorID)..']将玄武守护升级到['..XWLvCNSJ..']级')				
            API_ResponseWrite('<text>升级成功！</text>')
			ShengShou_Buffcallback()
      API_ResponseWrite('<br><br><br><br><br><a href="SuperSs?1=14">还想升级玄武守护等级</a><br>')		
      API_ResponseWrite('<br><a href="SuperSs?1=2">返回圣兽守护</a>')	  
      API_ResponseWrite('<br><br><a>确定</a>')                                                                                
      else
        API_ResponseWrite('<text>升级失败，请联系黑夜。</text>')
        API_ResponseWrite('<br><br><a>确定</a>')
      end
    else
      API_ResponseWrite('<text>您的所需的物品数量不够，升级玄武等级失败</text>')
      API_ResponseWrite('<br><br><a>确定</a>')
    end


    end
	if SelectItem == 20 then
			local QLLLvCNSJ = API_VarDataGetNumber(ActorID,1,12007) + 1
			local QLLLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12007) - math.floor(API_VarDataGetNumber(ActorID,1,12007)/10000) * -1 + 1
			local QLLLvCNSJ1 = QLLLvCNSJ2 * 10 +90
		if API_ActorGetGoodsNum(ActorID,83524) >= QLLLvCNSJ1 then
		  if API_ActorRemoveGoods(ActorID,83524,QLLLvCNSJ1,"")  then  
				API_VarDataSetNumber(ActorID,1,12007,QLLLvCNSJ)                  
				QLLStatusID = 2138000 + QLLLvCNSJ2
				API_ActorAddStatus(ActorID,QLLStatusID,-1)             
			API_ActorBroadcastMsg(-1,17,'['..API_GetActorName(ActorID)..']将麒麟守护升级到['..QLLLvCNSJ..']级')			
			API_Trace('['..API_GetActorName(ActorID)..']将麒麟守护升级到['..QLLLvCNSJ..']级')				
				API_ResponseWrite('<text>升级成功！</text>')
				ShengShou_Buffcallback()
      API_ResponseWrite('<br><br><br><br><br><a href="SuperSs?1=15">还想升级麒麟守护等级</a><br>')		
      API_ResponseWrite('<br><a href="SuperSs?1=2">返回圣兽守护</a>')	  
      API_ResponseWrite('<br><br><a>确定</a>')
						if QLLLvCNSJ2 <= 20 then              
							--API_ActorAddStatus(ActorID,1148001,-1)
						else
							if QLLLvCNSJ2 <= 40 then
								--API_ActorAddStatus(ActorID,1148002,-1)
							else
								if QLLLvCNSJ2 <= 60 then
									--API_ActorAddStatus(ActorID,1148003,-1)
								else
									if QLLLvCNSJ2 <= 80 then
										--API_ActorAddStatus(ActorID,1148004,-1)
									else
										--API_ActorAddStatus(ActorID,1148005,-1)
									end
								end
							end
						end
		  else
			API_ResponseWrite('<text>升级失败，请联系黑夜。</text>')
			API_ResponseWrite('<br><br><a>确定</a>')
		  end
		else
		  API_ResponseWrite('<text>您的所需的物品数量不够，升级麒麟等级失败</text>')
		  API_ResponseWrite('<br><br><a>确定</a>')
		end
	end
end

function ShengShou_Buffcallback(ActorID)
local ActorID = ActorID or API_RequestGetActorID()
if ActorID == nil or ActorID <= 0 then return end
local QLLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12001) - math.floor(API_VarDataGetNumber(ActorID,1,12001)/10000) * -1 + 1
QLStatusID = 2134000 + QLLvCNSJ2
API_ActorAddStatus(ActorID,QLStatusID,-1)                  
local BHLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12002) - math.floor(API_VarDataGetNumber(ActorID,1,12002)/10000) * -1 + 1
BHStatusID = 2135000 + BHLvCNSJ2
API_ActorAddStatus(ActorID,BHStatusID,-1)                            
local ZQLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12003) - math.floor(API_VarDataGetNumber(ActorID,1,12003)/10000) * -1 + 1
ZQStatusID = 2136000 + ZQLvCNSJ2
API_ActorAddStatus(ActorID,ZQStatusID,-1)                           
local XWLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12006) - math.floor(API_VarDataGetNumber(ActorID,1,12006)/10000) * -1 + 1
XWStatusID = 2137000 + XWLvCNSJ2
API_ActorAddStatus(ActorID,XWStatusID,-1)                             
local QLLLvCNSJ2 = API_VarDataGetNumber(ActorID,1,12007) - math.floor(API_VarDataGetNumber(ActorID,1,12007)/10000) * -1 + 1
QLLStatusID = 2138000 + QLLLvCNSJ2
API_ActorAddStatus(ActorID,QLLStatusID,-1)             
end

local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'ShengShou_Buffcallback' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'ShengShou_Buffcallback') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'ShengShou_Buffcallback' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'ShengShou_Buffcallback') 
end 