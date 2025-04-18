local PandaAuth = {}

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")


function PandaAuth.GenerateKey(service_id, prov_hwid)
    if not service_id  or prov_hwid then
        warn("[Warning] - Service ID or HWID is required")
    end
    
    local success, result = pcall(function()
        -- Get hardware ID or fallback to player ID
        local Hardware_ID =  tostring(prov_hwid)
        local SecuredGetKey = "https://pandadevelopment.net/api/revenue-mode?service=" .. service_id
    
        local DataFetch = request({
            Url = SecuredGetKey,
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