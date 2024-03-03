local APILoader = {}

local http_service = cloneref(game:GetService("HttpService"))
local json = game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/LibraryConfig/ApiServiceConfiguration.json") 
local configuration = http_service:JSONDecode(json)
local mainUrl = configuration.Server_Domain.Main_URL

function APILoader:RunLibraries(version)
    local PandaAuth

    if version == "v3" then
        PandaAuth = loadstring(game:HttpGet(configuration.API_Configuration.v3_Library))()
    elseif version == "v4" then
        PandaAuth = loadstring(game:HttpGet(configuration.API_Configuration.v4_Library))()
    else
        PandaAuth = loadstring(game:HttpGet(configuration.API_Configuration.v2_Library))()
    end

    return PandaAuth
end

if getgenv().PelicanKeySys_Version == nil then
  return APILoader:RunLibraries("v2")
elseif getgenv().PelicanKeySys_Version == "v3" then
  return APILoader:RunLibraries("v3")
elseif getgenv().PelicanKeySys_Version == "v4" then
  return APILoader:RunLibraries("v4")
else
  return APILoader:RunLibraries("v2")
end


return APILoader
