local PandaAuth = {}

local CustomHeaders = {
    ["Content-Type"] = "application/json",
    ["x-req-id"] = "A7B9C2D5E8F3G6H1J4K7L0M3N6P9Q2R5S8T1U4V7W0X3Y6Z9",
    ["x-trace"] = "L2M4N6P8Q0R2S4T6U8V0W2X4Y6Z8A0B2C4D6E8F0G2H4J6K8",
    ["x-session-meta"] = "T7U9V2W5X8Y3Z6A1B4C7D0E3F6G9H2J5K8L1M4N7P0Q3R6S9",
    ["x-client-hash"] = "F5G7H9J2K4L6M8N0P2Q4R6S8T0U2V4W6X8Y0Z2A4B6C8D0E2",
    ["x-device-info"] = "R9S1T3U5V7W9X1Y3Z5A7B9C1D3E5F7G9H1J3K5L7M9N1P3",
    ["x-analytics-id"] = "K8L0M2N4P6Q8R0S2T4U6V8W0X2Y4Z6A8B0C2D4E6F8G0H2",
    ["x-request-context"] = "D1E3F5G7H9J1K3L5M7N9P1Q3R5S7T9U1V3W5X7Y9Z1A3B5",
    ["x-metrics"] = "W4X6Y8Z0A2B4C6D8E0F2G4H6J8K0L2M4N6P8Q0R2S4T6U8V0",
    ["x-correlation"] = "P6Q8R0S2T4U6V8W0X2Y4Z6A8B0C2D4E6F8G0H2J4K6L8M0N2"
}

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")


function PandaAuth.GenerateKey(service_id, prov_hwid)
    if not service_id or not prov_hwid then
        warn("[Warning] - Service ID or HWID is required")
        return ""
    end

    local success, result = pcall(function()
        -- Get hardware ID or fallback to player ID
        local Hardware_ID =  tostring(prov_hwid)
        local SecuredGetKey = "https://pandadevelopment.net/api/revenue-mode?service=" .. service_id
    
        local DataFetch = request({
            Url = SecuredGetKey,
            Headers = CustomHeaders,
            Method = "GET"
        })
    
        if DataFetch.Success then
            local responseJson = HttpService:JSONDecode(DataFetch.Body)
            local BS = responseJson.revenueMode or ""
    
            if BS == "SECUREDLINKVERTISE" then
                return "https://pandadevelopment.net/getkey/proceed_hwid?service=" .. service_id .. "&hwid=" .. Hardware_ID
            end
        end
    
        return "https://pandadevelopment.net/getkey?service=" .. service_id .. "&hwid=" .. Hardware_ID
    end)
    
    if success then
        return result
    else
        warn("[PandaAuth Warning] - Exception occurred while getting key:", result)
        return "https://pandadevelopment.net/getkey?service=" .. service_id .. "&hwid=" .. Hardware_ID
    end
end

return PandaAuth