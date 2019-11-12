ClassicGuildManager = LibStub('AceAddon-3.0'):NewAddon('ClassicGuildManager', 'AceConsole-3.0')
AceConsole = LibStub('AceConsole-3.0', true)
AceSerializer = LibStub('AceSerializer-3.0', true)

function ClassicGuildManager:OnInitialize()
  ClassicGuildManager:RegisterChatCommand('cgm', 'HandleChatCommand');
end

function ClassicGuildManager:HandleChatCommand(input)
  ClassicGuildManager:DisplayExportString(exportString)
end

function ClassicGuildManager:GetCharacterData()
  local name = UnitName('player')
  return {
    realm = GetRealmName(),
    name = name,
    race = UnitRace('player'),
    class = UnitClass('player'),
    guildName = GetGuildInfo('player'),
    sex = UnitSex('player'),
    stuff = ClassicGuildManager:GetPlayerStuff()
  }
end

function ClassicGuildManager:GetPlayerStuff()
  return {
    head = GetInventoryItemID("player", GetInventorySlotInfo("HeadSlot")),
    neck = GetInventoryItemID("player", GetInventorySlotInfo("NeckSlot")),
    shoulder = GetInventoryItemID("player", GetInventorySlotInfo("ShoulderSlot")),
    back = GetInventoryItemID("player", GetInventorySlotInfo("BackSlot")),
    chest = GetInventoryItemID("player", GetInventorySlotInfo("ChestSlot")),
    shirt = GetInventoryItemID("player", GetInventorySlotInfo("ShirtSlot")),
    tabard = GetInventoryItemID("player", GetInventorySlotInfo("TabardSlot")),
    wrist = GetInventoryItemID("player", GetInventorySlotInfo("WristSlot")),
    hands = GetInventoryItemID("player", GetInventorySlotInfo("HandsSlot")),
    waist = GetInventoryItemID("player", GetInventorySlotInfo("WaistSlot")),
    legs = GetInventoryItemID("player", GetInventorySlotInfo("LegsSlot")),
    feet = GetInventoryItemID("player", GetInventorySlotInfo("FeetSlot")),
    finger0 = GetInventoryItemID("player", GetInventorySlotInfo("Finger0Slot")),
    finger1 = GetInventoryItemID("player", GetInventorySlotInfo("Finger1Slot")),
    trinket0 = GetInventoryItemID("player", GetInventorySlotInfo("Trinket0Slot")),
    trinket1 = GetInventoryItemID("player", GetInventorySlotInfo("Trinket1Slot")),
    mainHand = GetInventoryItemID("player", GetInventorySlotInfo("MainHandSlot")),
    secondaryHand = GetInventoryItemID("player", GetInventorySlotInfo("SecondaryHandSlot")),
    bag0 = GetInventoryItemID("player", GetInventorySlotInfo("Bag0Slot")),
    bag1 = GetInventoryItemID("player", GetInventorySlotInfo("Bag1Slot")),
    bag2 = GetInventoryItemID("player", GetInventorySlotInfo("Bag2Slot")),
    bag3 = GetInventoryItemID("player", GetInventorySlotInfo("Bag3Slot"))
  }
end

function ClassicGuildManager:GetMemberData(memberIndex)
  local name, rank, rankIndex, level, class, zone, note, officernote = GetGuildRosterInfo(memberIndex)
  return {
    name = name,
    rank = rank,
    rankIndex = rankIndex,
    level = level,
    class = class,
    zone = zone,
    note = note,
    officernote = officernote
  }
end

function ClassicGuildManager:GetGuidMembers()
  local count = GetNumGuildMembers()
  local members = {}

  for i=1, count do
    members[i] = ClassicGuildManager:GetMemberData(i)
  end
  
  return members
end

function ClassicGuildManager:DisplayExportString(exportString)
  local charData = ClassicGuildManager:GetCharacterData()
  local guildData = ClassicGuildManager:GetGuidMembers()

  local data =  {
    character = charData,
    guild = guildData
  }

  local serialized = LibAceSerializer:Serialize(data)

  CgmFrame:Show()
  CgmFrameScroll:Show()
  CgmFrameScrollText:Show()
  CgmFrameScrollText:SetText("test")
  CgmFrameScrollText:HighlightText()
  
  CgmFrameButton:SetScript('OnClick', function(self)
    CgmFrame:Hide();
  end);

  AceConsole:Print("TEST");
end
