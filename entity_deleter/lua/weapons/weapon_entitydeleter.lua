if CLIENT then
    SWEP.PrintName = "Entity Deleter"
    SWEP.Slot = 1
    SWEP.SlotPos = 1
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
end

SWEP.Base = "weapon_base"
SWEP.Author = "WelshLadAshton"
SWEP.Purpose = "Deletes entities on right-click."
SWEP.Instructions = "Right-click to delete entities."

SWEP.Category = "Entity Deleter" 

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_crowbar.mdl" 
SWEP.WorldModel = "models/weapons/w_crowbar.mdl" 
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.ShowDistance = false

function SWEP:DrawHUD()
    if not IsValid(self.Owner) then return end

    local trace = self.Owner:GetEyeTrace()

    if IsValid(trace.Entity) then
        local entityName = tostring(trace.Entity) or "Unknown"
        local className = trace.Entity:GetClass() or "Unknown"
        local distance = math.Round(self.Owner:GetPos():Distance(trace.HitPos))
        local hp = trace.Entity:GetMaxHealth() or "Unknown"
        local text = "Entity Name: " .. entityName .. "\nClass: " .. className .. "\nDistance: " .. distance .. " units " .. hp .. "%"

        surface.SetFont("DermaDefault")
        surface.SetTextColor(255, 255, 255, 255)

        local x = ScrW() / 2
        local y = ScrH() - 40

        local _, lineHeight = surface.GetTextSize("A")

        surface.SetTextPos(x, y)
        surface.DrawText(text)

        surface.SetTextPos(x, y + lineHeight)
        surface.DrawText("Class: " .. className)

        surface.SetTextPos(x, y + 2 * lineHeight)
        surface.DrawText("Distance: " .. distance .. " units")
    end
end

function SWEP:PrimaryAttack()
    -- N/A Maybe add in a future update.
end

function SWEP:SecondaryAttack()
    local trace = self.Owner:GetEyeTrace()

    if IsValid(trace.Entity) and trace.Entity:IsPlayer() then
        return
    end

    if SERVER and IsValid(trace.Entity) then
        trace.Entity:Remove()
    end

    self:SetNextSecondaryFire(CurTime() + 1)
end

function SWEP:Reload()
    -- N/A Maybe add in a future update.
end
