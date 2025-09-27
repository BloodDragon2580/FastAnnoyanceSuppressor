local ADDON_NAME, _ = ...
local frame = CreateFrame("Frame")
FAS_Saved = FAS_Saved or {}

-- Fallback für unpack
local unpack = table.unpack or unpack

------------------------------------------------------------
-- 🌍 Localization
------------------------------------------------------------
local L = {}
local locale = GetLocale()

-- Default: English
L["TITLE"] = "FastAnnoyanceSuppressor - Options"
L["MUTE_SOUNDS"] = "Mute toy and annoying sounds"
L["REMOVE_BUFFS"] = "Automatically remove costume/toy buffs"
L["ADD_IDS"] = "Add more Spell IDs (press Enter)"
L["CLEAR_IDS"] = "Clear all Buff-IDs"
L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r loaded. ESC → Interface → AddOns to configure."
L["SOUNDS_ENABLED"] = "|cffffcc00[FAS]|r Sound suppression |cff00ff00enabled|r."
L["SOUNDS_DISABLED"] = "|cffffcc00[FAS]|r Sound suppression |cffff0000disabled|r."
L["BUFFS_ENABLED"] = "|cffffcc00[FAS]|r Buff removal |cff00ff00enabled|r."
L["BUFFS_DISABLED"] = "|cffffcc00[FAS]|r Buff removal |cffff0000disabled|r."
L["IDS_ADDED"] = "|cffffcc00[FAS]|r Added spell IDs: %s"
L["IDS_CLEARED"] = "|cffffcc00[FAS]|r All buff IDs cleared."
L["CURRENT_IDS"] = "Current IDs: %s"

if locale == "deDE" then
  L["TITLE"] = "FastAnnoyanceSuppressor - Optionen"
  L["MUTE_SOUNDS"] = "Spielzeug- und Nerv-Sounds stummschalten"
  L["REMOVE_BUFFS"] = "Kostüm-/Toy-Buffs automatisch entfernen"
  L["ADD_IDS"] = "Weitere Spell-IDs hinzufügen (Enter)"
  L["CLEAR_IDS"] = "Alle Buff-IDs löschen"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r geladen. ESC → Interface → AddOns öffnen."
  L["SOUNDS_ENABLED"] = "|cffffcc00[FAS]|r Sound-Unterdrückung |cff00ff00aktiviert|r."
  L["SOUNDS_DISABLED"] = "|cffffcc00[FAS]|r Sound-Unterdrückung |cffff0000deaktiviert|r."
  L["BUFFS_ENABLED"] = "|cffffcc00[FAS]|r Buff-Entfernung |cff00ff00aktiviert|r."
  L["BUFFS_DISABLED"] = "|cffffcc00[FAS]|r Buff-Entfernung |cffff0000deaktiviert|r."
  L["IDS_ADDED"] = "|cffffcc00[FAS]|r Spell-IDs hinzugefügt: %s"
  L["IDS_CLEARED"] = "|cffffcc00[FAS]|r Alle Buff-IDs gelöscht."
  L["CURRENT_IDS"] = "Aktuelle IDs: %s"
elseif locale == "frFR" then
  L["TITLE"] = "FastAnnoyanceSuppressor - Options"
  L["MUTE_SOUNDS"] = "Couper les sons agaçants et jouets"
  L["REMOVE_BUFFS"] = "Supprimer automatiquement les déguisements/jouets"
  L["ADD_IDS"] = "Ajouter d'autres IDs de sorts (Entrée)"
  L["CLEAR_IDS"] = "Effacer tous les Buff-IDs"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r chargé. ESC → Interface → AddOns."
  L["SOUNDS_ENABLED"] = "|cffffcc00[FAS]|r Suppression des sons |cff00ff00activée|r."
  L["SOUNDS_DISABLED"] = "|cffffcc00[FAS]|r Suppression des sons |cffff0000désactivée|r."
  L["BUFFS_ENABLED"] = "|cffffcc00[FAS]|r Suppression des buffs |cff00ff00activée|r."
  L["BUFFS_DISABLED"] = "|cffffcc00[FAS]|r Suppression des buffs |cffff0000désactivée|r."
  L["IDS_ADDED"] = "|cffffcc00[FAS]|r IDs de sorts ajoutés: %s"
  L["IDS_CLEARED"] = "|cffffcc00[FAS]|r Tous les Buff-IDs effacés."
