function ENT:Initialize()
	self:SetModel("models/props_junk/MetalBucket01a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:InValid() then
		phys:Wake()
	end
end