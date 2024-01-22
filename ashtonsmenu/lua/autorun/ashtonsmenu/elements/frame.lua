local PANEL = {}

function PANEL:Init()
	self.header = self:Add("Panel")
	self.header:Dock(TOP)
	self.header.Paint = function(pnl, w, h)
		draw.RoundedBoxEx(6,0,0,w,h, AshtonMenu.Theme.primary, true, true, false, false)
	end
	self.header.closeBtn = self.header:Add("DButton")
	self.header.closeBtn:Dock(RIGHT)
	self.header.closeBtn.DoClick = function(pnl)
		self:Remove()
	end
	self.header.closeBtn.margin = 16
	self.header.closeBtn.Paint = function(pnl, w, h)
		surface.SetDrawColor(AshtonMenu.Theme.closeBtn)
		surface.SetMaterial()
	end
end

function PANEL:PerformLayout(w, h)
	self.header:SetTall(AshtonMenu.UISizes.navbar.height)
end

function PANEL:Paint(w,h)
	local aX, aY = self:LocalToScreen()

	BSHADOWS.BeginShadow()
		draw.RoundedBox(6, aX, aY, w, h, AshtonMenu.Theme.background)
	BSHADOWS.EndShadow(1, 2, 2)
end

vgui.Register("AshtonMenu.Frame", PANEL, "EditablePanel")