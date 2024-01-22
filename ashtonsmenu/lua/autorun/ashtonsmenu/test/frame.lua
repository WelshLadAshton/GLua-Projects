AshtonMenu.Tests.Frame = function()
	local frame = vgui.Create("AshtonMenu.Frame")
	frame:SetSize(800, 600)
	frame:Center()
	frame:MakePopup()
	--frame:SetTitle("AshtonMenu - Frame")
end

concommand.Add("ashtonmenu_frame", AshtonMenu.Tests.Frame)