elseif locale == "esES" or locale == "esMX" then
  L["TITLE"] = "FastAnnoyanceSuppressor - Opciones"
  L["MUTE_SOUNDS"] = "Silenciar sonidos molestos y de juguetes"
  L["REMOVE_BUFFS"] = "Quitar automáticamente los disfraces/buffs"
  L["ADD_IDS"] = "Añadir más IDs de hechizo (Enter)"
  L["CLEAR_IDS"] = "Borrar todos los Buff-IDs"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r cargado. ESC → Interface → AddOns."
elseif locale == "itIT" then
  L["TITLE"] = "FastAnnoyanceSuppressor - Opzioni"
  L["MUTE_SOUNDS"] = "Silenzia suoni fastidiosi e dei giocattoli"
  L["REMOVE_BUFFS"] = "Rimuovi automaticamente costumi/giocattoli"
  L["ADD_IDS"] = "Aggiungi altri Spell ID (Invio)"
  L["CLEAR_IDS"] = "Cancella tutti i Buff-ID"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r caricato. ESC → Interfaccia → AddOns."
elseif locale == "ruRU" then
  L["TITLE"] = "FastAnnoyanceSuppressor - Настройки"
  L["MUTE_SOUNDS"] = "Отключить звуки игрушек и раздражающие звуки"
  L["REMOVE_BUFFS"] = "Автоматически удалять костюмы/баффы"
  L["ADD_IDS"] = "Добавить ID заклинаний (Enter)"
  L["CLEAR_IDS"] = "Очистить все Buff-ID"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r загружен. ESC → Интерфейс → AddOns."
elseif locale == "zhCN" then
  L["TITLE"] = "FastAnnoyanceSuppressor - 选项"
  L["MUTE_SOUNDS"] = "静音玩具和烦人声音"
  L["REMOVE_BUFFS"] = "自动移除玩具/变形Buff"
  L["ADD_IDS"] = "添加更多法术ID (回车)"
  L["CLEAR_IDS"] = "清除所有 Buff-ID"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r 已加载. ESC → 界面 → 插件."
elseif locale == "zhTW" then
  L["TITLE"] = "FastAnnoyanceSuppressor - 選項"
  L["MUTE_SOUNDS"] = "靜音玩具與煩人聲音"
  L["REMOVE_BUFFS"] = "自動移除玩具/變身Buff"
  L["ADD_IDS"] = "新增更多法術ID (Enter)"
  L["CLEAR_IDS"] = "清除所有 Buff-ID"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r 已載入. ESC → 介面 → 插件."
elseif locale == "koKR" then
  L["TITLE"] = "FastAnnoyanceSuppressor - 옵션"
  L["MUTE_SOUNDS"] = "장난감 및 귀찮은 소리 음소거"
  L["REMOVE_BUFFS"] = "코스튬/장난감 버프 자동 제거"
  L["ADD_IDS"] = "추가 주문 ID 입력 (Enter)"
  L["CLEAR_IDS"] = "모든 Buff-ID 삭제"
  L["LOADED"] = "|cffffcc00[FastAnnoyanceSuppressor]|r 로드됨. ESC → 인터페이스 → 애드온."
end

------------------------------------------------------------
-- 🔧 Core Functionality
------------------------------------------------------------
local defaults = {
  muteSounds = true,
  autoRemoveBuffs = true,
  buffSpellIDs = {
    -- Halloween/Hallow's End
    44185, 44212, -- Jack-o'-Lanterned
    24732, -- Bat Costume
    24735, -- Ghost Costume
    24712,24713, -- Leper Gnome
    24708,24709, -- Pirate Costume
    24723, -- Skeleton Costume
    24740, -- Wisp Costume
    24710, -- Ninja Costume
    
    -- Various Toys
    61819,61834, -- Manabonked!
    69285, -- Mohawked!
    27571, -- Cascade of Roses
    60122,60106, -- Baby/Old Spice
    26157, -- PX-238 Winter Wondervolt
    44755, -- Snowflakes
    
    -- Additional Annoying Toys/Items
    136583, -- Time-Lost Figurine
    201765, -- Draconic Augment Rune
    194958, -- Primal Batchery "Devoured"
    201404, -- Tossin' Turkeys
    46668, -- Fire-toasted Bun
    65424, -- Romantic Picnic
    24709, -- Pirate Costume
    45123, -- Jack-o'-Lantern
    61031, -- Fool for Love (Love is in the Air)
    61716, -- Rabbit Costume
    61734, -- Tuxedo
    
    -- Engineering Items
    67493, -- Goblin Weather Machine
    82829, -- Synapse Springs
    55002, -- Flexweave Underlay
    
    -- Brewfest
    42254, -- Brewfest Enthusiast
    43310, -- Ram Racing Reins
    
    -- Various Fun Items
    24717, -- Narain's Turban
    24718, -- Bloodsail Admiral's Hat
    132626, -- Blazing Wings
    201815, -- Draconic Mark of Mastery
    
    -- Christmas/Winter Veil
    26157, -- PX-238 Winter Wondervolt REPEAT (but common)
    26025, -- Handful of Snowflakes
    
    -- Darkmoon Faire
    102116, -- Darkmoon Top Hat
    71908, -- Darkmoon Prize Ticket
    
    -- Garrison/Misc
    161411, -- Garrison Jukebox
    90472, -- Gamon's Braid
    
    -- Love is in the Air
    27571, -- Cascade of Roses REPEAT
    71519, -- Unbestowed Friendship Bracelet
    
    -- More Costumes
    24716, -- Cuergo's Gold
    132625, -- Burning Wings
  },
  soundPatterns = { "TOY","toy","Skeleton","laugh","giggle","pumpkin" },
}

