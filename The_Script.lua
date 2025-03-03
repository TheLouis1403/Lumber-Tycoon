-- Script GUI para Lumber Tycoon 2 (com funções do Butter Hub e adicionais)
-- Compatível com JJSPloit

-- Criando o GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Lumber Tycoon 2 Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = mainFrame

-- Função para criar botões facilmente
local function createButton(name, position, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(func)
    return button
end

-- Funções para as ações do hub
local function autoFarm()
    -- Exemplo de implementação para farm automático
    print("Iniciando Auto Farm")
    -- Adicionar lógica de farm automático aqui
end

local function teleportToPlayer()
    -- Exemplo de teleporte para um player
    local targetPlayer = game.Players:FindFirstChild("NomeDoJogador") -- Substitua pelo nome do jogador desejado
    if targetPlayer then
        player.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
    end
end

local function godMode()
    -- Ativando o God Mode
    player.Character:FindFirstChild("Humanoid").Health = math.huge
end

local function speedHack()
    -- Aumentando a velocidade do jogador
    player.Character.Humanoid.WalkSpeed = 100
end

local function infiniteMoney()
    -- Dando dinheiro infinito (simulação)
    -- Adicionar lógica para ganhar dinheiro aqui
    print("Dinheiro infinito ativado!")
end

local function removeFog()
    -- Remover a neblina do jogo
    game.Lighting.FogEnd = math.huge
    game.Lighting.FogStart = 0
end

local function fly()
    -- Habilitando o voo (exemplo simples)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Controle de velocidade de voo
    bodyVelocity.Parent = player.Character:FindFirstChild("HumanoidRootPart")
end

local function noclip()
    -- Ativando Noclip
    local char = player.Character
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    humanoid.PlatformStand = true
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

local function instantBuy()
    -- Compra instantânea (simulação)
    print("Compra instantânea ativada!")
    -- Adicionar lógica de compra aqui
end

local function itemDupe()
    -- Dupe de item (simulação)
    print("Duplicando item...")
    -- Adicionar lógica de duplicação de item aqui
end

-- Criando botões no GUI
createButton("Auto Farm", UDim2.new(0, 0, 0, 50), autoFarm)
createButton("Teleport to Player", UDim2.new(0, 0, 0, 100), teleportToPlayer)
createButton("God Mode", UDim2.new(0, 0, 0, 150), godMode)
createButton("Speed Hack", UDim2.new(0, 0, 0, 200), speedHack)
createButton("Infinite Money", UDim2.new(0, 0, 0, 250), infiniteMoney)
createButton("Remove Fog", UDim2.new(0, 0, 0, 300), removeFog)
createButton("Fly", UDim2.new(0, 0, 0, 350), fly)
createButton("Noclip", UDim2.new(0, 0, 0, 400), noclip)
createButton("Instant Buy", UDim2.new(0, 0, 0, 450), instantBuy)
createButton("Item Dupe", UDim2.new(0, 0, 0, 500), itemDupe)
