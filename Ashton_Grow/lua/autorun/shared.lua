print("[Ashton's Grow] Shared File Loaded.")
GROWMENU = GROWMENU or {}
GROWMENU.Theme = { -- Gun shop color themes.
	["bg"] = Color(0,0,0,200), -- The background of the menu color.
	["pb"] = Color(0,200,0,255), -- The purchase button color.
	["itemtext"] = Color(255,255,255), -- The item name text color.
	["descriptiontext"] = Color(214,230,63), -- The item description text color.
	["pricetext"] = Color(255,0,0), -- The item price text color.
}
GROWMENU.Items = { -- Items in the gun shop.
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Flower Pot", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "A flower pot... maybe you can grow some flowers??", -- A simple rundown of the item.
		price = 500, -- Price of the item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Bucket Pot", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "A bucket for people who can't afford a Flower Pot.", -- A simple rundown of the item.
		price = 50, -- Price of the item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Soil", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "Soil some people use it for growing things.", -- A simple rundown of the item.
		price = 500, -- Price of the item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Water Bottle", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "A bottle fill of water.", -- A simple rundown of the item.
		price = 500, -- Price of the item.
	},
	{
		itemtype = "entity", -- The type of the item we want (weapon or entity)
		name = "Stardawg Seed", -- The name of the item in the menu.
		classname = "placeholder", -- The classname of the item.
		description = "You get what you pay for.", -- A simple rundown of the item.
		price = 500, -- Price of the item.
	},

}