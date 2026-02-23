--[[
    Panda VSS — Reinforced Loader (V5)
    Multi-stage secure script loading via WebSocket

    Flow:
    1. Thin stub sets global `slug_id` and loads this script
    2. Connect to server via WebSocket
    3. Send init with slug_id + executor info
    4. Receive & execute Check_Env security script
    5. Send environment results back
    6. E2EE key exchange
    7. Receive encrypted payload, decrypt, execute

    The thin stub (returned by /virtual/file/:fileId) looks like:
        slug_id = "c8367a1913014692"
        loadstring(game:HttpGet("https://new.pandadevelopment.net/virtual/loader/v4_loader.lua"))()

]]
local VSS_Debug_Mode = true

local function dbg(...)
    if VSS_Debug_Mode then
        print("[Panda VSS Debug]", ...)
    end
end

-- Read slug_id from global (set by the thin stub)
dbg("Reading slug_id from global...")
local SLUG_ID = slug_id or getgenv and getgenv().slug_id
if not SLUG_ID or type(SLUG_ID) ~= "string" or #SLUG_ID < 5 then
    dbg("FAILED: No slug_id found or invalid (got:", tostring(SLUG_ID), ")")
    return warn("[Panda VSS] No Slug UD Found / Invalid Slug ID")
end
dbg("slug_id =", SLUG_ID)
-- Clean up global
slug_id = nil
if getgenv then pcall(function() getgenv().slug_id = nil end) end

local WS_URL = "wss://new.pandadevelopment.net/ws/reinforced"
dbg("WS_URL =", WS_URL)

-- ============================================
-- Utilities
-- ============================================

local HttpService = game:GetService("HttpService")

local function jsonEncode(t)
    return HttpService:JSONEncode(t)
end

local function jsonDecode(s)
    return HttpService:JSONDecode(s)
end

