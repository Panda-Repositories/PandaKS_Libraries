print("________________________________________________________________")
print("Panda Virtual Script (Failed to Load the Script, Initialize Diagnostic GUI)")
print("________________________________________________________________")
local Url = "https://httpbin.org/get"
local DataFetch = request({
    Url = Url,
    Method = "GET"
})
local http_service = cloneref(game:GetService("HttpService"))

    local JsonData = http_service:JSONDecode(DataFetch.Body)

    local UserAgent = JsonData["headers"]["User-Agent"] or "Unknown"

    print("________________________________________________________________")
    print("User-Agent: " .. UserAgent)

    -- Fix: you must call the function identifyexecutor()
    if identifyexecutor then
        local executor = identifyexecutor()
        print("Executor: " .. (executor or "Not Available"))
    else
        print("Executor: Not Available")
    end

    print("________________________________________________________________")
    print("Data from HTTPGET:")

    local Headers = JsonData["headers"]
    for key, value in pairs(Headers) do
        warn(key .. ": " .. value)
    end

print("________________________________________________________________")
print("Please Report this to the Panda-Pelican Developer (Screenshot), Thank you")
print("________________________________________________________________")
wait(0.2)
game.StarterGui:SetCore("SendNotification", {
Title = "Panda Vanguard Error"; -- the title 
Text = "Please Check your Console"; -- what the text says 
Duration = 5; -- how long the notification should in secounds
})