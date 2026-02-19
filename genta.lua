-- [[ GENTA HAX | t.me/cheatganta ]] --
-- [[ MASTER TEMPLATE FOR ENCRYPTION ]] --

local player = game.Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local remotes = RS:WaitForChild("Remotes")

-- [[ SETTINGS ]] --
local PASTEBIN_KEY_URL = "https://pastebin.com/raw/BsgL11jg"
local TELEGRAM = "t.me/cheatganta"

-- [[ LOGIN UI ]] --
local sg_login = Instance.new("ScreenGui", game:GetService("CoreGui"))
local loginFrame = Instance.new("Frame", sg_login)
loginFrame.Size = UDim2.new(0, 320, 0, 220); loginFrame.Position = UDim2.new(0.5, -160, 0.4, -110)
loginFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", loginFrame)
local stroke = Instance.new("UIStroke", loginFrame); stroke.Color = Color3.fromRGB(255, 0, 0); stroke.Thickness = 1.5

local title = Instance.new("TextLabel", loginFrame)
title.Size = UDim2.new(1, 0, 0, 45); title.Text = "GENTA HAX - LOGIN"; title.TextColor3 = Color3.new(1,0,0); title.Font = Enum.Font.GothamBold; title.BackgroundTransparency = 1

local keyIn = Instance.new("TextBox", loginFrame)
keyIn.Size = UDim2.new(0.8, 0, 0, 35); keyIn.Position = UDim2.new(0.1, 0, 0.35, 0); keyIn.PlaceholderText = "Input Key..."; keyIn.BackgroundColor3 = Color3.fromRGB(20,20,20); keyIn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", keyIn)

local loginBtn = Instance.new("TextButton", loginFrame)
loginBtn.Size = UDim2.new(0.8, 0, 0, 35); loginBtn.Position = UDim2.new(0.1, 0, 0.58, 0); loginBtn.Text = "LOGIN"; loginBtn.BackgroundColor3 = Color3.fromRGB(255,0,0); loginBtn.TextColor3 = Color3.new(1,1,1); loginBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", loginBtn)

-- [[ MAIN HACK FUNCTION ]] --
local function RunMainScript()
    sg_login:Destroy()
    -- MASUKKIN SEMUA FITUR GENTA HAX V85 LU DI SINI --
    -- Pastikan semua _G variable, Loop, dan HookMetamethod ada di dalam fungsi ini --
    print("GENTA HAX LOADED SUCCESSFULLY!")
    
    -- Contoh Notif
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Genta Hax",
        Text = "Premium Script Active!",
        Duration = 5
    })
end

-- [[ LOGIN VALIDATION ]] --
loginBtn.MouseButton1Click:Connect(function()
    local success, content = pcall(function() return game:HttpGet(PASTEBIN_KEY_URL) end)
    if success then
        local data = content:split("|")
        local correctKey = data[1]
        local expiry = data[2]:split("-")
        local expiryTime = os.time({year = expiry[1], month = expiry[2], day = expiry[3]})
        
        if keyIn.Text == correctKey then
            if os.time() <= expiryTime then
                RunMainScript()
            else
                loginBtn.Text = "KEY EXPIRED!"; task.wait(2); loginBtn.Text = "LOGIN"
            end
        else
            loginBtn.Text = "INVALID KEY!"; task.wait(2); loginBtn.Text = "LOGIN"
        end
    else
        loginBtn.Text = "SERVER ERROR!"; task.wait(2); loginBtn.Text = "LOGIN"
    end
end)