local TableName = {}
local wtChat = nil
local valuedText = common.CreateValuedText()

function LogToChat(text)
	if not wtChat then 
		wtChat = stateMainForm:GetChildUnchecked("ChatLog", false)
		wtChat = wtChat:GetChildUnchecked("Container", true)
		local formatVT = "<html fontname='AllodsFantasy' fontsize='14' shadow='1'><rs class='color'><r name='addon'/><r name='text'/></rs></html>"
		valuedText:SetFormat(userMods.ToWString(formatVT))
	end
	if wtChat and wtChat.PushFrontValuedText then
		if not common.IsWString(text) then text = userMods.ToWString(text) end
		valuedText:ClearValues()
		valuedText:SetClassVal( "color", "LogColorGreen" )
		valuedText:SetVal( "text", text )
		wtChat:PushFrontValuedText( valuedText )
	end
end
----------------------------------------------------------------------------------------------
-- ADDON GUI
----------------------------------------------------------------------------------------------
--Main Window
----------------------------------------------------------------------------------------------
local wtMainPanel = nil
local wtMainPanel =  mainForm:GetChildChecked( "MainPanel", false )
wtMainPanel:Show(false)
local p = wtMainPanel:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER 
		p.alignY = WIDGET_ALIGN_CENTER
		p.sizeX = 500
		p.sizeY = 500
		wtMainPanel:SetPlacementPlain(p)	
local Header = wtMainPanel:GetChildChecked( "Header", false )
Header:SetVal("name", GTL('GBEHeader'))
Header:SetClassVal("class", "tip_yellow" )
local CloseBut = wtMainPanel:GetChildChecked( "ButtonCornerCross", false )
local p = CloseBut:GetPlacementPlain()
		p.alignY = WIDGET_ALIGN_LOW 
		p.posY = 20 
		CloseBut:SetPlacementPlain(p)
wtMainPanel:SetClipContent( false )
---------------------------------------------------------------------------------------------
local wtLeft = wtMainPanel:GetChildChecked( "ListPanelButtonLeft", false )
local p = wtLeft:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 25
		p.sizeX = 30
		p.sizeY = 30
		p.posY = -136
		wtLeft:SetPlacementPlain(p)	
wtLeft:SetPriority( 500 )
local wtRight = wtMainPanel:GetChildChecked( "ListPanelButtonRight", false )
local p = wtRight:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 185
		p.sizeX = 30
		p.sizeY = 30
		p.posY = -136
		wtRight:SetPlacementPlain(p)	
wtRight:SetPriority( 500 )
----------------------------------------------------------------------------------------------
local wtButton = wtMainPanel:GetChildChecked( "Button", false )
wtButton:Enable( false )
wtButton:SetVal("button_label", userMods.ToWString(GTL('Button')) )
local p = wtButton:GetPlacementPlain()
		p.posX = 100
		wtButton:SetPlacementPlain(p)	
local wtCheckBox =  wtMainPanel:GetChildChecked( "CheckBox", false )
local p = wtCheckBox:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW
		p.posX = 30 
		p.alignY = WIDGET_ALIGN_LOW
		p.posY = 445 
		wtCheckBox:SetPlacementPlain(p)
wtCheckBox:Show(true)
----------------------------------------------------------------------------------------------
local wtGold = wtMainPanel:GetChildChecked( "PanelGold", false )
local p = wtGold:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 220
		p.posY = 105
		wtGold:SetPlacementPlain(p)	
wtGold:SetPriority( 500 )
wtGold:Show(true)
----------------------------------------------------------------------------------------------
local wtEditLine = wtMainPanel:GetChildChecked( "EditLineBG", false )
local wtEditZone = wtMainPanel:GetChildChecked( "EditLineBG", false ):GetChildChecked( "EditLine", false )
local p = wtEditLine:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 25
		p.sizeX = 190
		p.sizeY = 50
		p.posY = 60 
		wtEditLine:SetPlacementPlain(p)
