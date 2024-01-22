include("autorun/shared.lua")
print("[Ashton's Grow] Server File Loaded.")

util.AddNetworkString("growmenu_purchase")

net.Receive("growmenu_purchase", function(len, ply)
	local id = net.ReadInt(32)
	local itemData = GUNSHOP.Items[id]
	if not itemData then return end

	local isEntity = itemData.itemtype == "entity"
	local canAfford = ply:canAfford(itemData.price)
	local hasWeapon = ply:HasWeapon(itemData.classname)
	if not canAfford then
		ply:ChatPrint("You do not have enough funds...")
		return
	end
	ply:addMoney(-itemData.price)
	ply:ChatPrint("Purchase Completed...")
	if isEntity then
		local trace = {}
		trace.start = ply:EyePos()
		trace.endpos = trace.start + ply:GetAimVector() * 85
		trace.filter = ply
		local tr = util.TraceLine(trace)
		local item = ents.Create(itemData.classname)
		item:SetPos(tr.HitPos)
		item:Spawn()
	end
end)