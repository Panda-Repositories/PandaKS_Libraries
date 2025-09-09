function KickScript(message)
    game:GetService("Players").LocalPlayer:Kick(message)
end

if Verification_Status ~= nil then
    if VerifiedStatus == 2 and SlugID ~= nil then
        -- This will attempt to run the script in POST-Mode
        local DataFetch = request({
            Url = "https://pandadevelopment.net/virtual/file/" .. SlugID,
            Method = "POST",
            Headers = {
                ["executorId"] = identifyexecutor() or "",
                ["hwid"] = gethwid() or tostring(rbx_analytics_service:GetClientId()):gsub("-", ""),
            }
        })
        if DataFetch.Success then
            loadstring(DataFetch.Body)()
        end
    else if VerifiedStatus == 4 then
        -- Script Not Found
        KickScript("The Following Script isn't found on the Server or it was already deleted")
    else if VerifiedStatus == 3 then
        -- User had to Execute the GET-Mode before POST-Mode
        KickScript("Failed to Verify Script-Integrity, Please Run the Script again, Make sure you're using loadstring")
    else
        KickScript("Missing Parameter / Invalid Verification Status")
    end
else
    KickScript("Unsupported Client Execution (" + identifyexecutor() + ")/ Invalid Verification Status")
end
