
while not game:IsLoaded() do
	task.wait(.1);
end;
(getgenv()).Salawaui = (getgenv()).Salawaui or {};
(getgenv()).Salawaui.NamecallBackup = nil;
pcall(function()
	local b = getrawmetatable(game);
	if not b then
		return;
	end;
	local X = b.__namecall;
	if not X then
		return;
	end;
	(getgenv()).Salawaui.NamecallBackup = X;
	local o = nil;
	pcall(function()
		o = isreadonly(b);
	end);
	pcall(function()
		setreadonly(b, false);
	end);
	local B = checkcaller;
	local V = getnamecallmethod;
	local m = tostring;
	local K = pcall;
	local G = wait;
	b.__namecall = newcclosure(function(b, ...)
			if B() then
				return X(b, ...);
			end;
			local o = V();
			if o == "FireServer" then
				local o = ...;
				if m(o) == "MainEvent" then
					local b, X = ...;
					if X ~= nil then
						return G(9000000000);
					end;
				end;
				return X(b, ...);
			end;
			if o == "GetService" or o == "FindFirstChild" then
				local b = nil;
				K(function()
					b = getfenv(1);
				end);
				if b and (b.crash ~= nil and b.checkChild ~= nil) then
					K(function()
						(getcallingscript()):Destroy();
					end);
					return G(9000000000);
				end;
			end;
			return X(b, ...);
		end);
	if o ~= nil then
		pcall(function()
			setreadonly(b, o);
		end);
	else
		pcall(function()
			setreadonly(b, true);
		end);
	end;
end);
pcall(function()
	for b, X in pairs(getgc(true)) do
		if typeof(X) ~= "table" then
			continue;
		end;
		local o = rawget(X, "indexInstance") or rawget(X, "namecallInstance");
		if o and (typeof(o) == "table" and typeof(o[2]) == "function") then
			local b = o[1] or "";
			if b == "kick" or (type(b) == "string" and (((b:lower()):find("namecall") or (b:lower()):find("index")))) then
				pcall(function()
					hookfunction(o[2], function()
						return false;
					end);
				end);
			end;
		end;
		local B = rawget(X, "Detected");
		if typeof(B) == "function" then
			pcall(function()
				hookfunction(B, function()
					return true;
				end);
			end);
		end;
		local V = rawget(X, "Kill");
		local m = rawget(X, "Variables");
		if typeof(V) == "function" and (m and (typeof(m) == "table" and m.Adonis)) then
			pcall(function()
				hookfunction(V, function()
 
				end);
			end);
		end;
	end;
end);
local b = (loadstring(game:HttpGet("https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/Source.lua")))();
local X = (loadstring(game:HttpGet("https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/ThemeManager.lua")))();
local o = (loadstring(game:HttpGet("https://raw.githubusercontent.com/visnoukkk/Creep.cc/refs/heads/main/addons/SaveManager.lua")))();
local B = b:CreateWindow({
		Title = "Salawaui.cc",
		Center = true,
		AutoShow = true,
		TabPadding = 8,
		MenuFadeTime = .2,
	});
local V = {
		Combat = B:AddTab("Combat"),
		Visual = B:AddTab("Visual"),
		Misc = B:AddTab("Misc"),
		Custom = B:AddTab("Custom"),
		Ui = B:AddTab("Ui"),
	};
local m = game:GetService("RunService");
local K = game:GetService("Players");
local G = game:GetService("UserInputService");
local E = game:GetService("Lighting");
local j = workspace.CurrentCamera;
local d = K.LocalPlayer;
local function R(b, X)
	if b and b[X] then
		return b[X].Value == true;
	end;
	return false;
end;
local function n(b, X, o)
	if b and (b[X] and type(b[X].Value) == "string") then
		return b[X].Value;
	end;
	return o;
end;
local function v(b, X, o)
	if b and (b[X] and type(b[X].Value) == "number") then
		return b[X].Value;
	end;
	return o;
end;
local function a(b, X, o)
	if b and (b[X] and typeof(b[X].Value) == "Color3") then
		return b[X].Value;
	end;
	return o;
end;
local function C(b)
	local X = {
			UI = 4,
			["UI Bold"] = 4,
			System = 1,
			Plex = 7,
			Monospace = 9,
		};
	return X[b] or 4;
end;
local function l(b, X)
	if b == 0 and X == 0 then
		return;
	end;
	if mouse and (type(mouse) == "table" and mouse.move) then
		pcall(mouse.move, b, X);
		return;
	end;
	if syn and (syn.mouse and syn.mouse.move) then
		pcall(function()
			syn.mouse.move(b, X);
		end);
		return;
	end;
	if getgenv then
		local o = getgenv();
		if o.mouse and (type(o.mouse) == "table" and o.mouse.move) then
			pcall(o.mouse.move, b, X);
			return;
		end;
		if o.mousemoverel then
			pcall(o.mousemoverel, b, X);
			return;
		end;
	end;
end;
local function D(b)
	if not b or b == d then
		return true;
	end;
	local X = d;
	if X.Team and (b.Team and X.Team == b.Team) then
		return true;
	end;
	if X.TeamColor == b.TeamColor then
		return true;
	end;
	return false;
end;
local S = RaycastParams.new();
S.FilterType = Enum.RaycastFilterType.Exclude;
local function O(b, X)
	if not b or not X then
		return false;
	end;
	local o = j.CFrame.Position;
	S.FilterDescendantsInstances = { j, d.Character, b };
	local B = workspace:Raycast(o, X.Position - o, S);
	if not B then
		return true;
	end;
	return B.Instance and B.Instance:IsDescendantOf(b) == true;
end;
local q = V.Combat:AddLeftGroupbox("Aimbot");
(q:AddToggle("AimbotEnabled", { Text = "Enabled", Default = false, Callback = function()
 
	end })):AddKeyPicker("AimbotKey", {
	Default = "E",
	Mode = "Hold",
	Text = "Aimbot",
	NoUI = false,
	Callback = function()
 
	end,
});
q:AddToggle("AimbotTeamCheck", { Text = "Team Check", Default = false, Callback = function()
 
	end });
q:AddToggle("AimbotVisibleCheck", { Text = "Visible Check", Default = false, Callback = function()
 
	end });
q:AddToggle("AimbotFFCheck", { Text = "ForceField Check", Default = false, Callback = function()
 
	end });
q:AddToggle("AimbotDrawFOV", { Text = "Draw FOV", Default = false, Callback = function()
 
	end });
