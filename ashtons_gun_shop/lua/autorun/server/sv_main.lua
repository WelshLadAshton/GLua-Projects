include("autorun/shared.lua")
print("[Ashton's Gun Shop] Server Main File Loaded.")

util.AddNetworkString("gunshop_purchase")

net.Receive("gunshop_purchase", function(len, ply)
	local id = net.ReadInt(32)
	local itemData = GUNSHOP.Items[id]
	if not itemData then return end

	local isWeapon = itemData.itemtype == "weapon"
	local isEntity = itemData.itemtype == "entity"
	--local getGroup = itemData.usergroup
	local canAfford = ply:canAfford(itemData.price)
	local hasWeapon = ply:HasWeapon(itemData.classname)
	if not canAfford then
		ply:ChatPrint("You do not have enough funds...")
		return
	end
	if hasWeapon then 
		ply:ChatPrint("You could not purchase this item...")
		return
	end
	ply:addMoney(-itemData.price)
	ply:ChatPrint("Purchase Completed...")
	if isWeapon then
		ply:Give(itemData.classname)
	end
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