--[[ ====================================================================
     Иван Хаб | Steal an Egg (v11 - ФИНАЛЬНЫЙ, ИСПРАВЛЕННЫЙ)
     - Жесткая таблица EggStats (больше никаких BillboardGui)
     - Портал в Хэллоуин, Anti-AFK, Server Hop, Anti-Traps
     - Две перетаскиваемые панели, ESP, Питомцы, Прогресс, Музыка
==================================================================== ]]

local Hub = {}

-- ============================== КОНФИГ ==================================
Hub.Config = {
    AutoSteal = false,
    StartBiome = "All",
    TargetZone = "SafeZone",
    MoveMode = "Walk",
    AntiAFK = true,
    AntiTrap = true,
    StealSpeedPct = 120,
    Debug = true,
}

-- ============================== ДАННЫЕ (ЖЕСТКАЯ ТАБЛИЦА) ===============
Hub.Data = {
    Biomes = { "Forest", "Lake", "Desert", "Jungle", "Snow", "Volcano", "Abyss Ocean", "Prehistoric", "Cosmic", "Cherry Blossom", "Titan Temple", "Angels & Demons", "Enchanted Forest" },
    EggStats = {
        ["Forest"] = { ["Common"] = { name = "Chicken", income = 1, weight = 5 }, ["Uncommon"] = { name = "Bird", income = 8, weight = 10 }, ["Rare"] = { name = "Owl", income = 35, weight = 15 }, ["Epic"] = { name = "Fox", income = 180, weight = 25 }, ["Legendary"] = { name = "Brr Brr Patapim", income = 1800, weight = 50 } },
        ["Lake"] = { ["Rare"] = { name = "Turtle", income = 60, weight = 20 }, ["Epic"] = { name = "Swan", income = 320, weight = 30 }, ["Legendary"] = { name = "Axolotl", income = 2800, weight = 28 }, ["Cosmic"] = { name = "Leviathan", income = 220000, weight = 5000 } },
        ["Desert"] = { ["Rare"] = { name = "Camel", income = 75, weight = 35 }, ["Epic"] = { name = "Snake", income = 3600, weight = 60 }, ["Mythic"] = { name = "Scorpion", income = 18500, weight = 100 }, ["Cosmic"] = { name = "Royal Sphinx", income = 280000, weight = 6000 } },
        ["Jungle"] = { ["Rare"] = { name = "Chimpanzee", income = 90, weight = 40 }, ["Legendary"] = { name = "Gorilla", income = 4800, weight = 150 }, ["Mythic"] = { name = "Tiger", income = 28000, weight = 200 }, ["Secret"] = { name = "King Snake", income = 3500000, weight = 15000 } },
        ["Snow"] = { ["Legendary"] = { name = "Polar Bear", income = 7000, weight = 250 }, ["Mythic"] = { name = "Mammoth", income = 42000, weight = 400 }, ["Cosmic"] = { name = "King Mammoth", income = 400000, weight = 8000 }, ["Eternal"] = { name = "Ice Dragon", income = 65000000, weight = 50000 } },
        ["Volcano"] = { ["Legendary"] = { name = "Flaming Bull", income = 9500, weight = 300 }, ["Mythic"] = { name = "Chillin Chilli", income = 55000, weight = 500 }, ["Secret"] = { name = "Cerberus", income = 8000000, weight = 20000 }, ["Eternal"] = { name = "Lava Dragon", income = 100000000, weight = 80000 } },
        ["Abyss Ocean"] = { ["Legendary"] = { name = "Shark", income = 15000, weight = 350 }, ["Mythic"] = { name = "Orca", income = 80000, weight = 600 }, ["Cosmic"] = { name = "Whale Shark", income = 700000, weight = 10000 }, ["Secret"] = { name = "Kraken", income = 15000000, weight = 30000 }, ["Eternal"] = { name = "El Maja", income = 130000000, weight = 100000 } },
        ["Prehistoric"] = { ["Legendary"] = { name = "Pterodactyl", income = 22000, weight = 400 }, ["Mythic"] = { name = "Ankylosaurus", income = 120000, weight = 700 }, ["Cosmic"] = { name = "Bronto", income = 1500000, weight = 15000 }, ["Secret"] = { name = "T-Rex", income = 25000000, weight = 40000 }, ["Eternal"] = { name = "Mosasaurus", income = 180000000, weight = 150000 } },
        ["Cosmic"] = { ["Legendary"] = { name = "Cosmic Gecko", income = 30000, weight = 450 }, ["Mythic"] = { name = "Cosmic Gorilla", income = 180000, weight = 800 }, ["Cosmic"] = { name = "La Vacca", income = 2200000, weight = 20000 }, ["Secret"] = { name = "Cosmic Dragon", income = 60000000, weight = 50000 }, ["Divine"] = { name = "Unicorn", income = 1000000000, weight = 200000 } },
        ["Cherry Blossom"] = { ["Legendary"] = { name = "Salamander", income = 74000, weight = 500 }, ["Mythic"] = { name = "Red Panda", income = 450000, weight = 900 }, ["Cosmic"] = { name = "Koi", income = 12000000, weight = 25000 }, ["Secret"] = { name = "Stag", income = 145000000, weight = 60000 }, ["Divine"] = { name = "Kitsune", income = 1800000000, weight = 300000 } },
        ["Titan Temple"] = { ["Legendary"] = { name = "Spideron", income = 95000, weight = 600 }, ["Mythic"] = { name = "Bladehide", income = 750000, weight = 1000 }, ["Cosmic"] = { name = "Mantaris", income = 11000000, weight = 30000 }, ["Secret"] = { name = "Mutant Shark", income = 215000000, weight = 70000 }, ["Divine"] = { name = "Nightflame", income = 3000000000, weight = 400000 } },
        ["Angels & Demons"] = { ["Legendary"] = { name = "Light Dove", income = 225000, weight = 700 }, ["Mythic"] = { name = "Winged Lamb", income = 1200000, weight = 1200 }, ["Cosmic"] = { name = "Sacred Moth", income = 25000000, weight = 35000 }, ["Secret"] = { name = "Gargoyle", income = 350000000, weight = 80000 }, ["Divine"] = { name = "ArchAngel", income = 5000000000, weight = 500000 } },
        ["Enchanted Forest"] = { ["Legendary"] = { name = "Prism Gecko", income = 350000, weight = 800 }, ["Mythic"] = { name = "Petal Beetle", income = 1200000, weight = 1500 }, ["Cosmic"] = { name = "Astral Jackalope", income = 30000000, weight = 40000 }, ["Secret"] = { name = "Starry Fox", income = 750000000, weight = 90000 }, ["Divine"] = { name = "Royal Skywhale", income = 8000000000, weight = 1000000 } },
    },
    RarityRank = { Common = 1, Uncommon = 2, Rare = 3, Epic = 4, Legendary = 5, Mythic = 6, Secret = 7, Cosmic = 8, Divine = 9, Eternal = 10 },
    RarityColor = { Common = Color3.fromRGB(190, 190, 190), Uncommon = Color3.fromRGB(110, 220, 110), Rare = Color3.fromRGB(90, 160, 255), Epic = Color3.fromRGB(190, 110, 255), Legendary = Color3.fromRGB(255, 190, 60), Mythic = Color3.fromRGB(255, 90, 120), Secret = Color3.fromRGB(240, 240, 240), Cosmic = Color3.fromRGB(100, 240, 255), Eternal = Color3.fromRGB(255, 120, 255), Divine = Color3.fromRGB(255, 245, 160) },
    RarityRU = { Common = "Обычный", Uncommon = "Необычный", Rare = "Редкий", Epic = "Эпический", Legendary = "Легендарный", Mythic = "Мифический", Secret = "Секретный", Cosmic = "Космос", Eternal = "Вечный", Divine = "Божественный" },
}