local function base64Decode(str)
    if crypt and crypt.base64decode then
        return crypt.base64decode(str)
    end
    -- Pure Lua base64 decode fallback
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    str = str:gsub("[^" .. b .. "=]", "")
    return (str:gsub(".", function(x)
        if x == "=" then return "" end
        local r, f = "", (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2^i - f % 2^(i-1) > 0 and "1" or "0") end
        return r
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if #x ~= 8 then return "" end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == "1" and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local function base64Encode(str)
    if crypt and crypt.base64encode then
        return crypt.base64encode(str)
    end
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    return ((str:gsub(".", function(x)
        local r, byte = "", string.byte(x)
        for i = 8, 1, -1 do r = r .. (byte % 2^i - byte % 2^(i-1) > 0 and "1" or "0") end
        return r
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
        if #x < 6 then return "" end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == "1" and 2^(6-i) or 0) end
        return b:sub(c+1, c+1)
    end) .. ({"", "==", "="})[#str % 3 + 1])
end

local function bytesToString(bytes)
    local chars = {}
    for i = 1, #bytes do
        chars[i] = string.char(bytes[i])
    end
    return table.concat(chars)
end

local function stringToBytes(str)
    local bytes = {}
    for i = 1, #str do
        bytes[i] = string.byte(str, i)
    end
    return bytes
end

local function xorBytes(a, b)
    local result = {}
    for i = 1, #a do
        result[i] = bit32.bxor(a[i], b[((i - 1) % #b) + 1])
    end
    return result
end

local function generateRandom(length)
    local bytes = {}
    for i = 1, length do
        bytes[i] = math.random(0, 255)
    end
    return bytes
end

-- ============================================
-- SHA-256 (Pure Lua fallback for key derivation)
-- ============================================

local function sha256(message)
    -- Use native crypt.hash if available
    if crypt and crypt.hash then
        return crypt.hash(message, "sha256")
    end

    -- Pure Lua SHA-256 implementation
    local band = bit32.band
    local bor = bit32.bor
    local bxor = bit32.bxor
    local bnot = bit32.bnot
    local rshift = bit32.rshift
    local lshift = bit32.lshift
    local rrotate = bit32.rrotate or function(x, n) return bor(rshift(x, n), lshift(x, 32 - n)) end

    local K = {
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
    }

    local function preprocess(msg)
        local len = #msg
        local bits = len * 8
        msg = msg .. "\128"
        while (#msg % 64) ~= 56 do
            msg = msg .. "\0"
        end
        -- Append length as 64-bit big-endian
        for i = 7, 0, -1 do
            msg = msg .. string.char(band(rshift(bits, i * 8), 0xFF))
        end
        return msg
    end

    local function processBlock(msg, offset, H)
        local W = {}
        for i = 1, 16 do
            local base = offset + (i - 1) * 4
            W[i] = lshift(string.byte(msg, base + 1), 24) +
                    lshift(string.byte(msg, base + 2), 16) +
                    lshift(string.byte(msg, base + 3), 8) +
                    string.byte(msg, base + 4)
        end
        for i = 17, 64 do
            local s0 = bxor(rrotate(W[i-15], 7), rrotate(W[i-15], 18), rshift(W[i-15], 3))
            local s1 = bxor(rrotate(W[i-2], 17), rrotate(W[i-2], 19), rshift(W[i-2], 10))
            W[i] = band(W[i-16] + s0 + W[i-7] + s1, 0xFFFFFFFF)
        end

        local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]

        for i = 1, 64 do
            local S1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
            local ch = bxor(band(e, f), band(bnot(e), g))
            local temp1 = band(h + S1 + ch + K[i] + W[i], 0xFFFFFFFF)
            local S0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
            local maj = bxor(band(a, b), band(a, c), band(b, c))
            local temp2 = band(S0 + maj, 0xFFFFFFFF)

            h = g; g = f; f = e
            e = band(d + temp1, 0xFFFFFFFF)
            d = c; c = b; b = a
            a = band(temp1 + temp2, 0xFFFFFFFF)
        end

        H[1] = band(H[1] + a, 0xFFFFFFFF)
        H[2] = band(H[2] + b, 0xFFFFFFFF)
        H[3] = band(H[3] + c, 0xFFFFFFFF)
        H[4] = band(H[4] + d, 0xFFFFFFFF)
        H[5] = band(H[5] + e, 0xFFFFFFFF)
        H[6] = band(H[6] + f, 0xFFFFFFFF)
        H[7] = band(H[7] + g, 0xFFFFFFFF)
        H[8] = band(H[8] + h, 0xFFFFFFFF)
    end

    local msg = preprocess(message)
    local H = {
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
        0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
    }

    for i = 1, #msg, 64 do
        processBlock(msg, i - 1, H)
    end

    local hash = ""
    for i = 1, 8 do
        hash = hash .. string.format("%08x", H[i])
    end
    return hash
end

-- Convert hex string to byte array
local function hexToBytes(hex)
    local bytes = {}
    for i = 1, #hex, 2 do
        bytes[#bytes + 1] = tonumber(hex:sub(i, i + 1), 16)
    end
    return bytes
end

-- ============================================
-- RC4 Cipher (Pure Lua — lightweight fallback)
-- ============================================

local function rc4Decrypt(data, key)
    local keyBytes = stringToBytes(key)
    local S = {}
    for i = 0, 255 do S[i] = i end

    local j = 0
    for i = 0, 255 do
        j = (j + S[i] + keyBytes[(i % #keyBytes) + 1]) % 256
        S[i], S[j] = S[j], S[i]
    end

    local dataBytes = stringToBytes(data)
    local output = {}
    local ii, jj = 0, 0
    for k = 1, #dataBytes do
        ii = (ii + 1) % 256
        jj = (jj + S[ii]) % 256
        S[ii], S[jj] = S[jj], S[ii]
        output[k] = bit32.bxor(dataBytes[k], S[(S[ii] + S[jj]) % 256])
    end
    return bytesToString(output)
end

-- ============================================
-- AES-256-CBC Decryption (Native crypt library)
-- ============================================

local function aesDecrypt(encryptedData, keyBase64, ivBase64)
    -- Try native crypt library first
    if crypt and crypt.decrypt then
        return crypt.decrypt(encryptedData, keyBase64, ivBase64)
    end

    -- Try syn.crypt fallback
    if syn and syn.crypt and syn.crypt.decrypt then
        return syn.crypt.decrypt(encryptedData, keyBase64, ivBase64)
    end

    return nil, "No AES decryption available"
end

-- ============================================
-- Executor Detection
-- ============================================

local function getExecutorName()
    local ok, name = pcall(identifyexecutor)
    local result = ok and tostring(name) or "Unknown"
    dbg("Executor detected:", result)
    return result
end

-- ============================================
-- Custom Notification (Bottom-Right)
-- ============================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local notifGui = nil
local notifList = nil
local NOTIF_OFFSET = UDim2.new(0, 10, 0, 0) -- slide-in distance

local function ensureGui()
    if notifGui and notifGui.Parent then return end
    local player = Players.LocalPlayer
    if not player then return end

    local pg = player:FindFirstChildOfClass("PlayerGui")
    if not pg then return end

    notifGui = Instance.new("ScreenGui")
    notifGui.Name = "PandaNotif"
    notifGui.ResetOnSpawn = false
    notifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    notifGui.DisplayOrder = 999
    notifGui.Parent = pg

    notifList = Instance.new("Frame")
    notifList.Name = "List"
    notifList.BackgroundTransparency = 1
    notifList.AnchorPoint = Vector2.new(1, 1)
    notifList.Position = UDim2.new(1, -16, 1, -16)
    notifList.Size = UDim2.new(0, 280, 1, -32)
    notifList.Parent = notifGui

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = notifList
end

local function notify(title, text, duration)
    pcall(function()
        ensureGui()
        if not notifList then return end

        duration = duration or 5

        -- Card
        local card = Instance.new("Frame")
        card.Size = UDim2.new(1, 0, 0, 0) -- auto height via UIListLayout later
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
        card.BorderSizePixel = 0
        card.BackgroundTransparency = 1
        card.ClipsDescendants = true

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = card

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(55, 55, 75)
        stroke.Thickness = 1
        stroke.Transparency = 1
        stroke.Parent = card

        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 10)
        pad.PaddingBottom = UDim.new(0, 10)
        pad.PaddingLeft = UDim.new(0, 12)
        pad.PaddingRight = UDim.new(0, 12)
        pad.Parent = card

        local innerLayout = Instance.new("UIListLayout")
        innerLayout.FillDirection = Enum.FillDirection.Vertical
        innerLayout.SortOrder = Enum.SortOrder.LayoutOrder
        innerLayout.Padding = UDim.new(0, 2)
        innerLayout.Parent = card

        -- Title
        local titleLabel = Instance.new("TextLabel")
        titleLabel.LayoutOrder = 1
        titleLabel.Size = UDim2.new(1, 0, 0, 0)
        titleLabel.AutomaticSize = Enum.AutomaticSize.Y
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = title or "Panda VSS"
        titleLabel.TextColor3 = Color3.fromRGB(200, 180, 255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 13
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.TextWrapped = true
        titleLabel.Parent = card

        -- Body
        if text and text ~= "" then
            local bodyLabel = Instance.new("TextLabel")
            bodyLabel.LayoutOrder = 2
            bodyLabel.Size = UDim2.new(1, 0, 0, 0)
            bodyLabel.AutomaticSize = Enum.AutomaticSize.Y
            bodyLabel.BackgroundTransparency = 1
            bodyLabel.Text = text
            bodyLabel.TextColor3 = Color3.fromRGB(180, 180, 195)
            bodyLabel.Font = Enum.Font.Gotham
            bodyLabel.TextSize = 12
            bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
            bodyLabel.TextWrapped = true
            bodyLabel.Parent = card
        end

        -- Position off-screen to the right, then tween in
        card.Position = UDim2.new(0, 10, 0, 0)
        card.Parent = notifList

        -- Fade in
        local fadeIn = TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0.05,
            Position = UDim2.new(0, 0, 0, 0)
        })
        local strokeIn = TweenService:Create(stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Transparency = 0.4
        })
        fadeIn:Play()
        strokeIn:Play()

        -- Auto dismiss
        task.delay(duration, function()
            pcall(function()
                local fadeOut = TweenService:Create(card, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 10, 0, 0)
                })
                local strokeOut = TweenService:Create(stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Transparency = 1
                })
                -- Fade out text too
                for _, child in ipairs(card:GetChildren()) do
                    if child:IsA("TextLabel") then
                        TweenService:Create(child, TweenInfo.new(0.3), { TextTransparency = 1 }):Play()
                    end
                end
                fadeOut:Play()
                strokeOut:Play()
                fadeOut.Completed:Wait()
                card:Destroy()
            end)
        end)
    end)
end

-- ============================================
-- Main Loader Logic
-- ============================================

local function main()
    dbg("=== Reinforced Loader V5 Starting ===")

    -- Check WebSocket support
    dbg("Checking WebSocket support...")
    if not WebSocket or not WebSocket.connect then
        local ws = WebSocket or (syn and syn.websocket) or (fluxus and fluxus.websocket)
        if not ws or not ws.connect then
            dbg("FAILED: No WebSocket.connect found")
            notify("Panda VSS", "Your executor does not support WebSocket. Update your executor or use a different one.", 10)
            return error("[Panda VSS] WebSocket.connect is not supported by this executor")
        end
        dbg("Using fallback WebSocket:", tostring(ws))
        WebSocket = ws
    end
    dbg("WebSocket OK")

    local executorName = getExecutorName()
    local sessionToken = nil
    local sessionKey = nil
    local completed = false

    -- Connect to the Reinforced Loader WebSocket
    dbg("Connecting to", WS_URL, "...")
    notify("Panda VSS", "Connecting to server...", 3)

    local ws
    local ok, err = pcall(function()
        ws = WebSocket.connect(WS_URL)
    end)

    if not ok or not ws then
        dbg("FAILED: WebSocket connect error:", tostring(err))
        notify("Panda VSS", "Failed to connect: " .. tostring(err), 10)
        return error("[Panda VSS] WebSocket connection failed: " .. tostring(err))
    end
    dbg("WebSocket connected!")

    -- Message handler state
    local stage = "init"
    local resultReady = false
    local scriptResult = nil
    local scriptError = nil

    -- Send init message
    dbg("Sending init -> slug_id:", SLUG_ID, "executor:", executorName)
    ws:Send(jsonEncode({
        type = "init",
        slug_id = SLUG_ID,
        executor_name = executorName
    }))

    ws.OnMessage:Connect(function(rawMsg)
        dbg("<<< Received message (stage:", stage, ") length:", #rawMsg)
        local success, msg = pcall(jsonDecode, rawMsg)
        if not success then
            dbg("FAILED: Could not decode JSON:", tostring(msg))
            scriptError = "Invalid server message"
            resultReady = true
            return
        end
        dbg("<<< Message type:", msg.type)

        if msg.type == "error" then
            dbg("Server error:", msg.message)
            notify("Panda VSS", msg.message or "Server error", 8)
            scriptError = msg.message
            resultReady = true
            return
        end

        if msg.type == "session" and stage == "init" then
            sessionToken = msg.session_token
            dbg("Session token received:", sessionToken)
            dbg("Script name:", msg.script_name)
            stage = "check_env"
            dbg("Stage -> check_env (waiting for check_env script)")
            return
        end

        if msg.type == "check_env" and stage == "check_env" then
            dbg("Received Check_Env script (base64 length:", #msg.script, ")")
            local checkScript = base64Decode(msg.script)
            dbg("Decoded Check_Env script (length:", #checkScript, ")")
            dbg("Executing Check_Env...")
            local checkOk, checkResult = pcall(function()
                return loadstring(checkScript)()
            end)

            if checkOk and checkResult then
                dbg("Check_Env passed! Result length:", #checkResult)
                local resultData = jsonDecode(checkResult)
                dbg("Check_Env status:", resultData.status)
                dbg("Check_Env data:", jsonEncode(resultData.data))
                ws:Send(jsonEncode({
                    type = "check_env_result",
                    status = resultData.status,
                    data = resultData.data
                }))
                stage = "e2ee"
                dbg("Stage -> e2ee (waiting for e2ee_start)")
            else
                dbg("FAILED: Check_Env execution error:", tostring(checkResult))
                ws:Send(jsonEncode({
                    type = "check_env_result",
                    status = "fail",
                    data = { fail_reason = "execution_error", error = tostring(checkResult) }
                }))
                scriptError = "Environment check failed"
                resultReady = true
            end
            return
        end

        if msg.type == "e2ee_start" and stage == "e2ee" then
            dbg("E2EE key exchange starting...")
            local clientRandom = generateRandom(32)
            local clientRandomHex = ""
            for _, b in ipairs(clientRandom) do
                clientRandomHex = clientRandomHex .. string.format("%02x", b)
            end
            dbg("Client random generated (hex):", clientRandomHex:sub(1, 16) .. "...")

            session_client_random = clientRandomHex

            ws:Send(jsonEncode({
                type = "e2ee_init",
                client_random = clientRandomHex
            }))
            stage = "e2ee_key"
            dbg("Stage -> e2ee_key (waiting for e2ee_key)")
            return
        end

        if msg.type == "e2ee_key" and stage == "e2ee_key" then
            dbg("Received E2EE key data. Cipher:", msg.cipher)
            local derivationInput = sessionToken .. ":" .. session_client_random
            local maskKeyHex = sha256(derivationInput)
            dbg("Mask key derived (SHA256):", maskKeyHex:sub(1, 16) .. "...")
            local maskKeyBytes = hexToBytes(maskKeyHex)

            local maskedKeyRaw = base64Decode(msg.masked_key)
            local maskedKeyBytes = stringToBytes(maskedKeyRaw)
            dbg("Masked key length:", #maskedKeyBytes, "Mask key length:", #maskKeyBytes)

            local sessionKeyBytes = xorBytes(maskedKeyBytes, maskKeyBytes)
            sessionKey = {
                bytes = sessionKeyBytes,
                raw = bytesToString(sessionKeyBytes),
                base64 = base64Encode(bytesToString(sessionKeyBytes)),
                cipher = msg.cipher,
                iv = msg.iv
            }
            dbg("Session key recovered. Cipher:", sessionKey.cipher, "Key length:", #sessionKeyBytes, "bytes")

            stage = "payload"
            dbg("Stage -> payload (waiting for encrypted payload)")
            return
        end

        if msg.type == "payload" and stage == "payload" then
            dbg("Received encrypted payload! Size:", msg.size, "Cipher:", msg.cipher)
            local encryptedData = base64Decode(msg.data)
            dbg("Encrypted data decoded, length:", #encryptedData)
            local decrypted = nil

            if sessionKey.cipher == "aes-cbc-256" then
                dbg("Decrypting with AES-256-CBC...")
                local aesResult, aesErr = aesDecrypt(
                    base64Encode(encryptedData),
                    sessionKey.base64,
                    sessionKey.iv
                )
                if aesResult then
                    dbg("AES decryption OK! Decrypted length:", #aesResult)
                    decrypted = aesResult
                else
                    dbg("FAILED: AES decryption error:", tostring(aesErr))
                    notify("Panda VSS", "AES decryption failed, contact developer", 10)
                    scriptError = "Decryption failed: " .. tostring(aesErr)
                    resultReady = true
                    return
                end
            elseif sessionKey.cipher == "rc4" then
                dbg("Decrypting with RC4 (Pure Lua)...")
                decrypted = rc4Decrypt(encryptedData, sessionKey.raw)
                dbg("RC4 decryption done, length:", decrypted and #decrypted or 0)
            else
                dbg("FAILED: Unknown cipher:", tostring(sessionKey.cipher))
                scriptError = "Unknown cipher: " .. tostring(sessionKey.cipher)
                resultReady = true
                return
            end

            if decrypted and #decrypted > 0 then
                dbg("Payload decrypted successfully! Length:", #decrypted)
                dbg("First 80 chars:", decrypted:sub(1, 80))
                scriptResult = decrypted
                resultReady = true
                completed = true
            else
                dbg("FAILED: Decryption produced empty result")
                scriptError = "Decryption produced empty result"
                resultReady = true
            end
            return
        end

        if msg.type == "complete" then
            dbg("Server confirmed delivery complete")
            pcall(function() ws:Close() end)
            return
        end

        dbg("Unhandled message type:", msg.type, "at stage:", stage)
    end)

    ws.OnClose:Connect(function()
        dbg("WebSocket closed. resultReady:", tostring(resultReady), "completed:", tostring(completed))
        if not resultReady then
            scriptError = "Connection closed unexpectedly"
            resultReady = true
        end
    end)

    -- Wait for result with timeout
    local startTime = tick()
    local TIMEOUT = 30

    dbg("Waiting for result (timeout:", TIMEOUT, "s)...")
    while not resultReady do
        if tick() - startTime > TIMEOUT then
            dbg("TIMEOUT after", TIMEOUT, "seconds at stage:", stage)
            scriptError = "Loader timed out after " .. TIMEOUT .. " seconds"
            break
        end
        task.wait(0.1)
    end
    dbg("Wait loop ended. Elapsed:", string.format("%.1f", tick() - startTime), "s")

    -- Clean up WebSocket
    pcall(function() ws:Close() end)

    -- Handle result
    if scriptError then
        dbg("FINAL ERROR:", scriptError)
        notify("Panda VSS", "Error: " .. scriptError, 10)
        return error("[Panda VSS] " .. scriptError)
    end

    if scriptResult then
        dbg("SUCCESS! Script length:", #scriptResult)
        notify("Panda VSS", "Script loaded successfully!", 3)
        dbg("Calling loadstring...")
        local fn, loadErr = loadstring(scriptResult)
        if fn then
            dbg("loadstring OK, executing script...")
            return fn()
        else
            dbg("FAILED: loadstring error:", tostring(loadErr))
            notify("Panda VSS", "Failed to load script: " .. tostring(loadErr), 10)
            return error("[Panda VSS] loadstring failed: " .. tostring(loadErr))
        end
    end

    dbg("FAILED: No result received")
    notify("Panda VSS", "Unknown error occurred", 10)
    return error("[Panda VSS] No result received")
end

-- Seed random
math.randomseed(tick() * 1000 + os.clock() * 100)

-- Execute
return main()