(q:AddLabel("FOV Color")):AddColorPicker("AimbotFOVColor", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
q:AddSlider("AimbotFOVSize", {
	Text = "FOV Size",
	Default = 120,
	Min = 10,
	Max = 600,
	Rounding = 0,
	Suffix = " px",
	Callback = function()
 
	end,
});
q:AddToggle("AimbotFOVFill", { Text = "FOV Fill", Default = false, Callback = function()
 
	end });
q:AddSlider("AimbotFOVFillStrength", {
	Text = "Fill Strength",
	Default = 20,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
(q:AddLabel("Fill Color 1")):AddColorPicker("AimbotFOVFillColor1", { Default = Color3.fromRGB(0, 200, 255), Callback = function()
 
	end });
(q:AddLabel("Fill Color 2")):AddColorPicker("AimbotFOVFillColor2", { Default = Color3.fromRGB(255, 0, 200), Callback = function()
 
	end });
q:AddSlider("AimbotSmoothness", {
	Text = "Smoothness",
	Default = 6,
	Min = 0,
	Max = 20,
	Rounding = 1,
	Callback = function()
 
	end,
});
q:AddSlider("AimbotPrediction", {
	Text = "Prediction",
	Default = 0,
	Min = 0,
	Max = 10,
	Rounding = 1,
	Callback = function()
 
	end,
});
q:AddDropdown("AimbotBones", {
	Text = "Target Bones",
	Default = 1,
	Multi = true,
	Values = {
		"Head",
		"UpperTorso",
		"LowerTorso",
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftHand",
		"RightUpperArm",
		"RightLowerArm",
		"RightHand",
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftFoot",
		"RightUpperLeg",
		"RightLowerLeg",
		"RightFoot",
		"HumanoidRootPart",
	},
	Callback = function()
 
	end,
});
local W = {
		Enabled = false,
		ClassName = "Silent Aim - Averiias, Stefanuk12, xaxa",
		ToggleKey = "RightAlt",
		TeamCheck = false,
		VisibleCheck = false,
		TargetPart = "HumanoidRootPart",
		SilentAimMethod = "Raycast",
		FOVRadius = 130,
		FOVVisible = false,
		ShowSilentAimTarget = false,
		MouseHitPrediction = false,
		MouseHitPredictionAmount = .165,
		HitChance = 100,
	};
(getgenv()).SilentAimSettings = W;
local A = workspace.CurrentCamera;
local H = game:GetService("Players");
local k = game:GetService("RunService");
local L = game:GetService("UserInputService");
local w = H.LocalPlayer;
local u = w:GetMouse();
local c = H.GetPlayers;
local z = A.WorldToScreenPoint;
local F = A.WorldToViewportPoint;
local g = A.GetPartsObscuringTarget;
local i = game.FindFirstChild;
local U = k.RenderStepped;
local T = L.GetMouseLocation;
local P = { "Head", "HumanoidRootPart" };
local I = .165;
local Y = Drawing.new("Square");
Y.Visible = true;
Y.ZIndex = 999;
Y.Color = Color3.fromRGB(54, 57, 241);
Y.Thickness = 20;
Y.Size = Vector2.new(20, 20);
Y.Filled = true;
local t = Drawing.new("Circle");
t.Thickness = 1;
t.NumSides = 100;
t.Radius = 180;
t.Filled = false;
t.Visible = false;
t.ZIndex = 999;
t.Transparency = 1;
t.Color = Color3.fromRGB(54, 57, 241);
local x = {
		FindPartOnRayWithIgnoreList = { ArgCountRequired = 3, Args = {
				"Instance",
				"Ray",
				"table",
				"boolean",
				"boolean",
			} },
		FindPartOnRayWithWhitelist = { ArgCountRequired = 3, Args = {
				"Instance",
				"Ray",
				"table",
				"boolean",
			} },
		FindPartOnRay = { ArgCountRequired = 2, Args = {
				"Instance",
				"Ray",
				"Instance",
				"boolean",
				"boolean",
			} },
		Raycast = { ArgCountRequired = 3, Args = {
				"Instance",
				"Vector3",
				"Vector3",
				"RaycastParams",
			} },
	};
function CalculateChance(b)
	b = math.floor(b);
	local X = math.floor((Random.new()).NextNumber(Random.new(), 0, 1) * 100) / 100;
	return X <= b / 100;
end;
local function p(b)
	local X, o = z(A, b);
	return Vector2.new(X.X, X.Y), o;
end;
local function J(b, X)
	local o = 0;
	if #b < X.ArgCountRequired then
		return false;
	end;
	for b, B in next, b do
		if typeof(B) == X.Args[b] then
			o = o + 1;
		end;
	end;
	return o >= X.ArgCountRequired;
end;
local function f(b, X)
	return ((X - b)).Unit * 1000;
end;
local function s()
	return T(L);
end;
local function M(b)
	local X = b.Character;
	local o = w.Character;
	if not ((X or o)) then
		return;
	end;
	local B = i(X, W.TargetPart) or i(X, "HumanoidRootPart");
	if not B then
		return;
	end;
	local V, m = { B.Position, o, X }, { o, X };
	local K = #g(A, V, m);
	return ((K == 0 and true) or (K > 0 and false));
end;
local function Z()
	if not W.TargetPart then
		return;
	end;
	local b, X;
	for o, B in next, c(H) do
		if B == w then
			continue;
		end;
		if W.TeamCheck and B.Team == w.Team then
			continue;
		end;
		local V = B.Character;
		if not V then
			continue;
		end;
		if W.VisibleCheck and not M(B) then
			continue;
		end;
		local m = i(V, "HumanoidRootPart");
		local K = i(V, "Humanoid");
		if not m or not K or K and K.Health <= 0 then
			continue;
		end;
		local G, E = p(m.Position);
		if not E then
			continue;
		end;
		local j = ((s() - G)).Magnitude;
		if j <= ((X or W.FOVRadius or 2000)) then
			b = ((W.TargetPart == "Random" and V[P[math.random(1, #P)]]) or V[W.TargetPart]);
			X = j;
		end;
	end;
	return b;
end;
local r = V.Combat:AddRightGroupbox("Silent Aim");
(r:AddToggle("SilentAim_Enabled", { Text = "Enabled", Default = false, Callback = function(b)
		W.Enabled = b;
		Y.Visible = b;
	end })):AddKeyPicker("SilentAim_ToggleKey", {
	Default = "RightAlt",
	Mode = "Toggle",
	Text = "Enabled",
	NoUI = false,
	Callback = function(b)
		W.Enabled = b;
		Y.Visible = b;
	end,
});
r:AddToggle("SilentAim_TeamCheck", { Text = "Team Check", Default = false, Callback = function(b)
		W.TeamCheck = b;
	end });
r:AddToggle("SilentAim_VisibleCheck", { Text = "Visible Check", Default = false, Callback = function(b)
		W.VisibleCheck = b;
	end });
r:AddDropdown("SilentAim_TargetPart", {
	Text = "Target Part",
	Default = "HumanoidRootPart",
	Values = { "Head", "HumanoidRootPart", "Random" },
	Callback = function(b)
		W.TargetPart = b;
	end,
});
r:AddDropdown("SilentAim_Method", {
	Text = "Silent Aim Method",
	Default = "Raycast",
	Values = {
		"Raycast",
		"FindPartOnRay",
		"FindPartOnRayWithWhitelist",
		"FindPartOnRayWithIgnoreList",
		"Mouse.Hit/Target",
	},
	Callback = function(b)
		W.SilentAimMethod = b;
	end,
});
r:AddSlider("SilentAim_HitChance", {
	Text = "Hit chance",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 1,
	Suffix = "%",
	Callback = function(b)
		W.HitChance = b;
	end,
});
r:AddToggle("SilentAim_FOVVisible", { Text = "Show FOV Circle", Default = false, Callback = function(b)
		t.Visible = b;
		W.FOVVisible = b;
	end });
(r:AddLabel("FOV Color")):AddColorPicker("SilentAim_FOVColor", { Default = Color3.fromRGB(54, 57, 241), Callback = function(b)
		t.Color = b;
	end });
r:AddSlider("SilentAim_FOVRadius", {
	Text = "FOV Circle Radius",
	Min = 0,
	Max = 360,
	Default = 130,
	Rounding = 0,
	Callback = function(b)
		t.Radius = b;
		W.FOVRadius = b;
	end,
});
r:AddToggle("SilentAim_ShowTarget", { Text = "Show Silent Aim Target", Default = false, Callback = function(b)
		Y.Visible = b;
		W.ShowSilentAimTarget = b;
	end });
(r:AddLabel("Target Color")):AddColorPicker("SilentAim_TargetColor", { Default = Color3.fromRGB(54, 57, 241), Callback = function(b)
		Y.Color = b;
	end });
r:AddToggle("SilentAim_Prediction", { Text = "Mouse.Hit/Target Prediction", Default = false, Callback = function(b)
		W.MouseHitPrediction = b;
	end });
r:AddSlider("SilentAim_PredictionAmount", {
	Text = "Prediction Amount",
	Min = .165,
	Max = 1,
	Default = .165,
	Rounding = 3,
	Callback = function(b)
		I = b;
		W.MouseHitPredictionAmount = b;
	end,
});
U:Connect(function()
	if W.ShowSilentAimTarget and W.Enabled then
		if Z() then
			local b = (Z()).Parent.PrimaryPart or Z();
			local X, o = F(A, b.Position);
			Y.Visible = o;
			Y.Position = Vector2.new(X.X, X.Y);
		else
			Y.Visible = false;
			Y.Position = Vector2.new();
		end;
	end;
	if W.FOVVisible then
		t.Visible = W.FOVVisible;
		t.Position = s();
	end;
end);
local Q;
Q = hookmetamethod(game, "__namecall", newcclosure(function(...)
		local b = getnamecallmethod();
		local X = { ... };
		local o = X[1];
		local B = CalculateChance(W.HitChance);
		if W.Enabled and (o == workspace and (not checkcaller() and B == true)) then
			if b == "FindPartOnRayWithIgnoreList" and W.SilentAimMethod == b then
				if J(X, x.FindPartOnRayWithIgnoreList) then
					local b = X[2];
					local o = Z();
					if o then
						X[2] = Ray.new(b.Origin, f(b.Origin, o.Position));
						return Q(unpack(X));
					end;
				end;
			elseif b == "FindPartOnRayWithWhitelist" and W.SilentAimMethod == b then
				if J(X, x.FindPartOnRayWithWhitelist) then
					local b = X[2];
					local o = Z();
					if o then
						X[2] = Ray.new(b.Origin, f(b.Origin, o.Position));
						return Q(unpack(X));
					end;
				end;
			elseif ((b == "FindPartOnRay" or b == "findPartOnRay")) and W.SilentAimMethod:lower() == b:lower() then
				if J(X, x.FindPartOnRay) then
					local b = X[2];
					local o = Z();
					if o then
						X[2] = Ray.new(b.Origin, f(b.Origin, o.Position));
						return Q(unpack(X));
					end;
				end;
			elseif b == "Raycast" and W.SilentAimMethod == b then
				if J(X, x.Raycast) then
					local b = X[2];
					local o = Z();
					if o then
						X[3] = f(b, o.Position);
						return Q(unpack(X));
					end;
				end;
			end;
		end;
		return Q(...);
	end));
local h = nil;
h = hookmetamethod(game, "__index", newcclosure(function(b, X)
		if b == u and (not checkcaller() and (W.Enabled and (W.SilentAimMethod == "Mouse.Hit/Target" and Z()))) then
			local o = Z();
			if X == "Target" or X == "target" then
				return o;
			elseif X == "Hit" or X == "hit" then
				return ((W.MouseHitPrediction and (o.CFrame + (o.Velocity * I))) or (not W.MouseHitPrediction and o.CFrame));
			elseif X == "X" or X == "x" then
				return b.X;
			elseif X == "Y" or X == "y" then
				return b.Y;
			elseif X == "UnitRay" then
				return Ray.new(b.Origin, ((b.Hit - b.Origin)).Unit);
			end;
		end;
		return h(b, X);
	end));
local y = V.Visual:AddLeftGroupbox("ESP");
y:AddToggle("ESPEnabled", { Text = "ESP Enabled", Default = false, Callback = function()
 
	end });
y:AddToggle("ESPBox", { Text = "Box", Default = false, Callback = function()
 
	end });
y:AddDropdown("ESPBoxMode", {
	Text = "Box Mode",
	Default = "Full",
	Values = { "Full", "Corner" },
	Callback = function()
 
	end,
});
(y:AddLabel("Box Color")):AddColorPicker("ESPBoxColor", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
y:AddSlider("ESPBoxThickness", {
	Text = "Box Thickness",
	Default = 1,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Callback = function()
 
	end,
});
y:AddToggle("ESPBoxFill", { Text = "Box Fill", Default = false, Callback = function()
 
	end });
(y:AddLabel("Stage 1")):AddColorPicker("ESPBoxFillColor1", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
(y:AddLabel("Stage 2")):AddColorPicker("ESPBoxFillColor2", { Default = Color3.fromRGB(200, 200, 255), Callback = function()
 
	end });
(y:AddLabel("Stage 3")):AddColorPicker("ESPBoxFillColor3", { Default = Color3.fromRGB(120, 150, 255), Callback = function()
 
	end });
(y:AddLabel("Stage 4")):AddColorPicker("ESPBoxFillColor4", { Default = Color3.fromRGB(50, 100, 255), Callback = function()
 
	end });
(y:AddLabel("Stage 5")):AddColorPicker("ESPBoxFillColor5", { Default = Color3.fromRGB(0, 100, 255), Callback = function()
 
	end });
y:AddSlider("ESPBoxFillTransparency", {
	Text = "Fill Transparency",
	Default = 70,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddDropdown("ESPBoxFillDirection", {
	Text = "Fill Direction",
	Default = "Top to Bottom",
	Values = { "Top to Bottom", "Bottom to Top" },
	Callback = function()
 
	end,
});
y:AddToggle("ESPSkeleton", { Text = "Skeleton", Default = false, Callback = function()
 
	end });
(y:AddLabel("Skeleton Color")):AddColorPicker("ESPSkeletonColor", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
y:AddSlider("ESPSkeletonTransparency", {
	Text = "Skeleton Transparency",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddSlider("ESPSkeletonThickness", {
	Text = "Skeleton Thickness",
	Default = 1,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Callback = function()
 
	end,
});
y:AddToggle("ESPHPBar", { Text = "HP Bar", Default = false, Callback = function()
 
	end });
y:AddDropdown("ESPHPBarSide", {
	Text = "HP Bar Side",
	Default = "Left",
	Values = {
		"Left",
		"Right",
		"Top",
		"Bottom",
	},
	Callback = function()
 
	end,
});
y:AddSlider("ESPHPBarLength", {
	Text = "HP Bar Length",
	Default = 100,
	Min = 10,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddSlider("ESPHPBarThickness", {
	Text = "HP Bar Thickness",
	Default = 2,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Callback = function()
 
	end,
});
y:AddSlider("ESPHPBarOffset", {
	Text = "HP Bar Offset",
	Default = 4,
	Min = 0,
	Max = 50,
	Rounding = 0,
	Suffix = " px",
	Callback = function()
 
	end,
});
y:AddToggle("ESPHPBarDynamic", { Text = "Dynamic Color", Default = true, Callback = function()
 
	end });
(y:AddLabel("HP High Color")):AddColorPicker("ESPHPBarColorHigh", { Default = Color3.fromRGB(0, 255, 0), Callback = function()
 
	end });
(y:AddLabel("HP Low Color")):AddColorPicker("ESPHPBarColorLow", { Default = Color3.fromRGB(255, 0, 0), Callback = function()
 
	end });
(y:AddLabel("HP Bar Background")):AddColorPicker("ESPHPBarColorBg", { Default = Color3.fromRGB(0, 0, 0), Callback = function()
 
	end });
y:AddToggle("ESPNick", { Text = "Nick", Default = false, Callback = function()
 
	end });
y:AddDropdown("ESPNickMode", {
	Text = "Nick Mode",
	Default = "Nickname",
	Values = { "Username", "Nickname", "Both" },
	Callback = function()
 
	end,
});
y:AddDropdown("ESPNickSide", {
	Text = "Nick Side",
	Default = "Top",
	Values = { "Top", "Bottom" },
	Callback = function()
 
	end,
});
(y:AddLabel("Nick Color")):AddColorPicker("ESPNickColor", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
y:AddSlider("ESPNickTransparency", {
	Text = "Nick Transparency",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddSlider("ESPNickSize", {
	Text = "Nick Size",
	Default = 14,
	Min = 8,
	Max = 30,
	Rounding = 0,
	Callback = function()
 
	end,
});
y:AddDropdown("ESPNickFont", {
	Text = "Nick Font",
	Default = "UI",
	Values = {
		"UI",
		"UI Bold",
		"System",
		"Plex",
		"Monospace",
	},
	Callback = function()
 
	end,
});
y:AddToggle("ESPTracer", { Text = "Tracer", Default = false, Callback = function()
 
	end });
y:AddDropdown("ESPTracerMode", {
	Text = "Tracer Mode",
	Default = "Bottom",
	Values = { "Bottom", "Top", "Mouse" },
	Callback = function()
 
	end,
});
(y:AddLabel("Tracer Color")):AddColorPicker("ESPTracerColor", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
y:AddSlider("ESPTracerTransparency", {
	Text = "Tracer Transparency",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddSlider("ESPTracerThickness", {
	Text = "Tracer Thickness",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Callback = function()
 
	end,
});
y:AddToggle("ESPSpeedIndicator", { Text = "Speed Indicator", Default = false, Callback = function()
 
	end });
(y:AddLabel("Speed Color")):AddColorPicker("ESPSpeedIndicatorColor", { Default = Color3.fromRGB(255, 220, 0), Callback = function()
 
	end });
y:AddSlider("ESPSpeedIndicatorTransparency", {
	Text = "Speed Transparency",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddToggle("ESPWeaponIndicator", { Text = "Weapon Indicator", Default = false, Callback = function()
 
	end });
(y:AddLabel("Weapon Color")):AddColorPicker("ESPWeaponIndicatorColor", { Default = Color3.fromRGB(255, 100, 100), Callback = function()
 
	end });
y:AddSlider("ESPWeaponIndicatorTransparency", {
	Text = "Weapon Transparency",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
y:AddSlider("ESPMaxDistance", {
	Text = "Max Distance",
	Default = 500,
	Min = 50,
	Max = 2000,
	Rounding = 0,
	Suffix = " studs",
	Callback = function()
 
	end,
});
y:AddToggle("ESPVisibleCheck", { Text = "Visible Check", Default = false, Callback = function()
 
	end });
y:AddToggle("ESPTeamCheck", { Text = "Team Check", Default = false, Callback = function()
 
	end });
local N = V.Visual:AddRightGroupbox("Chams");
N:AddToggle("ChamsEnabled", { Text = "Enabled", Default = false, Callback = function()
 
	end });
(N:AddLabel("Chams Color")):AddColorPicker("ChamsColor", { Default = Color3.fromRGB(0, 200, 255), Callback = function()
 
	end });
N:AddSlider("ChamsTransparency", {
	Text = "Transparency",
	Default = 50,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Suffix = "%",
	Callback = function()
 
	end,
});
N:AddDropdown("ChamsMode", {
	Text = "Mode",
	Default = "Highlight",
	Values = { "Highlight", "ForceField" },
	Callback = function()
 
	end,
});
N:AddToggle("ChamsVisibleCheck", { Text = "Visible Check", Default = false, Callback = function()
 
	end });
N:AddToggle("ChamsTeamCheck", { Text = "Team Check", Default = true, Callback = function()
 
	end });
local e = V.Visual:AddRightGroupbox("World");
e:AddToggle("TimeChangerEnabled", { Text = "Time Changer", Default = false, Callback = function()
 
	end });
e:AddSlider("TimeChangerValue", {
	Text = "Time",
	Default = 14,
	Min = 0,
	Max = 24,
	Rounding = 0,
	Suffix = "h",
	Callback = function()
 
	end,
});
e:AddToggle("SkyChangerEnabled", { Text = "Sky Changer", Default = false, Callback = function()
 
	end });
e:AddDropdown("SkyChangerAsset", {
	Text = "Sky",
	Default = "Minecraft",
	Values = {
		"Minecraft",
		"Realistic",
		"Anime",
		"Space",
		"None",
	},
	Callback = function()
 
	end,
});
e:AddToggle("NoFogEnabled", { Text = "No Fog", Default = false, Callback = function()
 
	end });
e:AddToggle("CustomFogEnabled", { Text = "Custom Fog", Default = false, Callback = function()
 
	end });
e:AddSlider("CustomFogStrength", {
	Text = "Fog Strength",
	Default = 5,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Callback = function()
 
	end,
});
e:AddSlider("CustomFogStart", {
	Text = "Fog Start",
	Default = 0,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Callback = function()
 
	end,
});
e:AddSlider("CustomFogEnd", {
	Text = "Fog End",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Callback = function()
 
	end,
});
(e:AddLabel("Fog Color 1")):AddColorPicker("CustomFogColor1", { Default = Color3.fromRGB(255, 255, 255), Callback = function()
 
	end });
(e:AddLabel("Fog Color 2")):AddColorPicker("CustomFogColor2", { Default = Color3.fromRGB(100, 100, 255), Callback = function()
 
	end });
e:AddToggle("FOVChangerEnabled", { Text = "FOV Changer", Default = false, Callback = function()
 
	end });
e:AddSlider("FOVChangerValue", {
	Text = "FOV",
	Default = 70,
	Min = 10,
	Max = 150,
	Rounding = 0,
	Callback = function()
 
	end,
});
e:AddToggle("FOVAntiDetect", { Text = "FOV Anti-Detection", Default = true, Callback = function()
 
	end });
local b8 = V.Misc:AddLeftGroupbox("Exploit");
(b8:AddToggle("SpeedHackEnabled", { Text = "Speed Hack", Default = false, Callback = function()
 
	end })):AddKeyPicker("SpeedHackKey", {
	Default = "None",
	Mode = "Toggle",
	Text = "Speed Hack",
	NoUI = false,
	Callback = function()
 
	end,
});
b8:AddDropdown("SpeedHackMethod", {
	Text = "Method",
	Default = "WalkSpeed",
	Values = { "WalkSpeed", "CFrame" },
	Callback = function()
 
	end,
});
b8:AddSlider("SpeedHackValue", {
	Text = "Speed",
	Default = 32,
	Min = 0,
	Max = 256,
	Rounding = 0,
	Callback = function()
 
	end,
});
(b8:AddToggle("JumpHackEnabled", { Text = "Jump Hack", Default = false, Callback = function()
 
	end })):AddKeyPicker("JumpHackKey", {
	Default = "None",
	Mode = "Toggle",
	Text = "Jump Hack",
	NoUI = false,
	Callback = function()
 
	end,
});
b8:AddSlider("JumpHackValue", {
	Text = "Jump Power",
	Default = 50,
	Min = 0,
	Max = 1200,
	Rounding = 0,
	Callback = function()
 
	end,
});
b8:AddToggle("InfJumpEnabled", { Text = "Infinite Jump", Default = false, Callback = function()
 
	end });
b8:AddToggle("NoclipEnabled", { Text = "Noclip", Default = false, Callback = function()
 
	end });
(b8:AddToggle("FlyEnabled", { Text = "Fly", Default = false, Callback = function()
 
	end })):AddKeyPicker("FlyKey", {
	Default = "F",
	Mode = "Toggle",
	Text = "Fly",
	NoUI = false,
	SyncToggleState = true,
	Callback = function()
 
	end,
});
b8:AddSlider("FlySpeed", {
	Text = "Fly Speed",
	Default = 1,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Callback = function()
 
	end,
});
b8:AddToggle("FlyQE", { Text = "Fly Q/E (Up/Down)", Default = true, Callback = function()
 
	end });
b8:AddToggle("AntiFlingEnabled", { Text = "Anti-Fling", Default = false, Callback = function()
 
	end });
b8:AddToggle("InfiniteZoomEnabled", { Text = "Infinite Zoom", Default = false, Callback = function()
 
	end });
b8:AddToggle("FreeCamEnabled", { Text = "Free Cam", Default = false, Callback = function()
 
	end });
(b8:AddToggle("OrbitEnabled", { Text = "Orbit", Default = false, Callback = function()
 
	end })):AddKeyPicker("OrbitKey", {
	Default = "None",
	Mode = "Toggle",
	Text = "Orbit",
	NoUI = false,
	SyncToggleState = true,
	Callback = function()
 
	end,
});
b8:AddSlider("OrbitRadius", {
	Text = "Orbit Radius",
	Default = 10,
	Min = 1,
	Max = 100,
	Rounding = 0,
	Callback = function()
 
	end,
});
b8:AddSlider("OrbitSpeed", {
	Text = "Orbit Speed",
	Default = 3,
	Min = .1,
	Max = 20,
	Rounding = 1,
	Callback = function()
 
	end,
});
b8:AddSlider("OrbitHeight", {
	Text = "Orbit Height",
	Default = 0,
	Min = -20,
	Max = 20,
	Rounding = 0,
	Callback = function()
 
	end,
});
b8:AddDropdown("OrbitTarget", {
	Text = "Orbit Target",
	Default = "LocalPlayer",
	Values = { "LocalPlayer", "Mouse", "NearestPlayer" },
	Callback = function()
 
	end,
});
b8:AddToggle("OrbitFollow", { Text = "Follow Target (NearestPlayer)", Default = true, Callback = function()
 
	end });
b8:AddToggle("FakeLagEnabled", { Text = "Fake Lag", Default = false, Callback = function()
 
	end });
b8:AddDropdown("FakeLagMethod", {
	Text = "Method",
	Default = "Anchored",
	Values = { "Anchored", "Physics" },
	Callback = function()
 
	end,
});
b8:AddSlider("FakeLagDuration", {
	Text = "Duration (sec)",
	Default = 2,
	Min = .5,
	Max = 60,
	Rounding = 1,
	Suffix = "s",
	Callback = function()
 
	end,
});
b8:AddSlider("FakeLagCooldown", {
	Text = "Cooldown (sec)",
	Default = 2,
	Min = 0,
	Max = 10,
	Rounding = 1,
	Suffix = "s",
	Callback = function()
 
	end,
});
local X8 = V.Custom:AddLeftGroupbox("Animation");
X8:AddToggle("AnimEnabled", { Text = "Enabled", Default = false, Callback = function()
 
	end });
X8:AddDropdown("AnimPack", {
	Text = "Pack",
	Default = "Zombie",
	Values = { "Zombie", "Cartoon" },
	Callback = function()
 
	end,
});
X8:AddSlider("AnimSpeed", {
	Text = "Speed",
	Default = 1,
	Min = .1,
	Max = 5,
	Rounding = 2,
	Callback = function()
 
	end,
});
local o8 = Drawing.new("Circle");
o8.Visible = false;
o8.Filled = false;
o8.NumSides = 60;
o8.Thickness = 1;
local B8 = Drawing.new("Circle");
B8.Visible = false;
B8.Filled = true;
B8.NumSides = 60;
local function V8(b, X, o, B)
	local V, m = nil, math.huge;
	local G = R(Toggles, "AimbotVisibleCheck");
	for K, E in ipairs(K:GetPlayers()) do
		if E ~= d then
			local K = E.Character;
			if K then
				local d = K:FindFirstChildOfClass("Humanoid");
				if d and d.Health > 0 then
					local d = false;
					if R(Toggles, "AimbotTeamCheck") and D(E) then
						d = true;
					end;
					if R(Toggles, "AimbotFFCheck") and K:FindFirstChildOfClass("ForceField") then
						d = true;
					end;
					if not d then
						for X, E in ipairs(X) do
							local d = K:FindFirstChild(E);
							if d then
								if G and not O(K, d) then
									continue;
								end;
								local X = d.Position;
								if o > 0 then
									local G = K:FindFirstChild("HumanoidRootPart");
									if G then
										X = X + G.AssemblyLinearVelocity * ((o / 100));
									end;
									local E, d = j:WorldToViewportPoint(X);
									if d then
										local X, o = E.X - b.X, E.Y - b.Y;
										local K = math.sqrt(X * X + o * o);
										if K <= B and K < m then
											m = K;
											V = { screen = Vector2.new(E.X, E.Y) };
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	return V;
end;
m.RenderStepped:Connect(function()
	local b = R(Toggles, "AimbotEnabled");
	local X = Options.AimbotKey and Options.AimbotKey:GetState() or false;
	local o = R(Toggles, "AimbotDrawFOV");
	if o then
		local b = a(Options, "AimbotFOVColor", Color3.new(1, 1, 1));
		local X = v(Options, "AimbotFOVSize", 120);
		local o = G:GetMouseLocation();
		o8.Visible, o8.Position = true, o;
		o8.Radius, o8.Color = X, b;
		if R(Toggles, "AimbotFOVFill") then
			local b = v(Options, "AimbotFOVFillStrength", 20);
			local B = a(Options, "AimbotFOVFillColor1", Color3.fromRGB(0, 200, 255));
			local V = a(Options, "AimbotFOVFillColor2", Color3.fromRGB(255, 0, 200));
			B8.Visible = true;
			B8.Position = o;
			B8.Radius = X;
			B8.Color = B:Lerp(V, .5);
			B8.Transparency = 1 - math.clamp(b / 100, 0, 1);
		else
			B8.Visible = false;
		end;
	else
		o8.Visible = false;
		B8.Visible = false;
	end;
	if not b or not X then
		return;
	end;
	local B = v(Options, "AimbotSmoothness", 6);
	local V = v(Options, "AimbotPrediction", 0);
	local m = v(Options, "AimbotFOVSize", 120);
	local K = {};
	local E = Options.AimbotBones and Options.AimbotBones.Value;
	if type(E) == "table" then
		for b, X in pairs(E) do
			if X then
				table.insert(K, b);
			end;
		end;
	end;
	if #K == 0 then
		K = { "Head" };
	end;
	local j = G:GetMouseLocation();
	local d = V8(j, K, V, m);
	if not d then
		return;
	end;
	local n = math.clamp(1 - B / 20, .05, .35);
	local C = math.clamp(((d.screen.X - j.X)) * n, -50, 50);
	local D = math.clamp(((d.screen.Y - j.Y)) * n, -50, 50);
	l(C, D);
end);
local m8 = {};
local K8 = {};
local G8 = 128;
local function E8(b)
	if K8[b] then
		return;
	end;
	local X = Drawing.new("Square");
	X.Filled = true;
	X.Visible = false;
	X.ZIndex = 4;
	local o = {};
	for b = 1, G8, 1 do
		local X = Drawing.new("Line");
		X.Visible = false;
		X.ZIndex = 5;
		X.Thickness = 1;
		o[b] = X;
	end;
	local B = Drawing.new("Square");
	B.Visible = false;
	B.Filled = false;
	B.Thickness = 1;
	B.Color = Color3.new(1, 1, 1);
	B.ZIndex = 10;
	local V = {};
	for b = 1, 8, 1 do
		local X = Drawing.new("Line");
		X.Visible = false;
		X.Thickness = 1;
		X.Color = Color3.new(1, 1, 1);
		X.ZIndex = 10;
		V[b] = X;
	end;
	local m = {};
	for b = 1, 14, 1 do
		local X = Drawing.new("Line");
		X.Visible = false;
		X.Thickness = 1;
		X.Color = Color3.new(1, 1, 1);
		X.ZIndex = 9;
		m[b] = X;
	end;
	local K = Drawing.new("Text");
	K.Visible = false;
	K.Center = true;
	K.Right = false;
	K.Outline = true;
	K.OutlineColor = Color3.new(0, 0, 0);
	K.Font = 4;
	K.ZIndex = 11;
	K.Color = Color3.new(1, 1, 1);
	local G = Drawing.new("Line");
	G.Visible = false;
	G.Thickness = 1;
	G.Color = Color3.new(1, 1, 1);
	G.ZIndex = 8;
	local E = Drawing.new("Text");
	E.Visible = false;
	E.Center = false;
	E.Right = false;
	E.Outline = true;
	E.OutlineColor = Color3.new(0, 0, 0);
	E.Font = 4;
	E.ZIndex = 11;
	E.Color = Color3.fromRGB(255, 220, 0);
	local j = Drawing.new("Text");
	j.Visible = false;
	j.Center = false;
	j.Right = false;
	j.Outline = true;
	j.OutlineColor = Color3.new(0, 0, 0);
	j.Font = 4;
	j.ZIndex = 11;
	j.Color = Color3.fromRGB(255, 100, 100);
	local d = Drawing.new("Line");
	d.Visible = false;
	d.Thickness = 2;
	d.Color = Color3.new(0, 0, 0);
	d.ZIndex = 20;
	local R = Drawing.new("Line");
	R.Visible = false;
	R.Thickness = 2;
	R.Color = Color3.fromRGB(0, 255, 0);
	R.ZIndex = 21;
	K8[b] = {
			fillBg = X,
			fillBars = o,
			box = B,
			corners = V,
			skeleton = m,
			nickLabel = K,
			tracer = G,
			speedLabel = E,
			weaponLabel = j,
			hpBg = d,
			hpFill = R,
		};
end;
local function j8(b)
	local X = K8[b];
	if not X then
		return;
	end;
	if X.fillBg then
		X.fillBg:Remove();
	end;
	if X.fillBars then
		for b, X in ipairs(X.fillBars) do
			X:Remove();
		end;
	end;
	if X.box then
		X.box:Remove();
	end;
	for b, X in pairs(X.corners) do
		X:Remove();
	end;
	for b, X in pairs(X.skeleton) do
		X:Remove();
	end;
	if X.nickLabel then
		X.nickLabel:Remove();
	end;
	if X.tracer then
		X.tracer:Remove();
	end;
	if X.speedLabel then
		X.speedLabel:Remove();
	end;
	if X.weaponLabel then
		X.weaponLabel:Remove();
	end;
	if X.hpBg then
		X.hpBg:Remove();
	end;
	if X.hpFill then
		X.hpFill:Remove();
	end;
	K8[b] = nil;
end;
local function d8(b)
	if b.fillBg then
		b.fillBg.Visible = false;
	end;
	if b.fillBars then
		for b, X in ipairs(b.fillBars) do
			X.Visible = false;
		end;
	end;
	if b.box then
		b.box.Visible = false;
	end;
	for b, X in pairs(b.corners) do
		X.Visible = false;
	end;
	for b, X in pairs(b.skeleton) do
		X.Visible = false;
	end;
	if b.nickLabel then
		b.nickLabel.Visible = false;
	end;
	if b.tracer then
		b.tracer.Visible = false;
	end;
	if b.speedLabel then
		b.speedLabel.Visible = false;
	end;
	if b.weaponLabel then
		b.weaponLabel.Visible = false;
	end;
	if b.hpBg then
		b.hpBg.Visible = false;
	end;
	if b.hpFill then
		b.hpFill.Visible = false;
	end;
end;
local function R8(b, X, o, B, V)
	local m = X:FindFirstChildOfClass("Humanoid");
	if not m then
		for b, X in pairs(b.skeleton) do
			X.Visible = false;
		end;
		return;
	end;
	local function K(b)
		if not b then
			return nil;
		end;
		local X, o = j:WorldToViewportPoint(b);
		if o then
			return Vector2.new(X.X, X.Y);
		end;
	end;
	local function G(b)
		local o = X:FindFirstChild(b);
		return o and o.Position;
	end;
	local E, d, R, n, v, a;
	local C, l, D, S, O, q, W, A, H;
	if m.RigType == Enum.HumanoidRigType.R15 then
		E = K(G("Head"));
		d = K(G("UpperTorso"));
		R = K(G("LowerTorso"));
		n = K(G("LeftUpperArm"));
		v = K(G("LeftLowerArm"));
		a = K(G("LeftHand"));
		C = K(G("RightUpperArm"));
		l = K(G("RightLowerArm"));
		D = K(G("RightHand"));
		S = K(G("LeftUpperLeg"));
		O = K(G("LeftLowerLeg"));
		q = K(G("LeftFoot"));
		W = K(G("RightUpperLeg"));
		A = K(G("RightLowerLeg"));
		H = K(G("RightFoot"));
	else
		local o = X:FindFirstChild("Torso");
		local B = X:FindFirstChild("Head");
		if not o or not B then
			for b, X in pairs(b.skeleton) do
				X.Visible = false;
			end;
			return;
		end;
		local V = X:FindFirstChild("Left Arm");
		local m = X:FindFirstChild("Right Arm");
		local G = X:FindFirstChild("Left Leg");
		local j = X:FindFirstChild("Right Leg");
		local k = o.CFrame;
		local L = o.Size;
		E = K(((k * CFrame.new(0, L.Y / 2 + .8, 0))).Position);
		d = K(((k * CFrame.new(0, L.Y / 4, 0))).Position);
		R = K(((k * CFrame.new(0, -L.Y / 4, 0))).Position);
		if V then
			local b = V.Size;
			n = K(((V.CFrame * CFrame.new(0, b.Y / 4, 0))).Position);
			v = K(((V.CFrame * CFrame.new(0, -b.Y / 4, 0))).Position);
			a = K(((V.CFrame * CFrame.new(0, -b.Y / 2, 0))).Position);
		end;
		if m then
			local b = m.Size;
			C = K(((m.CFrame * CFrame.new(0, b.Y / 4, 0))).Position);
			l = K(((m.CFrame * CFrame.new(0, -b.Y / 4, 0))).Position);
			D = K(((m.CFrame * CFrame.new(0, -b.Y / 2, 0))).Position);
		end;
		if G then
			local b = G.Size;
			S = K(((G.CFrame * CFrame.new(0, b.Y / 4, 0))).Position);
			O = K(((G.CFrame * CFrame.new(0, -b.Y / 4, 0))).Position);
			q = K(((G.CFrame * CFrame.new(0, -b.Y / 2, 0))).Position);
		end;
		if j then
			local b = j.Size;
			W = K(((j.CFrame * CFrame.new(0, b.Y / 4, 0))).Position);
			A = K(((j.CFrame * CFrame.new(0, -b.Y / 4, 0))).Position);
			H = K(((j.CFrame * CFrame.new(0, -b.Y / 2, 0))).Position);
		end;
	end;
	local k = {
			{ E, d },
			{ d, R },
			{ d, n },
			{ n, v },
			{ v, a },
			{ d, C },
			{ C, l },
			{ l, D },
			{ R, S },
			{ S, O },
			{ O, q },
			{ R, W },
			{ W, A },
			{ A, H },
		};
	for b, X in ipairs(b.skeleton) do
		local m = k[b];
		if m and (m[1] and m[2]) then
			X.Visible = true;
			X.From = m[1];
			X.To = m[2];
			X.Color = o;
			X.Thickness = V;
			X.Transparency = B;
		else
			X.Visible = false;
		end;
	end;
end;
local function n8(b)
	if b == d then
		return;
	end;
	local X = b.Character;
	if not X then
		return;
	end;
	local o = X:FindFirstChildOfClass("Humanoid");
	if not o or o.Health <= 0 then
		return;
	end;
	local B = n(Options, "ChamsMode", "Highlight");
	local V = a(Options, "ChamsColor", Color3.fromRGB(0, 200, 255));
	local m = v(Options, "ChamsTransparency", 50) / 100;
	local K = m8[b];
	if not K or K.mode ~= B then
		if K then
			if K.highlight then
				K.highlight:Destroy();
			end;
			if K.originalMaterials then
				for b, X in pairs(K.originalMaterials) do
					if b and b.Parent then
						b.Material = X.material;
						b.Color = X.color;
						b.Transparency = X.transparency;
					end;
				end;
			end;
		end;
		K = { mode = B };
		m8[b] = K;
	end;
	if B == "Highlight" then
		if not K.highlight or not K.highlight.Parent then
			local b = Instance.new("Highlight");
			b.Name = "SalawauiChams";
			b.Adornee = X;
			b.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
			b.OutlineColor = V;
			b.OutlineTransparency = 1;
			b.Parent = X;
			K.highlight = b;
		end;
		K.highlight.FillColor = V;
		K.highlight.FillTransparency = m;
		K.highlight.OutlineTransparency = 1;
		K.highlight.Enabled = true;
	elseif B == "ForceField" then
		if K.highlight then
			K.highlight:Destroy();
			K.highlight = nil;
		end;
		if not K.originalMaterials then
			K.originalMaterials = {};
			for b, X in ipairs(X:GetDescendants()) do
				if X:IsA("BasePart") then
					K.originalMaterials[X] = { material = X.Material, color = X.Color, transparency = X.Transparency };
				end;
			end;
		end;
		for b, X in pairs(K.originalMaterials) do
			if b and b.Parent then
				b.Material = Enum.Material.ForceField;
				b.Color = V;
				b.Transparency = m;
			end;
		end;
	end;
end;
local function v8(b)
	local X = m8[b];
	if not X then
		return;
	end;
	if X.highlight then
		X.highlight:Destroy();
	end;
	if X.originalMaterials then
		for b, X in pairs(X.originalMaterials) do
			if b and b.Parent then
				b.Material = X.material;
				b.Color = X.color;
				b.Transparency = X.transparency;
			end;
		end;
	end;
	m8[b] = nil;
end;
local function a8(b)
	local X = K8[b];
	if not X then
		return;
	end;
	local o = b.Character;
	if b == d or not o then
		return d8(X);
	end;
	local B = o:FindFirstChildOfClass("Humanoid");
	if not B or B.Health <= 0 then
		return d8(X);
	end;
	local V = o:FindFirstChild("HumanoidRootPart");
	if not V then
		return d8(X);
	end;
	local m = v(Options, "ESPMaxDistance", 500);
	local K = ((j.CFrame.Position - V.Position)).Magnitude;
	if K > m then
		return d8(X);
	end;
	if R(Toggles, "ESPTeamCheck") and D(b) then
		return d8(X);
	end;
	if R(Toggles, "ESPVisibleCheck") then
		local b = o:FindFirstChild("Head") or o.PrimaryPart;
		if b and not O(o, b) then
			return d8(X);
		end;
	end;
	local E, l, S = pcall(function()
			return o:GetBoundingBox();
		end);
	if not E or not l or not S then
		return d8(X);
	end;
	local q = V.CFrame.LookVector;
	local W = Vector3.new(q.X, 0, q.Z);
	local A = W.Magnitude > .01 and CFrame.lookAt(l.Position, l.Position + W.Unit) or CFrame.new(l.Position);
	local H, k, L = S.X / 2, S.Y / 2, S.Z / 2;
	local w = {
			A * Vector3.new(-H, k, -L),
			A * Vector3.new(H, k, -L),
			A * Vector3.new(-H, k, L),
			A * Vector3.new(H, k, L),
			A * Vector3.new(-H, -k, -L),
			A * Vector3.new(H, -k, -L),
			A * Vector3.new(-H, -k, L),
			A * Vector3.new(H, -k, L),
		};
	local u, c = math.huge, math.huge;
	local z, F = -math.huge, -math.huge;
	local g = false;
	for b, X in ipairs(w) do
		local o, B = j:WorldToViewportPoint(X);
		if B then
			g = true;
			if o.X < u then
				u = o.X;
			end;
			if o.Y < c then
				c = o.Y;
			end;
			if o.X > z then
				z = o.X;
			end;
			if o.Y > F then
				F = o.Y;
			end;
		end;
	end;
	if not g then
		return d8(X);
	end;
	local i, U = u, c;
	local T, P = z - u, F - c;
	local I = a(Options, "ESPBoxColor", Color3.new(1, 1, 1));
	local Y = v(Options, "ESPBoxThickness", 1);
	if R(Toggles, "ESPBoxFill") then
		local b = {
				a(Options, "ESPBoxFillColor1", Color3.fromRGB(255, 255, 255)),
				a(Options, "ESPBoxFillColor2", Color3.fromRGB(200, 200, 255)),
				a(Options, "ESPBoxFillColor3", Color3.fromRGB(120, 150, 255)),
				a(Options, "ESPBoxFillColor4", Color3.fromRGB(50, 100, 255)),
				a(Options, "ESPBoxFillColor5", Color3.fromRGB(0, 100, 255)),
			};
		local o = v(Options, "ESPBoxFillTransparency", 70) / 100;
		local B = n(Options, "ESPBoxFillDirection", "Top to Bottom");
		local V = 1 - math.clamp(((K - 50)) / 250, 0, 1);
		local m = math.clamp(math.floor(16 + ((G8 - 16)) * V), 16, G8);
		m = math.min(m, #X.fillBars);
		local function G(X)
			local o = #b - 1;
			local B = math.min(math.floor(X * o), o - 1);
			local V = (X * o) - B;
			return b[B + 1]:Lerp(b[B + 2], V);
		end;
		X.fillBg.Visible = true;
		X.fillBg.Color = b[1];
		X.fillBg.Transparency = math.max(0, o - .1);
		X.fillBg.Size = Vector2.new(T, P);
		X.fillBg.Position = Vector2.new(i, U);
		local E = P / m;
		for b = 1, #X.fillBars, 1 do
			local V = X.fillBars[b];
			if b > m then
				V.Visible = false;
			else
				local X = (B == "Top to Bottom") and ((b - 1)) / math.max(m - 1, 1) or ((m - b)) / math.max(m - 1, 1);
				V.Color = G(X);
				V.Transparency = math.clamp(o + ((1 - o)) * X, 0, 1);
				local K = (U + ((b - 1)) * E) + E / 2;
				V.From = Vector2.new(i, K);
				V.To = Vector2.new(i + T, K);
				V.Thickness = E + 1;
				V.Visible = true;
			end;
		end;
	else
		if X.fillBg.Visible then
			X.fillBg.Visible = false;
		end;
		for b, X in ipairs(X.fillBars) do
			if X.Visible then
				X.Visible = false;
			end;
		end;
	end;
	if R(Toggles, "ESPBox") then
		local b = n(Options, "ESPBoxMode", "Full");
		if b == "Full" then
			X.box.Visible = true;
			X.box.Size = Vector2.new(T, P);
			X.box.Position = Vector2.new(i, U);
			X.box.Color = I;
			X.box.Thickness = Y;
			for b, X in pairs(X.corners) do
				if X.Visible then
					X.Visible = false;
				end;
			end;
		else
			X.box.Visible = false;
			local b = T * .2;
			local o = P * .2;
			local B = {
					{
						i,
						U,
						i + b,
						U,
					},
					{
						i,
						U,
						i,
						U + o,
					},
					{
						i + T,
						U,
						(i + T) - b,
						U,
					},
					{
						i + T,
						U,
						i + T,
						U + o,
					},
					{
						i,
						U + P,
						i + b,
						U + P,
					},
					{
						i,
						U + P,
						i,
						(U + P) - o,
					},
					{
						i + T,
						U + P,
						(i + T) - b,
						U + P,
					},
					{
						i + T,
						U + P,
						i + T,
						(U + P) - o,
					},
				};
			for b, X in ipairs(X.corners) do
				local o = B[b];
				if o then
					X.Visible = true;
					X.From = Vector2.new(o[1], o[2]);
					X.To = Vector2.new(o[3], o[4]);
					X.Color = I;
					X.Thickness = Y;
				end;
			end;
		end;
	else
		if X.box.Visible then
			X.box.Visible = false;
		end;
		for b, X in pairs(X.corners) do
			if X.Visible then
				X.Visible = false;
			end;
		end;
	end;
	if R(Toggles, "ESPSkeleton") then
		R8(X, o, a(Options, "ESPSkeletonColor", Color3.fromRGB(255, 255, 255)), v(Options, "ESPSkeletonTransparency", 0) / 100, v(Options, "ESPSkeletonThickness", 1));
	else
		for b, X in pairs(X.skeleton) do
			if X.Visible then
				X.Visible = false;
			end;
		end;
	end;
	if R(Toggles, "ESPHPBar") then
		local b = n(Options, "ESPHPBarSide", "Left");
		local o = v(Options, "ESPHPBarLength", 100) / 100;
		local V = v(Options, "ESPHPBarThickness", 2);
		local m = v(Options, "ESPHPBarOffset", 4);
		local K = a(Options, "ESPHPBarColorHigh", Color3.fromRGB(0, 255, 0));
		local G = a(Options, "ESPHPBarColorLow", Color3.fromRGB(255, 0, 0));
		local E = a(Options, "ESPHPBarColorBg", Color3.fromRGB(0, 0, 0));
		local j = math.clamp(B.Health / math.max(B.MaxHealth, 1), 0, 1);
		local d = R(Toggles, "ESPHPBarDynamic") and G:Lerp(K, j) or K;
		local C, l, D, S, O;
		if b == "Left" or b == "Right" then
			O = P * o;
			local X = (b == "Left") and (i - m) or ((i + T) + m);
			local B = U + ((P - O)) / 2;
			local V = B + O;
			C = Vector2.new(X, B);
			l = Vector2.new(X, V);
			local K = V - O * j;
			D = Vector2.new(X, K);
			S = Vector2.new(X, V);
		else
			O = T * o;
			local X = (b == "Top") and (U - m) or ((U + P) + m);
			local B = i + ((T - O)) / 2;
			local V = B + O;
			C = Vector2.new(B, X);
			l = Vector2.new(V, X);
			local K = B + O * j;
			D = Vector2.new(B, X);
			S = Vector2.new(K, X);
		end;
		X.hpBg.Visible = true;
		X.hpBg.From = C;
		X.hpBg.To = l;
		X.hpBg.Thickness = V + 1;
		X.hpBg.Color = E;
		X.hpFill.Visible = true;
		X.hpFill.From = D;
		X.hpFill.To = S;
		X.hpFill.Thickness = V;
		X.hpFill.Color = d;
	else
		if X.hpBg.Visible then
			X.hpBg.Visible = false;
		end;
		if X.hpFill.Visible then
			X.hpFill.Visible = false;
		end;
	end;
	if R(Toggles, "ESPNick") then
		local o = n(Options, "ESPNickMode", "Nickname");
		local B = (o == "Username") and b.Name or (o == "Nickname" and b.DisplayName or (b.DisplayName .. (" (" .. (b.Name .. ")"))));
		local V = n(Options, "ESPNickSide", "Top");
		local m = v(Options, "ESPNickSize", 14);
		local K = i + T / 2;
		local G = (V == "Top") and ((U - 5) - m) or ((U + P) + 5);
		X.nickLabel.Visible = true;
		X.nickLabel.Text = B;
		X.nickLabel.Size = m;
		X.nickLabel.Color = a(Options, "ESPNickColor", Color3.new(1, 1, 1));
		X.nickLabel.Transparency = v(Options, "ESPNickTransparency", 0) / 100;
		X.nickLabel.Font = C(n(Options, "ESPNickFont", "UI"));
		X.nickLabel.Position = Vector2.new(K, G);
	else
		if X.nickLabel.Visible then
			X.nickLabel.Visible = false;
		end;
	end;
	if R(Toggles, "ESPTracer") then
		local b = n(Options, "ESPTracerMode", "Bottom");
		local o = j.ViewportSize;
		local B, V;
		if b == "Bottom" then
			B = Vector2.new(o.X / 2, o.Y);
			V = Vector2.new(i + T / 2, U + P);
		elseif b == "Top" then
			B = Vector2.new(o.X / 2, 0);
			V = Vector2.new(i + T / 2, U);
		else
			B = G:GetMouseLocation();
			V = Vector2.new(i + T / 2, U + P / 2);
		end;
		X.tracer.Visible = true;
		X.tracer.From = B;
		X.tracer.To = V;
		X.tracer.Color = a(Options, "ESPTracerColor", Color3.new(1, 1, 1));
		X.tracer.Thickness = v(Options, "ESPTracerThickness", 1);
		X.tracer.Transparency = v(Options, "ESPTracerTransparency", 0) / 100;
	else
		if X.tracer.Visible then
			X.tracer.Visible = false;
		end;
	end;
	if R(Toggles, "ESPSpeedIndicator") then
		local b = V.AssemblyLinearVelocity;
		X.speedLabel.Visible = true;
		X.speedLabel.Text = tostring(math.floor(b.Magnitude + .5)) .. " sps";
		X.speedLabel.Size = 12;
		X.speedLabel.Color = a(Options, "ESPSpeedIndicatorColor", Color3.fromRGB(255, 220, 0));
		X.speedLabel.Transparency = v(Options, "ESPSpeedIndicatorTransparency", 0) / 100;
		X.speedLabel.Position = Vector2.new((i + T) + 5, U);
	else
		if X.speedLabel.Visible then
			X.speedLabel.Visible = false;
		end;
	end;
	if R(Toggles, "ESPWeaponIndicator") then
		local B = o:FindFirstChildOfClass("Tool") or (b:FindFirstChildOfClass("Backpack") and (b:FindFirstChildOfClass("Backpack")):FindFirstChildOfClass("Tool"));
		local V = ((B and #B.Name > 0)) and string.upper(string.sub(B.Name, 1, 1)) or "-";
		X.weaponLabel.Visible = true;
		X.weaponLabel.Text = "W=" .. V;
		X.weaponLabel.Size = 12;
		X.weaponLabel.Color = a(Options, "ESPWeaponIndicatorColor", Color3.fromRGB(255, 100, 100));
		X.weaponLabel.Transparency = v(Options, "ESPWeaponIndicatorTransparency", 0) / 100;
		X.weaponLabel.Position = Vector2.new((i + T) + 5, U + 14);
	else
		if X.weaponLabel.Visible then
			X.weaponLabel.Visible = false;
		end;
	end;
end;
local function C8(b)
	E8(b);
	b.CharacterAdded:Connect(function()
		E8(b);
	end);
end;
for b, X in ipairs(K:GetPlayers()) do
	C8(X);
end;
K.PlayerAdded:Connect(C8);
K.PlayerRemoving:Connect(function(b)
	j8(b);
	v8(b);
end);
m.RenderStepped:Connect(function()
	local b = R(Toggles, "ESPEnabled");
	local X = R(Toggles, "ChamsEnabled");
	if not b and not X then
		for b, X in pairs(K8) do
			d8(X);
			if m8[b] then
				v8(b);
			end;
		end;
		return;
	end;
	for o, B in pairs(K8) do
		if b then
			a8(o);
		else
			d8(B);
		end;
		if X then
			n8(o);
		elseif m8[o] then
			v8(o);
		end;
	end;
end);
local l8 = E.ClockTime;
local D8 = false;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "TimeChangerEnabled");
	if b then
		if not D8 then
			l8 = E.ClockTime;
			D8 = true;
		end;
		local b = v(Options, "TimeChangerValue", 14);
		if E.ClockTime ~= b then
			E.ClockTime = b;
		end;
	elseif D8 then
		E.ClockTime = l8;
		D8 = false;
	end;
end);
local S8 = {
		Minecraft = 10594760952,
		Realistic = 10256505900,
		Anime = 1.1640217850413e+14,
		Space = 15983996673,
	};
local O8 = {};
local q8 = nil;
local W8 = false;
local A8 = nil;
local function H8()
	if next(O8) then
		return;
	end;
	for b, X in ipairs(E:GetChildren()) do
		if X:IsA("Sky") then
			O8[X] = true;
			X.Enabled = false;
		end;
	end;
end;
local function k8()
	for b, X in pairs(O8) do
		if b and b.Parent then
			b.Enabled = true;
		end;
	end;
	O8 = {};
end;
local function L8()
	if q8 then
		q8:Destroy();
		q8 = nil;
	end;
	for b, X in ipairs(E:GetChildren()) do
		if X:IsA("Sky") and X.Name == "SalawauiSky" then
			X:Destroy();
		end;
	end;
end;
local function w8(b)
	L8();
	local X, o = pcall(function()
			return (game:GetObjects("rbxassetid://" .. tostring(b)))[1];
		end);
	if not X or not o then
		return;
	end;
	local B = o:IsA("Sky") and o or nil;
	if not B then
		for b, X in ipairs(o:GetDescendants()) do
			if X:IsA("Sky") then
				B = X;
				break;
			end;
		end;
	end;
	if not B then
		return;
	end;
	local V = B:Clone();
	V.Name = "SalawauiSky";
	V.Parent = E;
	q8 = V;
end;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "SkyChangerEnabled");
	if b then
		local b = n(Options, "SkyChangerAsset", "Minecraft");
		if b == "None" then
			if W8 then
				L8();
				k8();
				W8 = false;
				A8 = "None";
			end;
			return;
		end;
		local X = S8[b];
		if not X then
			return;
		end;
		if not W8 then
			H8();
			W8 = true;
			A8 = b;
			w8(X);
		elseif A8 ~= b then
			A8 = b;
			w8(X);
		end;
	elseif W8 then
		L8();
		k8();
		W8 = false;
		A8 = nil;
	end;
end);
local u8 = E.FogEnd;
local c8 = E.FogStart;
local z8 = E.FogColor;
local F8 = false;
local g8 = false;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "NoFogEnabled");
	local X = R(Toggles, "CustomFogEnabled");
	if b and not F8 then
		u8 = E.FogEnd;
		c8 = E.FogStart;
		z8 = E.FogColor;
		F8 = true;
		E.FogEnd = 1000000;
		E.FogStart = 1000000;
	elseif not b and (F8 and not X) then
		E.FogEnd = u8;
		E.FogStart = c8;
		E.FogColor = z8;
		F8 = false;
	end;
	if X then
		g8 = true;
		local b = v(Options, "CustomFogStart", 0) / 100;
		local X = v(Options, "CustomFogEnd", 100) / 100;
		local o = v(Options, "CustomFogStrength", 5);
		local B = a(Options, "CustomFogColor1", Color3.fromRGB(255, 255, 255));
		local V = a(Options, "CustomFogColor2", Color3.fromRGB(100, 100, 255));
		local m = math.max(10, 2000 / math.max(o, 1));
		E.FogStart = m * b;
		E.FogEnd = math.max(m * X, E.FogStart + 1);
		E.FogColor = B:Lerp(V, .5);
	elseif g8 then
		g8 = false;
		if not b then
			E.FogEnd = u8;
			E.FogStart = c8;
			E.FogColor = z8;
		end;
	end;
end);
local i8 = {};
local U8 = false;
m.Stepped:Connect(function()
	if not R(Toggles, "NoclipEnabled") then
		return;
	end;
	local b = d.Character;
	if not b then
		return;
	end;
	for b, X in ipairs(b:GetDescendants()) do
		if X:IsA("BasePart") and X.CanCollide then
			X.CanCollide = false;
			i8[X] = true;
		end;
	end;
end);
m.Heartbeat:Connect(function()
	local b = R(Toggles, "NoclipEnabled");
	if U8 and not b then
		for b in pairs(i8) do
			if typeof(b) == "Instance" and (b:IsA("BasePart") and b.Parent) then
				b.CanCollide = true;
			end;
		end;
		i8 = {};
	end;
	U8 = b;
end);
local T8 = false;
local P8, I8;
local function Y8()
	T8 = false;
	if P8 then
		P8:Disconnect();
		P8 = nil;
	end;
	if I8 then
		I8:Disconnect();
		I8 = nil;
	end;
	local b = d.Character;
	if b then
		local X = b:FindFirstChildOfClass("Humanoid");
		if X then
			X.PlatformStand = false;
		end;
	end;
	pcall(function()
		j.CameraType = Enum.CameraType.Custom;
	end);
end;
local function t8()
	Y8();
	task.wait();
	local b = d.Character;
	if not b then
		return;
	end;
	local X = b:FindFirstChildOfClass("Humanoid");
	local o = b:FindFirstChild("HumanoidRootPart");
	if not X or not o then
		return;
	end;
	local B = {
			F = 0,
			B = 0,
			L = 0,
			R = 0,
			Q = 0,
			E = 0,
		};
	local V = {
			F = 0,
			B = 0,
			L = 0,
			R = 0,
		};
	local m = 0;
	local K = function()
			return v(Options, "FlySpeed", 1);
		end;
	local function E()
		T8 = true;
		local b = Instance.new("BodyGyro");
		local G = Instance.new("BodyVelocity");
		b.P = 90000;
		b.Parent = o;
		G.Parent = o;
		b.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000);
		b.CFrame = o.CFrame;
		G.Velocity = Vector3.new(0, 0, 0);
		G.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
		task.spawn(function()
			repeat
				task.wait();
				local o = K();
				if B.L + B.R ~= 0 or B.F + B.B ~= 0 or B.Q + B.E ~= 0 then
					m = 50;
				elseif m ~= 0 then
					m = 0;
				end;
				if X then
					X.PlatformStand = true;
				end;
				if (B.L + B.R) ~= 0 or (B.F + B.B) ~= 0 or (B.Q + B.E) ~= 0 then
					G.Velocity = (((j.CFrame.LookVector * ((B.F + B.B))) + (((j.CFrame * (CFrame.new(B.L + B.R, ((((B.F + B.B) + B.Q) + B.E)) * .2, 0)).p) - j.CFrame.p)))) * m;
					V = {
							F = B.F,
							B = B.B,
							L = B.L,
							R = B.R,
						};
				elseif m ~= 0 then
					G.Velocity = (((j.CFrame.LookVector * ((V.F + V.B))) + (((j.CFrame * (CFrame.new(V.L + V.R, ((V.F + V.B)) * .2, 0)).p) - j.CFrame.p)))) * m;
				else
					G.Velocity = Vector3.new(0, 0, 0);
				end;
				b.CFrame = j.CFrame;
			until not T8;
			b:Destroy();
			G:Destroy();
			if X then
				X.PlatformStand = false;
			end;
		end);
	end;
	P8 = G.InputBegan:Connect(function(b, X)
			if X then
				return;
			end;
			local o = K();
			if b.KeyCode == Enum.KeyCode.W then
				B.F = o;
			elseif b.KeyCode == Enum.KeyCode.S then
				B.B = -o;
			elseif b.KeyCode == Enum.KeyCode.A then
				B.L = -o;
			elseif b.KeyCode == Enum.KeyCode.D then
				B.R = o;
			elseif b.KeyCode == Enum.KeyCode.E and R(Toggles, "FlyQE") then
				B.Q = o * 2;
			elseif b.KeyCode == Enum.KeyCode.Q and R(Toggles, "FlyQE") then
				B.E = -o * 2;
			end;
			pcall(function()
				j.CameraType = Enum.CameraType.Track;
			end);
		end);
	I8 = G.InputEnded:Connect(function(b, X)
			if X then
				return;
			end;
			if b.KeyCode == Enum.KeyCode.W then
				B.F = 0;
			elseif b.KeyCode == Enum.KeyCode.S then
				B.B = 0;
			elseif b.KeyCode == Enum.KeyCode.A then
				B.L = 0;
			elseif b.KeyCode == Enum.KeyCode.D then
				B.R = 0;
			elseif b.KeyCode == Enum.KeyCode.E then
				B.Q = 0;
			elseif b.KeyCode == Enum.KeyCode.Q then
				B.E = 0;
			end;
		end);
	E();
end;
local x8 = false;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "FlyEnabled");
	if b and not x8 then
		t8();
	elseif not b and x8 then
		Y8();
	end;
	x8 = b;
end);
d.CharacterAdded:Connect(function()
	if T8 then
		Y8();
		if Toggles.FlyEnabled then
			Toggles.FlyEnabled:SetValue(false);
		end;
	end;
end);
local p8 = j.FieldOfView;
local J8 = false;
local f8 = nil;
m.RenderStepped:Connect(function()
	local b = R(Toggles, "FOVChangerEnabled");
	if b then
		if not J8 then
			p8 = j.FieldOfView;
			J8 = true;
			f8 = (j:GetPropertyChangedSignal("FieldOfView")):Connect(function()
					if J8 and R(Toggles, "FOVAntiDetect") then
						local b = v(Options, "FOVChangerValue", 70);
						if j.FieldOfView ~= b then
							task.defer(function()
								j.FieldOfView = b;
							end);
						end;
					end;
				end);
		end;
		local b = v(Options, "FOVChangerValue", 70);
		if j.FieldOfView ~= b then
			j.FieldOfView = b;
		end;
	else
		if J8 then
			if f8 then
				f8:Disconnect();
				f8 = nil;
			end;
			j.FieldOfView = p8;
			J8 = false;
		end;
	end;
end);
local s8 = false;
local M8 = nil;
local function Z8()
	if s8 then
		return;
	end;
	s8 = true;
	M8 = m.Heartbeat:Connect(function()
			if not s8 then
				return;
			end;
			local b = d.Character;
			if not b then
				return;
			end;
			local X = b:FindFirstChild("HumanoidRootPart");
			if not X then
				return;
			end;
			local o = X.AssemblyLinearVelocity;
			if o.Magnitude > 100 then
				pcall(function()
					X.AssemblyLinearVelocity = Vector3.new(0, o.Y, 0);
				end);
				pcall(function()
					X.Velocity = Vector3.new(0, o.Y, 0);
				end);
			end;
			local B = X.AssemblyAngularVelocity;
			if B.Magnitude > 30 then
				pcall(function()
					X.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
				end);
				pcall(function()
					X.RotVelocity = Vector3.new(0, 0, 0);
				end);
			end;
			for b, X in ipairs(b:GetDescendants()) do
				if X:IsA("BodyVelocity") and X.Velocity.Magnitude > 100 then
					pcall(function()
						X.Velocity = Vector3.new(0, 0, 0);
					end);
				elseif X:IsA("BodyAngularVelocity") and X.AngularVelocity.Magnitude > 30 then
					pcall(function()
						X.AngularVelocity = Vector3.new(0, 0, 0);
					end);
				elseif X:IsA("BodyGyro") and X.MaxTorque.Magnitude > 1000000000 then
					pcall(function()
						X.MaxTorque = Vector3.new(0, 0, 0);
					end);
				end;
			end;
		end);
end;
local function r8()
	s8 = false;
	if M8 then
		M8:Disconnect();
		M8 = nil;
	end;
end;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "AntiFlingEnabled");
	if b and not s8 then
		Z8();
	elseif not b and s8 then
		r8();
	end;
end);
local Q8 = nil;
local h8 = nil;
local y8 = false;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "InfiniteZoomEnabled");
	if b and not y8 then
		y8 = true;
		Q8 = d.CameraMinZoomDistance;
		h8 = d.CameraMaxZoomDistance;
		d.CameraMinZoomDistance = .5;
		d.CameraMaxZoomDistance = 100000;
	elseif not b and y8 then
		y8 = false;
		if Q8 then
			d.CameraMinZoomDistance = Q8;
		end;
		if h8 then
			d.CameraMaxZoomDistance = h8;
		end;
		Q8 = nil;
		h8 = nil;
	end;
end);
local N8 = false;
local e8 = nil;
local bl = nil;
local Xl = nil;
local ol = 15;
local Bl, Vl = 0, 0;
local ml = nil;
local Kl = nil;
local Gl = nil;
local El = nil;
local jl = nil;
local dl = nil;
local Rl = nil;
local nl = false;
G.InputChanged:Connect(function(b)
	if not N8 then
		return;
	end;
	if b.UserInputType == Enum.UserInputType.MouseWheel then
		ol = math.clamp(ol - b.Position.Z * 2, 2, 500);
	end;
end);
G.InputBegan:Connect(function(b, X)
	if X then
		return;
	end;
	if b.UserInputType == Enum.UserInputType.MouseButton2 then
		nl = true;
	end;
end);
G.InputEnded:Connect(function(b, X)
	if X then
		return;
	end;
	if b.UserInputType == Enum.UserInputType.MouseButton2 then
		nl = false;
	end;
end);
G.InputChanged:Connect(function(b)
	if not N8 or not nl then
		return;
	end;
	if b.UserInputType == Enum.UserInputType.MouseMovement then
		local X = .15;
		Bl = Bl - b.Delta.X * X;
		Vl = math.clamp(Vl - b.Delta.Y * X, -85, 85);
	end;
end);
m.Heartbeat:Connect(function()
	local b = R(Toggles, "FreeCamEnabled");
	if b and not N8 then
		N8 = true;
		e8 = j.CameraType;
		bl = j.CameraSubject;
		j.CameraType = Enum.CameraType.Scriptable;
		local b = d.Character;
		if b then
			local X = b:FindFirstChild("HumanoidRootPart");
			if X then
				Kl = X;
				Gl = X.Anchored;
				X.Anchored = true;
			end;
			local o = b:FindFirstChildOfClass("Humanoid");
			if o then
				El = o.WalkSpeed;
				jl = o.JumpPower;
				dl = o.JumpHeight;
				Rl = o.UseJumpPower;
				o.WalkSpeed = 0;
				o.JumpPower = 0;
				o.JumpHeight = 0;
			end;
		end;
		local X = j.CFrame.LookVector;
		Bl = math.deg(math.atan2(-X.X, -X.Z));
		Vl = math.deg(math.asin(X.Y));
		ml = j.CFrame.Position;
		Xl = m.RenderStepped:Connect(function()
				if not N8 then
					return;
				end;
				if j.CameraType ~= Enum.CameraType.Scriptable then
					j.CameraType = Enum.CameraType.Scriptable;
				end;
				local b = CFrame.fromEulerAnglesYXZ(math.rad(Vl), math.rad(Bl), 0);
				local X = b.LookVector;
				local o = ol * .5;
				local B = Vector3.new(0, 0, 0);
				if G:IsKeyDown(Enum.KeyCode.W) then
					B = B + X;
				end;
				if G:IsKeyDown(Enum.KeyCode.S) then
					B = B - X;
				end;
				if G:IsKeyDown(Enum.KeyCode.A) then
					B = B - b.RightVector;
				end;
				if G:IsKeyDown(Enum.KeyCode.D) then
					B = B + b.RightVector;
				end;
				if G:IsKeyDown(Enum.KeyCode.E) then
					B = B + Vector3.new(0, 1, 0);
				end;
				if G:IsKeyDown(Enum.KeyCode.Q) then
					B = B - Vector3.new(0, 1, 0);
				end;
				if B.Magnitude > 0 then
					ml = ml + (B.Unit * o) * (.016666666666667);
				end;
				j.CFrame = CFrame.lookAt(ml, ml + X);
				j.Focus = CFrame.new(ml + X);
			end);
	elseif not b and N8 then
		N8 = false;
		if Xl then
			Xl:Disconnect();
			Xl = nil;
		end;
		if Kl then
			pcall(function()
				Kl.Anchored = Gl or false;
			end);
		end;
		local b = d.Character;
		if b then
			local X = b:FindFirstChildOfClass("Humanoid");
			if X then
				if El then
					X.WalkSpeed = El;
				end;
				if Rl then
					X.UseJumpPower = true;
					X.JumpPower = jl or 50;
				else
					X.UseJumpPower = false;
					X.JumpHeight = dl or 7.2;
				end;
			end;
		end;
		Kl = nil;
		Gl = nil;
		El = nil;
		jl = nil;
		dl = nil;
		Rl = nil;
		if e8 then
			j.CameraType = e8;
		end;
		if bl then
			j.CameraSubject = bl;
		end;
		e8 = nil;
		bl = nil;
		ml = nil;
	end;
end);
local vl = false;
local al = 0;
local Cl = nil;
local ll = nil;
local Dl = nil;
local function Sl()
	local b = n(Options, "OrbitTarget", "LocalPlayer");
	local X = d.Character;
	local o = X and X:FindFirstChild("HumanoidRootPart");
	if not o then
		return nil;
	end;
	if b == "LocalPlayer" then
		return o.Position;
	elseif b == "Mouse" then
		local b = d:GetMouse();
		return b.Hit.Position;
	elseif b == "NearestPlayer" then
		local b, X = nil, math.huge;
		local B = o.Position;
		for o, V in ipairs(K:GetPlayers()) do
			if V ~= d and V.Character then
				local o = V.Character:FindFirstChild("HumanoidRootPart");
				if o then
					local V = ((o.Position - B)).Magnitude;
					if V < X then
						X = V;
						b = o;
					end;
				end;
			end;
		end;
		return b and b.Position or B;
	end;
	return o.Position;
end;
local function Ol()
	if vl then
		return;
	end;
	vl = true;
	ll = j.CameraType;
	Dl = j.CameraSubject;
	Cl = m.Heartbeat:Connect(function(b)
			if not vl then
				return;
			end;
			local X = d.Character;
			if not X then
				return;
			end;
			local o = X:FindFirstChild("HumanoidRootPart");
			if not o then
				return;
			end;
			local B = Sl();
			if not B then
				return;
			end;
			local V = v(Options, "OrbitRadius", 10);
			local m = v(Options, "OrbitSpeed", 3);
			local K = v(Options, "OrbitHeight", 0);
			al = al + (m * b) * 1.5;
			if al > math.pi * 2 then
				al = al - math.pi * 2;
			end;
			local G = Vector3.new(math.cos(al) * V, K, math.sin(al) * V);
			local E = B + G;
			pcall(function()
				o.CFrame = CFrame.new(E, B);
			end);
		end);
end;
local function ql()
	vl = false;
	if Cl then
		Cl:Disconnect();
		Cl = nil;
	end;
	if ll then
		pcall(function()
			j.CameraType = ll;
		end);
	end;
	if Dl then
		pcall(function()
			j.CameraSubject = Dl;
		end);
	end;
	ll = nil;
	Dl = nil;
	al = 0;
end;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "OrbitEnabled");
	if b and not vl then
		Ol();
	elseif not b and vl then
		ql();
	end;
end);
d.CharacterAdded:Connect(function()
	if vl then
		ql();
		if Toggles.OrbitEnabled then
			Toggles.OrbitEnabled:SetValue(false);
		end;
	end;
end);
local Wl = false;
local Al = nil;
local Hl = nil;
local kl = nil;
local Ll = nil;
local wl = nil;
local ul = false;
local cl = nil;
local function zl()
	local b = d.Character;
	if not b then
		return;
	end;
	local X = b:FindFirstChild("HumanoidRootPart");
	local o = b:FindFirstChildOfClass("Humanoid");
	if not X or not o then
		return;
	end;
	Al = X;
	Hl = o;
	kl = X.Anchored;
	Ll = o.WalkSpeed;
	wl = o.PlatformStand;
end;
local function Fl()
	Wl = false;
	if cl then
		pcall(function()
			task.cancel(cl);
		end);
		cl = nil;
	end;
	if Al then
		pcall(function()
			Al.Anchored = kl or false;
		end);
	end;
	if Hl then
		pcall(function()
			Hl.WalkSpeed = Ll or 16;
			Hl.PlatformStand = wl or false;
		end);
	end;
	Al = nil;
	Hl = nil;
	kl = nil;
	Ll = nil;
	wl = nil;
	ul = false;
end;
local function gl(b)
	if ul then
		return;
	end;
	ul = true;
	local X = n(Options, "FakeLagMethod", "Anchored");
	local o = Al;
	local B = Hl;
	if not o or not B then
		ul = false;
		return;
	end;
	if X == "Anchored" then
		pcall(function()
			o.Anchored = true;
		end);
	elseif X == "Physics" then
		pcall(function()
			o.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
			o.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
			o.Velocity = Vector3.new(0, 0, 0);
			o.RotVelocity = Vector3.new(0, 0, 0);
			B.PlatformStand = true;
			B.WalkSpeed = 0;
		end);
	end;
	task.wait(b);
	if not Wl then
		ul = false;
		return;
	end;
	if X == "Anchored" then
		pcall(function()
			o.Anchored = kl or false;
		end);
	elseif X == "Physics" then
		pcall(function()
			B.PlatformStand = wl or false;
			B.WalkSpeed = Ll or 16;
		end);
	end;
	ul = false;
end;
local function il()
	while Wl do
		local b = v(Options, "FakeLagDuration", 2);
		local X = v(Options, "FakeLagCooldown", 2);
		gl(b);
		if not Wl then
			break;
		end;
		task.wait(X);
	end;
end;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "FakeLagEnabled");
	if b and not Wl then
		Wl = true;
		zl();
		cl = task.spawn(il);
	elseif not b and Wl then
		Fl();
	end;
end);
d.CharacterAdded:Connect(function()
	if Wl then
		Fl();
		if Toggles.FakeLagEnabled then
			Toggles.FakeLagEnabled:SetValue(false);
		end;
	end;
end);
local Ul, Tl, Pl = 16, 50, true;
local Il, Yl = false, false;
task.spawn(function()
	while task.wait(.1) do
		local b = d.Character;
		if b then
			local X = b:FindFirstChildOfClass("Humanoid");
			if X then
				if R(Toggles, "SpeedHackEnabled") and n(Options, "SpeedHackMethod", "WalkSpeed") == "WalkSpeed" then
					if not Il then
						Ul = X.WalkSpeed;
						Il = true;
					end;
					X.WalkSpeed = v(Options, "SpeedHackValue", 32);
				elseif Il then
					X.WalkSpeed = Ul;
					Il = false;
				end;
				if R(Toggles, "JumpHackEnabled") then
					if not Yl then
						Pl = X.UseJumpPower;
						Tl = Pl and X.JumpPower or X.JumpHeight;
						Yl = true;
					end;
					local b = v(Options, "JumpHackValue", 50);
					if X.UseJumpPower then
						X.JumpPower = b;
					else
						X.JumpHeight = b / 7.5;
					end;
				elseif Yl then
					if Pl then
						X.UseJumpPower = true;
						X.JumpPower = Tl;
					else
						X.UseJumpPower = false;
						X.JumpHeight = Tl;
					end;
					Yl = false;
				end;
			end;
		end;
	end;
end);
m.RenderStepped:Connect(function(b)
	if not R(Toggles, "SpeedHackEnabled") then
		return;
	end;
	if n(Options, "SpeedHackMethod", "WalkSpeed") ~= "CFrame" then
		return;
	end;
	local X = d.Character;
	if not X then
		return;
	end;
	local o = X:FindFirstChildOfClass("Humanoid");
	local B = X:FindFirstChild("HumanoidRootPart");
	if not o or not B then
		return;
	end;
	local V = o.MoveDirection;
	if V.Magnitude > 0 then
		B.CFrame = B.CFrame + (V * v(Options, "SpeedHackValue", 32)) * b;
	end;
end);
G.JumpRequest:Connect(function()
	if not R(Toggles, "InfJumpEnabled") then
		return;
	end;
	local b = d.Character;
	if not b then
		return;
	end;
	local X = b:FindFirstChildOfClass("Humanoid");
	if X then
		X:ChangeState(Enum.HumanoidStateType.Jumping);
	end;
end);
local tl = { Zombie = {
			WalkAnim = 10921355261,
			RunAnim = 616163682,
			JumpAnim = 10921351278,
			FallAnim = 10921350320,
			SwimIdle = 10921353442,
			Swim = 10921352344,
			Animation1 = 10921344533,
			Animation2 = 10921345304,
			ClimbAnim = 10921343576,
		}, Cartoon = {
			WalkAnim = 742640026,
			RunAnim = 742638842,
			JumpAnim = 742637942,
			FallAnim = 742637151,
			SwimIdle = 742639812,
			Swim = 742639220,
			ClimbAnim = 742636889,
			Animation1 = 742637544,
			Animation2 = 742638445,
		} };
local xl = nil;
local pl = false;
local Jl, fl;
local function sl(b)
	for X = 1, 40, 1 do
		local o = b:FindFirstChild("Animate");
		if o and (o:FindFirstChild("idle") and (o:FindFirstChild("run") and o:FindFirstChild("walk"))) then
			return o;
		end;
		task.wait(.1);
	end;
end;
local function Ml(b, X)
	local o = tl[b];
	if not o then
		return;
	end;
	local B = d.Character;
	if not B then
		return;
	end;
	local V = sl(B);
	if not V then
		return;
	end;
	if not xl then
		xl = {};
		local b = {
				{ "run", "RunAnim" },
				{ "walk", "WalkAnim" },
				{ "jump", "JumpAnim" },
				{ "fall", "FallAnim" },
				{ "climb", "ClimbAnim" },
				{ "swim", "Swim" },
				{ "swimidle", "SwimIdle" },
			};
		for b, X in ipairs(b) do
			local o = V:FindFirstChild(X[1]);
			local B = o and o:FindFirstChild(X[2]);
			if B then
				xl[#xl + 1] = { obj = B, id = B.AnimationId };
			end;
		end;
		local X = V:FindFirstChild("idle");
		if X then
			for b = 1, 3, 1 do
				local o = X:FindFirstChild("Animation" .. b);
				if o then
					xl[#xl + 1] = { obj = o, id = o.AnimationId };
				end;
			end;
		end;
	end;
	local m = B:FindFirstChildOfClass("Humanoid");
	if m then
		for b, X in ipairs(m:GetPlayingAnimationTracks()) do
			X:Stop(0);
		end;
	end;
	local function K(b, X, o)
		if not b or not o then
			return;
		end;
		local B = b:FindFirstChild(X) or Instance.new("Animation", b);
		B.Name = X;
		B.AnimationId = "rbxassetid://" .. tostring(o);
	end;
	K(V:FindFirstChild("walk"), "WalkAnim", o.WalkAnim);
	K(V:FindFirstChild("run"), "RunAnim", o.RunAnim);
	K(V:FindFirstChild("jump"), "JumpAnim", o.JumpAnim);
	K(V:FindFirstChild("fall"), "FallAnim", o.FallAnim);
	K(V:FindFirstChild("climb"), "ClimbAnim", o.ClimbAnim);
	K(V:FindFirstChild("swim"), "Swim", o.Swim);
	K(V:FindFirstChild("swimidle"), "SwimIdle", o.SwimIdle or o.Swim);
	K(V:FindFirstChild("idle"), "Animation1", o.Animation1 or o.Animation2);
	K(V:FindFirstChild("idle"), "Animation2", o.Animation2 or o.Animation1);
	V.Disabled = true;
	task.wait(.06);
	V.Disabled = false;
	if m then
		m:ChangeState(Enum.HumanoidStateType.Landed);
		task.wait(.03);
		m:ChangeState(Enum.HumanoidStateType.Running);
		task.wait(.1);
		for b, o in ipairs(m:GetPlayingAnimationTracks()) do
			o:AdjustSpeed(X or 1);
		end;
	end;
end;
local function Zl()
	local b = d.Character;
	if not b then
		return;
	end;
	local X = b:FindFirstChildOfClass("Humanoid");
	local o = b:FindFirstChild("Animate");
	if not X or not o then
		return;
	end;
	if xl then
		for b, X in ipairs(xl) do
			if X.obj and X.obj.Parent then
				X.obj.AnimationId = X.id;
			end;
		end;
		xl = nil;
	end;
	o.Disabled = true;
	task.wait(.06);
	o.Disabled = false;
	task.wait(.2);
	for b, X in ipairs(X:GetPlayingAnimationTracks()) do
		X:AdjustSpeed(1);
	end;
end;
m.Heartbeat:Connect(function()
	local b = R(Toggles, "AnimEnabled");
	if b and not pl then
		local b = n(Options, "AnimPack", "Zombie");
		local X = v(Options, "AnimSpeed", 1);
		Jl, fl = b, X;
		task.spawn(function()
			Ml(b, X);
		end);
	elseif not b and pl then
		task.spawn(Zl);
	end;
	pl = b;
end);
m.Heartbeat:Connect(function()
	if not R(Toggles, "AnimEnabled") then
		return;
	end;
	local b = n(Options, "AnimPack", "Zombie");
	local X = v(Options, "AnimSpeed", 1);
	if b ~= Jl then
		Jl, fl = b, X;
		task.spawn(function()
			Ml(b, X);
		end);
	elseif X ~= fl then
		fl = X;
		local b = d.Character;
		if b then
			local o = b:FindFirstChildOfClass("Humanoid");
			if o then
				for b, o in ipairs(o:GetPlayingAnimationTracks()) do
					o:AdjustSpeed(X);
				end;
			end;
		end;
	end;
end);
d.CharacterAdded:Connect(function()
	xl = nil;
	task.wait(.6);
	if R(Toggles, "AnimEnabled") then
		local b = n(Options, "AnimPack", "Zombie");
		task.spawn(function()
			Ml(b, v(Options, "AnimSpeed", 1));
		end);
	end;
end);
local rl = V.Ui:AddLeftGroupbox("Menu");
rl:AddButton("Unload", function()
	b:Unload();
end);
(rl:AddLabel("Menu bind")):AddKeyPicker("MenuKeybind", {
	Default = "Insert",
	NoUI = true,
	Text = "Menu keybind",
	ChangedCallback = function()
		b.ToggleKeybind = Options.MenuKeybind;
		if not b.SetKeybindTransparency then
			G.InputBegan:Connect(function(X)
				if b.Unloaded then
					return;
				end;
				if X.UserInputType ~= Enum.UserInputType.Keyboard then
					return;
				end;
				local o = b.ToggleKeybind;
				local B = (type(o) == "table" and o.Value) or o;
				if B and X.KeyCode.Name == B then
					task.spawn(b.Toggle);
				end;
			end);
		end;
	end,
});
rl:AddToggle("ShowKeybinds", { Text = "Show Keybinds", Default = false, Callback = function(X)
		if b.KeybindFrame then
			b.KeybindFrame.Visible = X;
		end;
	end });
rl:AddToggle("ShowWatermark", { Text = "Show Watermark", Default = true, Callback = function(X)
		b:SetWatermarkVisibility(X);
	end });
local Ql = V.Ui:AddLeftGroupbox("Background");
if b.AddBlurSlider then
	b:AddBlurSlider(Ql);
end;
if b.AddDarkenSlider then
	b:AddDarkenSlider(Ql);
end;
if b.AddKeybindTransparencySlider then
	b:AddKeybindTransparencySlider(Ql);
end;
X:SetLibrary(b);
o:SetLibrary(b);
o:IgnoreThemeSettings();
o:SetIgnoreIndexes({});
X:SetFolder("logic");
o:SetFolder("logic/entities");
o:BuildConfigSection(V.Ui);
X:ApplyToTab(V.Ui);
X:ApplyTheme("Logic");
b.ToggleKeybind = Options.MenuKeybind;
if b.KeybindFrame then
	b.KeybindFrame.Visible = false;
end;
b:SetWatermarkVisibility(true);
b:SetWatermark("Salawaui.cc");
task.spawn(function()
	task.wait(.5);
	pcall(function()
		if b.Watermark and b.Watermark.Instance then
			b.Watermark.Instance.AnchorPoint = Vector2.new(.5, 0);
			b.Watermark.Instance.Position = UDim2.new(.5, 0, 0, 20);
		end;
	end);
end);
b:OnUnload(function()
	b.Unloaded = true;
	for b, X in pairs(K8) do
		j8(b);
	end;
	for b in pairs(m8) do
		v8(b);
	end;
	o8:Remove();
	B8:Remove();
	Y:Remove();
	t:Remove();
	r8();
	pcall(function()
		ql();
	end);
	pcall(function()
		Fl();
	end);
	Y8();
	L8();
	k8();
	if Q then
		pcall(function()
			hookmetamethod(game, "__namecall", Q);
		end);
	end;
	if h then
		pcall(function()
			hookmetamethod(game, "__index", h);
		end);
	end;
	if (getgenv()).Salawaui and (getgenv()).Salawaui.NamecallBackup then
		pcall(function()
			local b = getrawmetatable(game);
			if b then
				setreadonly(b, false);
				b.__namecall = (getgenv()).Salawaui.NamecallBackup;
				setreadonly(b, true);
			end;
		end);
	end;
end);
return function()
	b:Unload();
end;
