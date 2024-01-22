include("autorun/shared.lua")
print("[Ashton's Grow] Client File Loaded.")

surface.CreateFont("growmenu_24_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 24,
	weight = 500,
})

surface.CreateFont("growmenu_17_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 17,
	weight = 500,
})

surface.CreateFont("growmenu_15_500", { -- Font
	font = "Roboto",
	extended = false,
	size = 15,
	weight = 500,
})

function GROWMENU.Open() -- Creates the menu and opens it
	local scrw, scrh = ScrW(), ScrH()
	GROWMENU.Menu = vgui.Create("DFrame")
	GROWMENU.Menu:SetSize(scrw * .5, scrh * .8)
	GROWMENU.Menu:Center()
	GROWMENU.Menu:SetTitle("")
	GROWMENU.Menu:MakePopup()
	GROWMENU.Menu.Paint = function(me,w,h)
		surface.SetDrawColor(GROWMENU.Theme["bg"])
		surface.DrawRect(0,0,w,h)
		draw.SimpleText("Ashton's Grow Shop", "growmenu_24_500", w / 2, h * .02, GROWMENU.Theme["itemtext"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local scroll = vgui.Create("DScrollPanel", GROWMENU.Menu)
	scroll:Dock(FILL)
	local frameH = GROWMENU.Menu:GetTall()
	local frameW = GROWMENU.Menu:GetWide()
	local yspace = frameH * .01
	for k,itemData in pairs(GROWMENU.Items) do
		local itemPanel = vgui.Create("DPanel", scroll)
		itemPanel:DockMargin(0, 0, 0, yspace)
		itemPanel:Dock(TOP)
		itemPanel:SetTall(frameH * .1)
		itemPanel.Paint = function(me,w,h)
			surface.SetDrawColor(GROWMENU.Theme["bg"])
			surface.DrawRect(0,0,w,h)
			draw.SimpleText(itemData.name, "growmenu_17_500", w * .03, h * .22, GROWMENU.Theme["itemtext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(itemData.description, "growmenu_17_500", w * .03, h * .53, GROWMENU.Theme["descriptiontext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(DarkRP.formatMoney(itemData.price), "growmenu_17_500", w * .03, h * .83, GROWMENU.Theme["pricetext"], TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end

		local marginSpace = frameW * .02
		local purchaseBtn = vgui.Create("DButton", itemPanel)
		purchaseBtn:Dock(RIGHT)
		purchaseBtn:SetWide(frameW * .15)
		purchaseBtn:DockMargin(0, marginSpace, marginSpace, marginSpace)
		purchaseBtn:SetText("")
		purchaseBtn.Paint = function(me,w,h)
			surface.SetDrawColor(GROWMENU.Theme["pb"])
			surface.DrawRect(0,0,w,h)
			draw.SimpleText("Purchase", "growmenu_15_500", w / 2, h / 2, GROWMENU.Theme["itemtext"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		purchaseBtn.DoClick = function()
			net.Start("growmenu_purchase")
			net.WriteInt(k, 32)
			net.SendToServer()
		end
	end
end

concommand.Add("ashtons_gmenu", function()
	GUNSHOP.Open()
end)