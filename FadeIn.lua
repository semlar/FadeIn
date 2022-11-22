-- todo: add text for zone information (difficulty, etc)
local f = CreateFrame('frame')
f:Hide()
f:SetAllPoints()
f:SetFrameStrata('FULLSCREEN_DIALOG')

local tx = f:CreateTexture()
tx:SetAllPoints()
tx:SetColorTexture(0, 0, 0)

local frames, timeSince = 0, 0
f:SetScript('OnUpdate', function(self, elapsed)
	frames = frames + 1
	
	if frames >= 4 then
		timeSince = timeSince + elapsed
	end
	
	if timeSince >= 1 then
		return self:Hide()
	end
	
	self:SetAlpha(1 - timeSince)
end)

f:SetScript('OnEvent', function(self)
	frames, timeSince = 0, 0
	self:Show()
end)
f:RegisterEvent('PLAYER_ENTERING_WORLD')