local Text = wtMainPanel:GetChildChecked( "Text", false )
local desc = Text:GetWidgetDesc()
local wtText = mainForm:CreateWidgetByDesc( desc )
wtMainPanel:AddChild( wtText )
local p = wtText:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 230
		p.sizeX = 200
		p.sizeY = 50
		p.posY = 65
		wtText:SetPlacementPlain(p)		
wtText:SetVal("name", GTL('Comment') )
wtText:SetClassVal("class", "tip_white" )	
wtEditLine:Show(true)
wtEditZone:Show(true)
----------------------------------------------------------------------------------------------
local wtEditLinen = wtMainPanel:GetChildChecked( "EditLineBGn", false )
local wtEditZonen = wtMainPanel:GetChildChecked( "EditLineBGn", false ):GetChildChecked( "EditLinen", false )
local p = wtEditLinen:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 25
		p.sizeX = 180
		p.sizeY = 50
		p.posY = 100 
		wtEditLinen:SetPlacementPlain(p)
local p = wtEditZonen:GetPlacementPlain()
		p.posX = 35
		p.sizeX = 140
		p.sizeY = 30
		wtEditZonen:SetPlacementPlain(p)
local desc2text = Text:GetWidgetDesc()
local wtText2 = mainForm:CreateWidgetByDesc( desc2text )
wtMainPanel:AddChild( wtText2 )
local p = wtText2:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 250
		p.sizeX = 200
		p.sizeY = 50
		p.posY = 105
		wtText2:SetPlacementPlain(p)
wtEditZonen:SetText(userMods.ToWString("0"))
wtText2:SetVal("name", GTL('Size') )
wtText2:SetClassVal("class", "tip_white" )		
----------------------------------------------------------------------------------------------
local wtPanelCheck = wtMainPanel:GetChildChecked( "PanelCheck", false )
local p = wtPanelCheck:GetPlacementPlain()
		p.posX = -85
		p.sizeX = 300
		p.sizeY = 135
		p.posY = 290
		wtPanelCheck:SetPlacementPlain(p)	
wtPanelCheck:SetPriority( 50000 )
wtPanelCheck:Show(false)
local desc = Text:GetWidgetDesc()
local wtCorrectHeader = mainForm:CreateWidgetByDesc( desc )
local wtEmptyComment = mainForm:CreateWidgetByDesc( desc )
local wtEmptyBalance = mainForm:CreateWidgetByDesc( desc )
local wtEmptyList = mainForm:CreateWidgetByDesc( desc )
wtPanelCheck:AddChild( wtCorrectHeader )
local p = wtCorrectHeader:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER 
		p.posX = 0
		p.sizeX = 250
		p.sizeY = 30
		p.posY = 20
		wtCorrectHeader:SetPlacementPlain(p)
wtCorrectHeader:SetVal("name", GTL('CheckCorrect') )
wtCorrectHeader:SetClassVal("class", "tip_yellow" )
wtPanelCheck:AddChild( wtEmptyComment )
local p = wtEmptyComment:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER 
		p.posX = 0
		p.sizeX = 250
		p.sizeY = 30
		p.posY = 50
		wtEmptyComment:SetPlacementPlain(p)
wtEmptyComment:SetVal("name", GTL('ÑheckComm') )
wtEmptyComment:SetClassVal("class", "tip_red" )
wtPanelCheck:AddChild( wtEmptyComment )
local p = wtEmptyBalance:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER 
		p.posX = 0
		p.sizeX = 250
		p.sizeY = 30
		p.posY = 70
		wtEmptyBalance:SetPlacementPlain(p)
wtEmptyBalance:SetVal("name", GTL('ÑheckSize') )
wtEmptyBalance:SetClassVal("class", "tip_red" )
wtPanelCheck:AddChild( wtEmptyBalance )
local p = wtEmptyList:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER 
		p.posX = 0
		p.sizeX = 250
		p.sizeY = 30
		p.posY = 90
		wtEmptyList:SetPlacementPlain(p)