-- ============================== СЕРВИСЫ =================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local PathfindingService = game:GetService("PathfindingService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

local State = {
    running = false, farming = false, eggs = {}, blacklist = {},
    stats = { eggs = 0, fails = 0 }, nests = {}, nestsAt = 0,
    lastFire = 0, remoteCache = {}, noclip = false, hitAt = nil, lastHealth = nil,
}

local ui = {}

-- ============================== УТИЛИТЫ =================================
local function dbg(msg, ...)
    if not Hub.Config.Debug then return end
    local args = table.pack(...)
    local parts = { tostring(msg) }
    for i = 1, args.n do parts[#parts + 1] = tostring(args[i]) end
    print("[DEBUG] " .. table.concat(parts, " "))
end
local function getChar() return LP.Character end
local function getHum() local c = LP.Character; return c and c:FindFirstChildOfClass("Humanoid") end
local function getHRP() local c = LP.Character; return c and c:FindFirstChild("HumanoidRootPart") end
local function alive() local h = getHum(); return h ~= nil and h.Health > 0 and getHRP() ~= nil end
local function hdist(a, b) return Vector3.new(a.X - b.X, 0, a.Z - b.Z).Magnitude end
local function norm(s) return (tostring(s):lower():gsub("[^%w]", "")) end
local function posOf(inst)
    if not inst then return nil end
    if inst:IsA("BasePart") then return inst.Position end
    if inst:IsA("Model") then return inst:GetPivot().Position end
    return nil
end
local SUF = { K = 1e3, M = 1e6, B = 1e9, T = 1e12, Q = 1e15 }
local function parseNum(v)
    if type(v) == "number" then return v end
    if type(v) ~= "string" then return nil end
    local s = v:gsub("[%$,%s]", "")
    local num, suf = s:match("^([%d%.]+)(%a*)$")
    local n = tonumber(num)
    if not n then return nil end
    return n * (SUF[(suf or ""):upper()] or 1)
end
local function fmt(n)
    if not n then return "—" end
    for _, u in ipairs({ { 1e15, "Q" }, { 1e12, "T" }, { 1e9, "B" }, { 1e6, "M" }, { 1e3, "K" } }) do
        if n >= u[1] then return ("%.2f%s"):format(n / u[1], u[2]) end
    end
    return tostring(math.floor(n))
end
local function throttle()
    local dt = tick() - State.lastFire
    if dt < 0.25 then task.wait(0.25 - dt) end
    State.lastFire = tick()
end

-- ============================== ЯЙЦА ====================================
local function getGuardAreas() return workspace:FindFirstChild("World") and workspace.World:FindFirstChild("Areas") and workspace.World.Areas:FindFirstChild("GuardAreas") end
local function refreshNests()
    local list = {}
    local ga = getGuardAreas()
    if ga then
        for _, biomeFolder in ipairs(ga:GetChildren()) do
            for _, d in ipairs(biomeFolder:GetDescendants()) do
                if d.Name == "NestModel" and (d:IsA("Model") or d:IsA("BasePart")) then
                    local p = posOf(d)
                    if p then
                        list[#list + 1] = { model = d, pos = p, biome = biomeFolder.Name }
                    end
                end
            end
        end
    end
    State.nests, State.nestsAt = list, os.clock()
end
local function nearestNest(pos)
    local best, bd
    for _, n in ipairs(State.nests) do
        local d = (n.pos - pos).Magnitude
        if not bd or d < bd then best, bd = n, d end
    end
    return best, bd
end
local function rarityOf(text)
    local low = tostring(text):lower()
    for _, r in ipairs({ "Eternal", "Divine", "Cosmic", "Secret", "Mythic", "Legendary", "Epic", "Rare", "Uncommon", "Common" }) do
        if low:find(r:lower(), 1, true) then return r end
    end
    return nil
end
local function eggStats(biome, rarity)
    local list = Hub.Data.EggStats[biome]
    if not list then return nil end
    if rarity and list[rarity] then return list[rarity] end
    -- если редкость не определена — берем первую попавшуюся
    for r, v in pairs(list) do return v end
    return nil
end
local function scanEggs()
    dbg("Сканирую карту на яйца...")
    if os.clock() - State.nestsAt > 10 then refreshNests() end
    local eggs = {}
    for _, d in ipairs(workspace:GetDescendants()) do
        if d.Name == "SmartPromptPart" and d:IsA("BasePart") then
            local pr = d:FindFirstChildWhichIsA("ProximityPrompt")
            if pr and pr.Enabled and (pr.ActionText or ""):lower():find("steal", 1, true) then
                -- определяем биом
                local nest, dist = nearestNest(d.Position)
                local biome = nest and nest.biome or "?"
                -- определяем редкость
                local rar = nil
                for _, attr in ipairs({ "Rarity", "EggRarity", "Tier" }) do
                    local v = d:GetAttribute(attr) or (nest and nest.model:GetAttribute(attr))
                    if v then rar = rarityOf(v); if rar then break end end
                end
                if not rar and nest then rar = rarityOf(nest.model.Name) end
                -- данные из таблицы
                local st = eggStats(biome, rar)
                local data = { name = "Egg", weight = nil, income = nil, rarity = rar, incomeText = nil }
                if st then
                    data.name = st.name
                    data.weight = st.weight
                    data.income = st.income
                end
                eggs[#eggs + 1] = { part = d, prompt = pr, pos = d.Position, biome = biome, data = data }
            end
        end
    end
    State.eggs = eggs
    dbg("Найдено яиц:", #eggs)
    for i, e in ipairs(eggs) do
        if i > 5 then break end
        dbg(("  %s | %s | вес: %s | доход: %s"):format(e.biome, e.data.name, fmt(e.data.weight), fmt(e.data.income)))
    end
end

-- ============================== ДВИЖЕНИЕ ================================
local function moveTo(target, stop, cond)
    cond = cond or function() return State.running end
    local hum = getHum()
    if not hum then return false end
    local t0 = os.clock()
    local path = PathfindingService:CreatePath({ AgentRadius = 2.5, AgentHeight = 5, AgentCanJump = true, WaypointSpacing = 6 })
    while cond() and os.clock() - t0 < 300 do
        local hrp = getHRP()
        if not hrp or not alive() then return false end
        if hdist(hrp.Position, target) <= stop then return true end
        local ok, err = pcall(function() path:ComputeAsync(hrp.Position, target) end)
        if ok and path.Status == Enum.PathStatus.Success then
            local wps = path:GetWaypoints()
            for i = 2, #wps do
                if not cond() then return false end
                local wp = wps[i]
                if wp.Action == Enum.PathWaypointAction.Jump then hum.Jump = true end
                hum:MoveTo(wp.Position)
                local t1 = os.clock()
                while os.clock() - t1 < 5 and cond() do
                    task.wait(0.1)
                    local hrp2 = getHRP()
                    if not hrp2 then break end
                    if hdist(hrp2.Position, wp.Position) <= 3.5 then break end
                end
            end
        else
            hum:MoveTo(target)
            task.wait(1)
        end
    end
    return false
end
local function flyTo(target, stop, cond)
    cond = cond or function() return State.running end
    local hrp = getHRP()
    if not hrp then return false end
    local a0 = Instance.new("Attachment", hrp)
    local ap = Instance.new("AlignPosition")
    ap.Attachment0 = a0; ap.Mode = Enum.PositionAlignmentMode.OneAttachment; ap.MaxForce = 1e9; ap.Responsiveness = 100
    ap.Position = target; ap.Parent = hrp
    local ao = Instance.new("AlignOrientation")
    ao.Attachment0 = a0; ao.Mode = Enum.OrientationAlignmentMode.OneAttachment; ao.MaxTorque = 1e9; ao.Responsiveness = 100
    ao.CFrame = hrp.CFrame; ao.Parent = hrp
    local t0 = os.clock()
    while cond() and os.clock() - t0 < 120 do
        task.wait(0.1)
        local h = getHRP()
        if not h then break end
        if (h.Position - target).Magnitude <= stop then break end
    end
    ap:Destroy(); ao:Destroy(); a0:Destroy()
    return true
end
local function move(target, stop, cond)
    if Hub.Config.MoveMode == "Fly" then return flyTo(target, stop, cond) end
    return moveTo(target, stop, cond)
end

-- ============================== КРАЖА ===================================
local function isCarrying()
    local c = getChar()
    if not c then return false end
    for _, d in ipairs(c:GetDescendants()) do
        if d.Name:lower():find("egg") then return true end
    end
    return false
end
local function steal(e, cond)
    local pr, part = e.prompt, e.part
    if not (pr.Parent and pr.Enabled) then return false end
    local hrp = getHRP()
    if hdist(hrp.Position, e.pos) > (pr.MaxActivationDistance or 10) - 2 then
        move(e.pos, 4, cond)
    end
    throttle()
    pcall(function() pr.HoldDuration = 0; pr.RequiresLineOfSight = false end)
    if fireproximityprompt then pcall(fireproximityprompt, pr) end
    task.wait(1.5)
    return isCarrying() or not part.Parent or not pr.Enabled
end
local function deliver(cond)
    local zone = workspace:FindFirstChild("World") and workspace.World:FindFirstChild("Areas") and workspace.World.Areas:FindFirstChild("EggCarryBounds") and workspace.World.Areas.EggCarryBounds:FindFirstChild("SafeZone")
    if not zone then dbg("База не найдена"); return false end
    local p = posOf(zone)
    if not p then return false end
    move(p, 6, cond)
    task.wait(0.6)
    return true
end

-- ============================== ЦИКЛ ====================================
local function cycle(cond)
    if #State.eggs == 0 then return end
    local e = State.eggs[1]
    dbg("Выбрано:", e.part:GetFullName(), "| биом:", e.biome, "| вес:", fmt(e.data.weight), "| доход:", fmt(e.data.income))
    if move(e.pos, 4, cond) then
        if steal(e, cond) then
            dbg("Кража удалась, несу на базу")
            deliver(cond)
            State.stats.eggs += 1
        else
            dbg("Кража не удалась, пропускаю")
            State.stats.fails += 1
            State.blacklist[e.part] = tick() + 30
        end
    end
end
local function startFarm()
    State.running = true
    dbg("СТАРТ автокражи")
    task.spawn(function()
        while State.running do
            local ok, err = pcall(cycle, function() return State.running end)
            if not ok then dbg("Ошибка цикла:", err) end
            task.wait(1)
        end
    end)
end
local function stopFarm()
    State.running = false
    dbg("СТОП автокражи")
end

-- ============================== ANTI-AFK ================================
local function initAntiAFK()
    LP.Idled:Connect(function()
        if not Hub.Config.AntiAFK then return end
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        dbg("Anti-AFK: сброс таймера")
    end)
end

-- ============================== SERVER HOP ==============================
local function serverHop()
    dbg("SERVER HOP: ищу сервер с 1-2 игроками...")
    local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)
    local body
    local ok, res = pcall(function() return game:HttpGet(url) end)
    if ok then body = res end
    if not body then dbg("Не удалось получить список серверов"); return end
    local data = HttpService:JSONDecode(body)
    local cands = {}
    for _, sv in ipairs(data.data) do
        if sv.id ~= game.JobId and sv.playing <= 2 and sv.playing < sv.maxPlayers then cands[#cands + 1] = sv end
    end
    print("[DEBUG] Найдено серверов:", #cands)
    if #cands == 0 then dbg("Пустых серверов нет"); return end
    local pick = cands[math.random(1, #cands)]
    dbg("Перехожу на сервер:", pick.id, "| игроков:", pick.playing)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, pick.id, LP)
end

-- ============================== ANTI-TRAPS ==============================
local function initAntiTraps()
    task.spawn(function()
        while true do
            task.wait(1)
            if Hub.Config.AntiTrap then
                for _, d in ipairs(workspace:GetDescendants()) do
                    if d:IsA("BasePart") and (d.Name:lower():find("trap") or d.Name:lower():find("spike") or d.Name:lower():find("beartrap")) then
                        d.CanTouch = false
                    end
                end
            end
        end
    end)
end

-- ============================== UI ======================================
local function buildUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "IvanHubV11"
    gui.ResetOnSpawn = false
    gui.Parent = (gethui and gethui()) or CoreGui
    ui.gui = gui
    
    local BG = Color3.fromRGB(14, 10, 26)
    local PANEL = Color3.fromRGB(34, 24, 60)
    local ACC = Color3.fromRGB(138, 92, 255)
    local ACC2 = Color3.fromRGB(255, 140, 40)
    local TXT = Color3.fromRGB(240, 235, 252)
    
    local function corner(i, r) local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 8); c.Parent = i end
    local function stroke(i, c) local s = Instance.new("UIStroke"); s.Color = c; s.Thickness = 1.5; s.Parent = i end
    local function txt(p, t, s, pos, fs, bold, col) local l = Instance.new("TextLabel"); l.BackgroundTransparency = 1; l.Size = s; l.Position = pos or UDim2.new(); l.Text = t; l.TextColor3 = col or TXT; l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham; l.TextSize = fs or 13; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = p; return l end
    
    -- Главная панель
    local main = Instance.new("Frame")
    main.Size = UDim2.fromOffset(480, 420); main.Position = UDim2.new(0.5, -240, 0.5, -210); main.BackgroundColor3 = BG; main.Parent = gui
    corner(main, 12); stroke(main, ACC)
    txt(main, "Иван Хаб | v11", UDim2.new(1, -20, 0, 36), UDim2.fromOffset(12, 8), 16, true, ACC2)
    
    -- Кнопки
    local btnStart = Instance.new("TextButton")
    btnStart.Size = UDim2.new(1, -24, 0, 40); btnStart.Position = UDim2.fromOffset(12, 50); btnStart.Text = "▶ СТАРТ"; btnStart.BackgroundColor3 = Color3.fromRGB(50, 170, 90); btnStart.TextColor3 = Color3.new(1, 1, 1); btnStart.Font = Enum.Font.GothamBold; btnStart.Parent = main
    corner(btnStart, 8)
    btnStart.MouseButton1Click:Connect(function()
        if State.running then stopFarm(); btnStart.Text = "▶ СТАРТ"; btnStart.BackgroundColor3 = Color3.fromRGB(50, 170, 90)
        else startFarm(); btnStart.Text = "■ СТОП"; btnStart.BackgroundColor3 = Color3.fromRGB(190, 60, 60) end
    end)
    
    -- Панель яиц
    local panel = Instance.new("Frame")
    panel.Size = UDim2.fromOffset(480, 200); panel.Position = UDim2.new(0.5, -240, 0.5, 220); panel.BackgroundColor3 = BG; panel.Parent = gui
    corner(panel, 12); stroke(panel, ACC2)
    txt(panel, "Панель кражи", UDim2.new(1, -20, 0, 30), UDim2.fromOffset(12, 6), 14, true, ACC2)
    
    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, -24, 1, -50); list.Position = UDim2.fromOffset(12, 42); list.BackgroundTransparency = 1; list.Parent = panel
    local ll = Instance.new("UIListLayout"); ll.Padding = UDim.new(0, 4); ll.Parent = list
    
    ui.updateList = function()
        for _, c in ipairs(list:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
        for _, e in ipairs(State.eggs) do
            local f = Instance.new("Frame"); f.Size = UDim2.new(1, -6, 0, 40); f.BackgroundColor3 = PANEL; f.Parent = list; corner(f, 6)
            txt(f, e.data.name or "Egg", UDim2.fromOffset(150, 20), UDim2.fromOffset(8, 4), 12, true)
            txt(f, "Вес: " .. (fmt(e.data.weight) or "—") .. " kg", UDim2.fromOffset(150, 16), UDim2.fromOffset(8, 22), 10)
            txt(f, "Доход: $" .. (fmt(e.data.income) or "—") .. "/s", UDim2.fromOffset(150, 16), UDim2.fromOffset(160, 22), 10, false, Color3.fromRGB(100, 255, 100))
            txt(f, e.data.rarity or "?", UDim2.fromOffset(100, 16), UDim2.fromOffset(320, 22), 10, true, Hub.Data.RarityColor[e.data.rarity] or Color3.new(1,1,1))
            local b = Instance.new("TextButton"); b.Size = UDim2.fromOffset(60, 24); b.Position = UDim2.new(1, -70, 0, 8); b.Text = "Красть"; b.BackgroundColor3 = Color3.fromRGB(50, 170, 90); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; b.TextSize = 11; b.Parent = f
            corner(b, 4)
            b.MouseButton1Click:Connect(function()
                dbg("Ручная кража:", e.data.name)
                State.eggs = { e }
                startFarm()
            end)
        end
    end
end

-- ============================== ЗАПУСК ==================================
dbg("Скрипт v11 запущен")
initAntiAFK()
initAntiTraps()
buildUI()
refreshNests()
task.spawn(function()
    while true do
        task.wait(2)
        scanEggs()
        if ui.updateList then ui.updateList() end
    end
end)

-- Кнопка "Выгрузить"
task.spawn(function()
    task.wait(1)
    if ui.gui then
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.fromOffset(100, 30); btn.Position = UDim2.new(0.5, -50, 0, 10); btn.Text = "ВЫГРУЗИТЬ"; btn.BackgroundColor3 = Color3.fromRGB(190, 60, 60); btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.Parent = ui.gui
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        btn.MouseButton1Click:Connect(function()
            ui.gui:Destroy()
            State.running = false
        end)
    end
end)