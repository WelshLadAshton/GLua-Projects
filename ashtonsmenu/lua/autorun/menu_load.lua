AshtonMenu = AshtonMenu or {}
AshtonMenu.Dir = "ashtonsmenu"
AshtonMenu.Tests = {}

function AshtonMenu:IncludeClient(path)
	local str = self.Dir .. "/" .. path .. ".lua"

	print("Including AshtonsMenu File", str)

	if (CLIENT) then
		include(str)
	end

	if (SERVER) then
		AddCSLuaFile(str)
	end
end

-- Files
AshtonMenu:IncludeClient("settings/theme") -- Loads The Themes File
AshtonMenu:IncludeClient("thirdparty/bshadows") -- Loads The BShadows File
AshtonMenu:IncludeClient("misc/font") -- Loads The Font File
AshtonMenu:IncludeClient("elements/frame") -- Loads Frame File
AshtonMenu:IncludeClient("test/frame") -- Loads Frame File