wtEmptyList:SetVal("name", GTL('ÑheckMember') )
wtEmptyList:SetClassVal("class", "tip_red" )
wtPanelCheck:AddChild( wtEmptyList )
---------------------------------------------------------------------------------------------
local wtEditBox = wtMainPanel:GetChildChecked( "EditBoxBG", false )
local wtEditZoneBox = wtMainPanel:GetChildChecked( "EditBoxBG", false ):GetChildChecked( "EditBox", false )
local p = wtEditBox:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.posX = 25
		p.sizeX = 285
		p.sizeY = 230
		p.posY = 175 
		wtEditBox:SetPlacementPlain(p)
local p = wtEditZoneBox:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW 
		p.sizeX = 260
		wtEditZoneBox:SetPlacementPlain(p)
wtEditZoneBox:SetMaxSize( 2100 )
----------------------------------------------------------------------------------------------
local wtText3 = mainForm:CreateWidgetByDesc( Text:GetWidgetDesc() )
wtMainPanel:AddChild( wtText3 )
local p = wtText3:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_CENTER
		p.posX = -70
		p.sizeX = 220
		p.sizeY = 50
		p.posY = 150
		wtText3:SetPlacementPlain(p)	
wtText3:SetVal("name", GTL('Members') )
wtText3:SetClassVal("class", "tip_white" )		
----------------------------------------------------------------------------------------------
local wtText4 = mainForm:CreateWidgetByDesc( Text:GetWidgetDesc() )
wtMainPanel:AddChild( wtText4 )
local p = wtText4:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW
		p.posX = 55 
		p.sizeX = 220
		p.alignY = WIDGET_ALIGN_LOW
		p.posY = 445 
		p.sizeY = 50
		wtText4:SetPlacementPlain(p)	
wtText4:SetVal("name", GTL('Accept') )
wtText4:SetClassVal("class", "tip_white" )	
----------------------------------------------------------------------------------------------
local wtGPanel = mainForm:CreateWidgetByDesc( wtPanelCheck:GetWidgetDesc() )
wtGPanel:Show(true)
wtMainPanel:AddChild(wtGPanel)
local p = wtGPanel:GetPlacementPlain()
		p.alignX = WIDGET_ALIGN_LOW
		p.posX = 300 
		p.sizeX = 220
		p.alignY = WIDGET_ALIGN_LOW
		p.posY = 130 
		p.sizeY = 290
		wtGPanel:SetPlacementPlain(p)	
wtGPanel:SetBackgroundColor( {  r = 0; g = 0; b = 1; a = 0.0 } )
----------------------------------------------------------------------------------------------
local wtCheckRank = mainForm:GetChildChecked( "CheckRank", false )

local ranktable = {}
local ranks = {0,1,2,3,4,5,6,7,8,9}

function GetRanks()
if guild.IsExist() then
ranktable = nil ranktable = {}
for _, v in pairs(ranks) do 
local rankInfo = guild.GetRankInfo(v)
local wtNewText = mainForm:CreateWidgetByDesc( Text:GetWidgetDesc() )
wtNewText:Show(true)
wtGPanel:AddChild( wtNewText )
local wtCheck = mainForm:CreateWidgetByDesc( wtCheckRank:GetWidgetDesc() )
local p = wtCheck:GetPlacementPlain()
		p.posX = 30
		wtCheck:SetPlacementPlain(p)	
wtCheck:Show(true)
wtGPanel:AddChild( wtCheck )
table.insert(ranktable, {wtCheck=wtCheck, wtNewText=wtNewText})
wtNewText:SetVal("name", rankInfo.name)
wtNewText:SetClassVal("class", "tip_white" )
	UpdateList()
		end
	end
end

function UpdateList()
	local pos = 1
	for k,v in pairs(ranktable) do
		local textpp = ranktable[k].wtNewText:GetPlacementPlain()
		local checkpp = ranktable[k].wtCheck:GetPlacementPlain()
		textpp.posY = pos * 25
		checkpp.posY = pos * 25
		ranktable[k].wtNewText:SetPlacementPlain(textpp)
		ranktable[k].wtCheck:SetPlacementPlain(checkpp)
		pos = pos + 1
	end
	local pp = wtGPanel:GetPlacementPlain()
	pp.sizeY = pos * 25
	wtGPanel:SetPlacementPlain(pp)	