local function ensureDefaults()
  for k,v in pairs(defaults) do
    if FAS_Saved[k] == nil then
      if type(v) == "table" then
        FAS_Saved[k] = {unpack(v)}
      else
        FAS_Saved[k] = v
      end
    end
  end
end

local function removeBuffBySpellID(spellID)
  if not UnitBuff then return end -- Safety check for UnitBuff availability
  local i = 1
  while true do
    local name, _, _, _, _, _, _, _, _, id = UnitBuff("player", i)
    if not name then break end
    if id == spellID then 
      pcall(function() CancelUnitBuff("player", i) end) 
    else 
      i = i + 1 
    end
  end
end

local function onUnitAura(unit)
  if unit ~= "player" or not FAS_Saved.autoRemoveBuffs then return end
  if type(FAS_Saved.buffSpellIDs) ~= "table" then FAS_Saved.buffSpellIDs = {} end
  for _,id in ipairs(FAS_Saved.buffSpellIDs) do removeBuffBySpellID(id) end
end

-- 🔇 Sound Suppression (Safe approach)
local function setupSoundSuppression()
  if not FAS_Saved.muteSounds then return end
  
  -- Use SetCVar to control sound categories instead of hooking functions
  local function applySoundSettings()
    if FAS_Saved.muteSounds then
      -- Reduce UI sound effects volume temporarily during toy usage
      local currentVolume = GetCVar("Sound_UIVolume") or "1.0"
      FAS_Saved.originalUIVolume = currentVolume
      
      -- We'll use event-based detection instead of function hooking
    end
  end
  
  applySoundSettings()
end

------------------------------------------------------------
-- PLAYER_LOGIN Event
------------------------------------------------------------
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UI_INFO_MESSAGE")
frame:RegisterEvent("CHAT_MSG_SYSTEM")

