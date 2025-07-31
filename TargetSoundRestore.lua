local lastTargetName

local sounds = {
    lost = "INTERFACESOUND_LOSTTARGETUNIT",
    hostile = "GAMETARGETHOSTILEUNIT",
    friendly = "GAMETARGETFRIENDLYUNIT",
    neutral = "GAMETARGETNEUTRALUNIT",
}

local function playTargetSound()
    if not UnitExists("target") then
        PlaySound(sounds.lost)
    elseif UnitIsEnemy("player", "target") then
        PlaySound(sounds.hostile)
    elseif UnitIsFriend("player", "target") then
        PlaySound(sounds.friendly)
    else
        PlaySound(sounds.neutral)
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:SetScript("OnEvent", function()
    local name = UnitName("target")
    if name ~= lastTargetName then
        lastTargetName = name
        playTargetSound()
    end
end)