end

function DestroyWT()
for k,v in pairs(ranktable) do
	ranktable[k].wtNewText:DestroyWidget()
	ranktable[k].wtCheck:DestroyWidget()
	end
end

function SelectCB(params)
local id = params.sender
for id,v in pairs(ranktable) do
local wv = params.widget:GetVariant() == 1
if ranktable[id].wtCheck:GetVariant()==0 then 
	params.widget:SetVariant( (not wv) and 1 or 0 )
	return
elseif ranktable[id].wtCheck:GetVariant()==1 then 
		ranktable[id].wtCheck:SetVariant(0) 
	return
		end
	end
end
----------------------------------------------------------------------------------------------
function LeftClick(params)
local result = 0
local num = wtEditZonen:GetString()
if common.GetBitAnd( params.kbFlags, KBF_SHIFT ) == 0 then
result = num-1
end
if common.GetBitAnd( params.kbFlags, KBF_SHIFT ) ~= 0 then
result = num-SHIFT
end
if common.GetBitAnd( params.kbFlags, KBF_CTRL  ) ~= 0 then
result = num-CTRL
end
if string.len(result)>12 then 
wtLeft:Enable(false)
else 
if string.len(result)<=12 then
wtLeft:Enable(true)
wtRight:Enable(true)
wtEditZonen:SetText(userMods.ToWString(tostring(result)))
		end
	end
end

function RightClick(params)
local result = 0
local num = wtEditZonen:GetString()
if common.GetBitAnd( params.kbFlags, KBF_SHIFT ) == 0 then
result = num+1
end
if common.GetBitAnd( params.kbFlags, KBF_SHIFT ) ~= 0 then
result = num+SHIFT
end
if common.GetBitAnd( params.kbFlags, KBF_CTRL  ) ~= 0 then
result = num+CTRL
end
if string.len(result)>12 then 
wtRight:Enable(false) 
else 
if string.len(result)<=12 then
wtRight:Enable(true)
wtLeft:Enable(true)
wtEditZonen:SetText(userMods.ToWString(tostring(result)))
		end
	end
end

function GetNil()
local lenn = userMods.ToWString(wtEditZonen:GetString())
local isEmpty = common.IsEmptyWString( lenn )
if isEmpty then
wtEditZonen:SetText(userMods.ToWString("0"))
	end
end

function CheckCB()
local isZero
local isEmptyComm = common.IsEmptyWString(userMods.ToWString(wtEditZone:GetString()))
local isEmptyBox = common.IsEmptyWString(wtEditZoneBox:GetText())
if tonumber(wtEditZonen:GetString()) == 0 then
isZero = true else isZero = false end
if isZero and isEmptyComm and isEmptyBox then -- 1 1 1
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 135
		wtPanelCheck:SetPlacementPlain(p)	
local p = wtEmptyList:GetPlacementPlain()
		p.posY = 90
		wtEmptyList:SetPlacementPlain(p)
local p = wtEmptyBalance:GetPlacementPlain()
		p.posY = 70
		wtEmptyBalance:SetPlacementPlain(p)
local p = wtEmptyComment:GetPlacementPlain()
		p.posY = 50
		wtEmptyComment:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(true)
wtEmptyList:Show(true)
wtEmptyBalance:Show(true)
elseif not isZero and isEmptyComm and isEmptyBox then -- 0 1 1 
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 115
		wtPanelCheck:SetPlacementPlain(p)	
local p = wtEmptyList:GetPlacementPlain()
		p.posY = 70
		wtEmptyList:SetPlacementPlain(p)
local p = wtEmptyComment:GetPlacementPlain()
		p.posY = 50
		wtEmptyComment:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(true)
