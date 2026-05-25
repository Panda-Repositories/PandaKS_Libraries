local HttpService = game:GetService("HttpService")
local ENDPOINT  = "https://secure.pandauth.com/v2_validation"
local GETKEY    = "https://pandauth.com/getkey"
local SERVICE   = "YOUR_SERVICE_ID"

_G.PandaVersion = "2.0.5_Legacy_May2026"

local httpRequest = (syn and syn.request) or http_request or request
local clipboard   = setclipboard or toclipboard

local function getHWID()
    if gethwid then return gethwid() end
    return game:GetService("RbxAnalyticsService"):GetClientId()
end

local PandaV2 = {}

function PandaV2.Configure(serviceId)
    SERVICE = serviceId
end

function PandaV2.Validate(key, requirePremium)
    local response = httpRequest({
        Url     = ENDPOINT,
        Method  = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body    = HttpService:JSONEncode({
            serviceid = SERVICE,
            hwid      = getHWID(),
            key       = key,
        }),
    })

    local data = HttpService:JSONDecode(response.Body)
    local authenticated = data.Status == "Authenticate"

    if authenticated and requirePremium and not data.Is_Premium then
        return false, data
    end

    return authenticated, data
end

function PandaV2.GetKey()
    local url = ("%s?service=%s&hwid=%s"):format(GETKEY, SERVICE, getHWID())
    if clipboard then clipboard(url) end
    return url
end

function PandaV2.HWID()
    return getHWID()
end

getgenv().PandaV2 = PandaV2


return PandaV2
