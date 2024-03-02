local http_service = cloneref(game:GetService("HttpService"))
local json = game:HttpGet("https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/main/LibraryConfig/ApiServiceConfiguration.json") 

function RunLibraries(version)
  if version == "v3" then
    mainUrl = configuration.API_Configuration.v3_Library
  elseif version == "v4" then
    mainUrl = configuration.API_Configuration.v4_Library
  else
    mainUrl = configuration.API_Configuration.v2_Library
  end
end



local configuration = http_service:JSONDecode(json)

local mainUrl = configuration.Server_Domain.Main_URL

-- Attempt to fetch the Main URL
local success, response = pcall(function()
    return game:HttpGet(mainUrl)
end)

if success then
    print("Main URL successfully fetched:", mainUrl)
    -- Use the fetched URL
    -- Your logic here
else
    print("Failed to fetch Main URL, falling back to Backup URL:", configuration.Server_Domain.Backup_URL)
    mainUrl = configuration.Server_Domain.Backup_URL
    -- Your logic here using the backup URL
end