wtEmptyList:Show(true)
wtEmptyBalance:Show(false)
elseif not isZero and not isEmptyComm and isEmptyBox then -- 0 0 1
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 85
		wtPanelCheck:SetPlacementPlain(p)	
local p = wtEmptyList:GetPlacementPlain()
		p.posY = 45
		wtEmptyList:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(false)
wtEmptyList:Show(true)
wtEmptyBalance:Show(false)
elseif not isZero and isEmptyComm and not isEmptyBox then -- 0 1 0
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 85
		wtPanelCheck:SetPlacementPlain(p)
local p = wtEmptyComment:GetPlacementPlain()
		p.posY = 45
		wtEmptyComment:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(true)
wtEmptyList:Show(false)
wtEmptyBalance:Show(false)
elseif isZero and not isEmptyComm and isEmptyBox then -- 1 0 1
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 115
		wtPanelCheck:SetPlacementPlain(p)
local p = wtEmptyList:GetPlacementPlain()
		p.posY = 65
		wtEmptyList:SetPlacementPlain(p)
local p = wtEmptyBalance:GetPlacementPlain()
		p.posY = 45
		wtEmptyBalance:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(false)
wtEmptyList:Show(true)
wtEmptyBalance:Show(true)
elseif isZero and not isEmptyComm and not isEmptyBox then -- 1 0 0
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 85
		wtPanelCheck:SetPlacementPlain(p)
wtCheckBox:Enable(false)
wtEmptyComment:Show(false)
wtEmptyList:Show(false)
wtEmptyBalance:Show(true)
elseif not isZero and not isEmptyComm and not isEmptyBox then -- 0 0 0
local p = wtPanelCheck:GetPlacementPlain()
		p.sizeY = 65
		wtPanelCheck:SetPlacementPlain(p)
wtCheckBox:Enable(true)
wtEmptyBalance:Show(false)
wtEmptyComment:Show(false)
wtEmptyList:Show(false)
end

end

function ChangeEditlne()
local lenn = wtEditZonen:GetString()
if string.len(lenn)>12 then
wtRight:Enable(false)
elseif string.len(lenn)<=12 then
wtRight:Enable(true)
wtLeft:Enable(true)
	end
end

function CloseSettings()
wtMainPanel:Show(false)
ResetWindow()
end 

function ReactionCBox()
if wtCheckBox:GetVariant()==0 then 
	wtButton:Enable( true )
	wtRight:Enable( false )
	wtLeft:Enable( false )
	wtEditZone:SetTransparentInput( true )
	wtEditZonen:SetTransparentInput( true )
	wtEditBox:SetTransparentInput( true )
	wtCheckBox:SetVariant(1)
	else 
    wtButton:Enable( false )
	wtRight:Enable( true )
	wtLeft:Enable( true )
	wtEditZone:SetTransparentInput( false )
	wtEditZonen:SetTransparentInput( false )
	wtEditBox:SetTransparentInput( false )
	wtCheckBox:SetVariant(0)
	end
end

function GetTable()
TableName = nil TableName = {}
local name = userMods.FromWString(common.EscapeWString(wtEditZoneBox:GetText())) 
for ind in string.gmatch(name, "[^\r\n]+") do 
TableName[ind] = true 
return TableName
	end
end

function ResetWindow()
for id,v in pairs(ranktable) do
	ranktable[id].wtCheck:SetVariant(1) 
	end	
	wtEditZone:SetText(common.GetEmptyWString())
	wtEditZonen:SetText(userMods.ToWString("0"))
	wtEditZoneBox:SetText(common.GetEmptyWString())
	wtButton:Enable( false )
	wtLeft:Enable( true )
	wtRight:Enable( true )
	wtCheckBox:SetVariant(0)
	wtEditZone:SetTransparentInput( false )
	wtEditZonen:SetTransparentInput( false )
	wtEditBox:SetTransparentInput( false )
	wtEditZone:SetFocus( false )
	wtEditZonen:SetFocus( false )
	wtEditZoneBox:SetFocus( false )	
end

