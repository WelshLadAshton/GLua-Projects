include("autorun/shared.lua")
print("[Ashton's Gun Shop] Client Main File Loaded.")

surface.CreateFont("gunshop_24_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 24,
	weight = 500,
})

surface.CreateFont("gunshop_17_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 17,
	weight = 500,
})

surface.CreateFont("gunshop_15_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 15,
	weight = 500,
})

function GUNSHOP.Open() -- Creates the menu and opens it
	local scrw, scrh = ScrW(), ScrH()
	GUNSHOP.Menu = vgui.Create("DFrame")
	GUNSHOP.Menu:SetSize(scrw * .5, scrh * .8)
	GUNSHOP.Menu:Center()
	GUNSHOP.Menu:SetTitle("")
	GUNSHOP.Menu:MakePopup()
	GUNSHOP.Menu.Paint = function(me,w,h)
		surface.SetDrawColor(GUNSHOP.Theme["bg"])
		surface.DrawRect(0,0,w,h)
		draw.SimpleText("Ashton's Gun Shop", "gunshop_24_500", w / 2, h * .02, GUNSHOP.Theme["itemtext"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", GUNSHOP.Menu)
	scroll:Dock(FILL)
	local frameH = GUNSHOP.Menu:GetTall()
	local frameW = GUNSHOP.Menu:GetWide()
	local yspace = frameH * .01
	for k,itemData in pairs(GUNSHOP.Items) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall(frameH * .1)
		itemPanel.Paint = function(me,w,h)
			surface.SetDrawColor(GUNSHOP.Theme["bg"])
			surface.DrawRect(0,0,w,h)
			draw.SimpleText(itemData.name, "gunshop_17_500", w * .03, h * .22, GUNSHOP.Theme["itemtext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(itemData.description, "gunshop_17_500", w * .03, h * .53, GUNSHOP.Theme["descriptiontext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(DarkRP.formatMoney(itemData.price), "gunshop_17_500", w * .03, h * .83, GUNSHOP.Theme["pricetext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end

		local marginSpace = frameW * .02
		local purchaseBtn = vgui.Create("DButton", itemPanel)
		purchaseBtn:Dock(RIGHT)
		purchaseBtn:SetWide(frameW * .15)
		purchaseBtn:DockMargin(0, marginSpace, marginSpace, marginSpace)
		purchaseBtn:SetText("")
		purchaseBtn.Paint = function(me,w,h)
			surface.SetDrawColor(GUNSHOP.Theme["pb"])
			surface.DrawRect(0,0,w,h)
			draw.SimpleText("Purchase", "gunshop_15_500", w / 2, h / 2, GUNSHOP.Theme["itemtext"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		purchaseBtn.DoClick = function()
			net.Start("gunshop_purchase")
			net.WriteInt(k, 32)
			net.SendToServer()
		end
	end
end

concommand.Add("ashtons_gshop", function() -- Adds a console command.
	GUNSHOP.Open() -- Runs the GUNSHOP.Open function
end)