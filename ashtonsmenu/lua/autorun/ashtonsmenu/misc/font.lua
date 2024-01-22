function AshtonMenu:CreateFont(name, size, weight)
	surface.CreateFont("AshtonsMenu." .. name, {
		font = "Roboto",
		size = size or 16,
		weight = weight or 500
	})
end