function EditBalance()
local Comment = wtEditZone:GetString()
local Size = tostring(wtEditZonen:GetString())
	TableName = nil TableName = {}
	local name = userMods.FromWString(common.EscapeWString(wtEditZoneBox:GetText())) 
	for ind in string.gmatch(name, "[^\r\n]+%S") do
	TableName[ind] = true 
	end
	local GuildMembers = guild.GetMembers()
	for _, Member in pairs(GuildMembers) do
		if guild.GetMemberInfo then 
			Member = guild.GetMemberInfo( Member )
		end
		local GTM = userMods.FromWString(Member.name)
		if TableName[GTM] then 
		for k,v in pairs(ranktable) do
		local checkst = ranktable[k].wtCheck:GetVariant()
		local textst = common.ExtractWStringFromValuedText(ranktable[k].wtNewText:GetValuedText())
		if checkst > 0 then
		local rankname = guild.GetRankInfo((guild.GetRank(Member.id))).name
		local result = common.CompareWString(textst, rankname)
		if result == 0 then
		guild.CorrectMemberBalance( Member.id, Size*10000, userMods.ToWString(Comment) )
		LogToChat(GTL('Message'))
					end
				end
			end
		end
	end
	ResetWindow()
end

function VisibleStatus(params)
if params.visible then
	if not wtMainPanel:IsVisible() then 
		wtMainPanel:Show(true)
		GetRanks()
		ResetWindow()
	elseif wtMainPanel:IsVisible() then 
		wtMainPanel:Show(false)
		ResetWindow()
		DestroyWT()
		end
	end
end

function ShowMenu(params)
local text = userMods.FromWString(params.text)
	if text == "/gbe" then 
		if not wtMainPanel:IsVisible() then 
		wtMainPanel:Show(true)
		GetRanks()
		ResetWindow()
		elseif wtMainPanel:IsVisible() then 
		wtMainPanel:Show(false)
		ResetWindow()
		end 
	end
end

function ReactionEscEditLine() --EditLineEscape
wtEditZone:SetFocus( false )
wtEditZonen:SetFocus( false )
end 

function ReactionEscEditBox() --EditBoxEscape
wtEditZoneBox:SetFocus( false )
end 

function ReactionOnPointing(params)
if params.active then
wtPanelCheck:Show(true)
else
wtPanelCheck:Show(false)
	end
end

function Init()
	CheckCB()
	common.RegisterEventHandler( VisibleStatus, "GBE_VISIBLE" )
	common.RegisterEventHandler( ShowMenu, "EVENT_UNKNOWN_SLASH_COMMAND" )
	common.RegisterReactionHandler( EditBalance, "ButtonEdit" )
	common.RegisterReactionHandler( CloseSettings, "mouse_left_click" )
	common.RegisterReactionHandler( ReactionCBox, "checkbox" )
	common.RegisterReactionHandler( SelectCB, "checkrank" )
	common.RegisterReactionHandler( ReactionEscEditLine, "EditLineEscape" )
	common.RegisterReactionHandler( ChangeEditlne, "Change" )
	common.RegisterReactionHandler( GetNil, "Change" )
	common.RegisterReactionHandler( CheckCB, "Change" )
	common.RegisterReactionHandler( CheckCB, "ChangeBox" )
	common.RegisterReactionHandler( CheckCB, "ChangeCom" )
	common.RegisterReactionHandler( CheckCB, "list_leftbutton_pressed" )
	common.RegisterReactionHandler( CheckCB, "list_rightbutton_pressed" )
	common.RegisterReactionHandler( ReactionEscEditBox, "EditBoxEscape" )
	common.RegisterReactionHandler( LeftClick, "list_leftbutton_pressed" )
	common.RegisterReactionHandler( RightClick, "list_rightbutton_pressed" )
	common.RegisterReactionHandler( ReactionOnPointing, "mouse_over" )
	DnD.Init(wtMainPanel,wtMainPanel,true)
end 

if (avatar.IsExist()) then Init()
else common.RegisterEventHandler(Init, "EVENT_AVATAR_CREATED")	
end