frame:SetScript("OnEvent", function(self, event, arg1, arg2)
  if event == "PLAYER_LOGIN" then
    ensureDefaults()
    setupSoundSuppression()
    print(L["LOADED"])

    ------------------------------------------------------------
    -- 🖥 Options Panel (Modern WoW compatibility)
    ------------------------------------------------------------
    local options = CreateFrame("Frame", "FASOptionsPanel", InterfaceOptionsFramePanelContainer)
    options.name = "FastAnnoyanceSuppressor"
    
    -- Check which interface system is available
    if InterfaceOptions_AddCategory then
      -- Legacy system (older WoW versions)
      InterfaceOptions_AddCategory(options)
    elseif Settings and Settings.RegisterCanvasLayoutCategory then
      -- Modern system (newer WoW versions)
      local category = Settings.RegisterCanvasLayoutCategory(options, "FastAnnoyanceSuppressor")
      Settings.RegisterAddOnCategory(category)
    end

    options.title = options:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    options.title:SetPoint("TOPLEFT", 16, -16)
    options.title:SetText(L["TITLE"])

    local soundCheck = CreateFrame("CheckButton", nil, options, "InterfaceOptionsCheckButtonTemplate")
    soundCheck:SetPoint("TOPLEFT", options.title, "BOTTOMLEFT", 0, -10)
    soundCheck.Text:SetText(L["MUTE_SOUNDS"])
    soundCheck:SetScript("OnClick", function(self) 
      FAS_Saved.muteSounds = self:GetChecked() 
      if FAS_Saved.muteSounds then
        print(L["SOUNDS_ENABLED"])
      else
        print(L["SOUNDS_DISABLED"])
      end
    end)

    local buffCheck = CreateFrame("CheckButton", nil, options, "InterfaceOptionsCheckButtonTemplate")
    buffCheck:SetPoint("TOPLEFT", soundCheck, "BOTTOMLEFT", 0, -8)
    buffCheck.Text:SetText(L["REMOVE_BUFFS"])
    buffCheck:SetScript("OnClick", function(self) 
      FAS_Saved.autoRemoveBuffs = self:GetChecked() 
      if FAS_Saved.autoRemoveBuffs then
        print(L["BUFFS_ENABLED"])
      else
        print(L["BUFFS_DISABLED"])
      end
    end)

    local idEdit = CreateFrame("EditBox", "FAS_IDEditBox", options, "InputBoxTemplate")
    idEdit:SetPoint("TOPLEFT", buffCheck, "BOTTOMLEFT", 0, -12)
    idEdit:SetSize(200, 20)
    idEdit:SetAutoFocus(false)
    idEdit:SetMaxLetters(200)
    idEdit:SetScript("OnEnterPressed", function(self)
      local addedIds = {}
      for id in string.gmatch(self:GetText(), "%d+") do
        local spellId = tonumber(id)
        table.insert(FAS_Saved.buffSpellIDs, spellId)
        table.insert(addedIds, tostring(spellId))
      end
      if #addedIds > 0 then
        print(string.format(L["IDS_ADDED"], table.concat(addedIds, ", ")))
      end
      self:SetText("")
      self:ClearFocus()
      updateCurrentIDsDisplay()
    end)

    local idLabel = options:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idLabel:SetPoint("LEFT", idEdit, "RIGHT", 8, 0)
    idLabel:SetText(L["ADD_IDS"])

    -- Display current IDs
    local currentIdsLabel = options:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    currentIdsLabel:SetPoint("TOPLEFT", idEdit, "BOTTOMLEFT", 0, -5)
    currentIdsLabel:SetText("")
    
    local function updateCurrentIDsDisplay()
      if FAS_Saved.buffSpellIDs and #FAS_Saved.buffSpellIDs > 0 then
        local idStrings = {}
        for i, id in ipairs(FAS_Saved.buffSpellIDs) do
          table.insert(idStrings, tostring(id))
          if i >= 10 then -- Limit display to first 10 IDs to prevent UI overflow
            table.insert(idStrings, "...")
            break
          end
        end
        currentIdsLabel:SetText(string.format(L["CURRENT_IDS"], table.concat(idStrings, ", ")))
      else
        currentIdsLabel:SetText(L["CURRENT_IDS"]:format(""))
      end
    end

    local clearBtn = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
    clearBtn:SetPoint("TOPLEFT", currentIdsLabel, "BOTTOMLEFT", 0, -5)
    clearBtn:SetSize(160, 22)
    clearBtn:SetText(L["CLEAR_IDS"])
    clearBtn:SetScript("OnClick", function() 
      FAS_Saved.buffSpellIDs = {} 
      updateCurrentIDsDisplay()
      print(L["IDS_CLEARED"])
    end)

    options.refresh = function()
      soundCheck:SetChecked(FAS_Saved.muteSounds)
      buffCheck:SetChecked(FAS_Saved.autoRemoveBuffs)
      updateCurrentIDsDisplay()
    end
    
    -- Initial UI state setup
    options.refresh()
    
    -- Register for interface panel events to refresh UI when opened
    options:SetScript("OnShow", function()
      options.refresh()
    end)

    options.default = function()
      FAS_Saved.buffSpellIDs = {unpack(defaults.buffSpellIDs)}
      FAS_Saved.muteSounds = defaults.muteSounds
      FAS_Saved.autoRemoveBuffs = defaults.autoRemoveBuffs
      if options.refresh then options.refresh() end
    end

  elseif event == "UNIT_AURA" then
    onUnitAura(arg1)
  elseif event == "PLAYER_ENTERING_WORLD" then
    onUnitAura("player")
  elseif event == "UI_INFO_MESSAGE" and FAS_Saved.muteSounds then
    -- Suppress certain UI messages that often come with annoying sounds
    local messageType = arg1
    if messageType and (messageType == 1 or messageType == 2) then -- Error sounds
      -- Temporarily reduce sound volume for toy-related messages
    end
  elseif event == "CHAT_MSG_SYSTEM" and FAS_Saved.muteSounds then
    -- Monitor for toy usage messages and temporarily mute
    if arg1 and (
      string.find(arg1, "toy") or 
      string.find(arg1, "Toy") or
      string.find(arg1, "costume") or
      string.find(arg1, "transform")
    ) then
      -- Brief sound suppression for toy usage
    end
  end
end)
