print("[Ashton's Gun Shop] Shared File Loaded.")
GUNSHOP = GUNSHOP or {}
GUNSHOP.Theme = { -- Gun shop color themes.
	["bg"] = Color(0,0,0,200), -- The background of the menu color.
	["pb"] = Color(0,200,0,255), -- The purchase button color.
	["itemtext"] = Color(255,255,255), -- The item name text color.
	["descriptiontext"] = Color(214,230,63), -- The item description text color.
	["pricetext"] = Color(255,0,0), -- The item price text color.
}
GUNSHOP.Items = { -- Items in the gun shop.
	{
		itemtype = "weapon", -- The type of the item we want (weapon or entity)
		name = "Glock", -- The name of the item in the menu.
		classname = "weapon_glock2", -- The classname of the item.
		description = "A simple handgun very cheap and very reliable", -- A simple rundown of the item.
		price = 2500, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
	{
		itemtype = "weapon", -- The type of the item we want (weapon or entity)
		name = "AK-47", -- The name of the item in the menu.
		classname = "weapon_ak472", -- The classname of the item.
		description = "A Automatic Rifle.", -- A simple rundown of the item.
		price = 10000, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Rifle Ammo", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "Automatic Rifle Rounds.", -- A simple rundown of the item.
		price = 250, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Rocket Ammo", -- The name of the item in the menu.
		classname = "item_rpg_round", -- The classname of the item.
		description = "Rocket Rounds.", -- A simple rundown of the item.
		price = 5000, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Pistol Ammo", -- The name of the item in the menu.
		classname = "item_ammo_pistol", -- The classname of the item.
		description = "A box of Pistol Rounds.", -- A simple rundown of the item.
		price = 5000, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "SMG Ammo", -- The name of the item in the menu.
		classname = "item_ammo_smg1", -- The classname of the item.
		description = "A box of SMG Rounds.", -- A simple rundown of the item.
		price = 5000, -- Price of the item.
		usergroup = "user", -- Required rank to be able to buy this item.
	},
}
