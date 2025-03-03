local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Lumber Tycoon 2 Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.BackgroundTransparency = 1
title.Parent = mainFrame

local function createButton(name, position, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(80, 0, 80)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(func)
    return button
end

local coordinatesLabel = Instance.new("TextLabel")
coordinatesLabel.Size = UDim2.new(0, 200, 0, 40)
coordinatesLabel.Position = UDim2.new(0, 450, 0, 50)
coordinatesLabel.Text = "Coordenadas: X: 0, Y: 0, Z: 0"
coordinatesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
coordinatesLabel.TextSize = 18
coordinatesLabel.BackgroundTransparency = 1
coordinatesLabel.Visible = false
coordinatesLabel.Parent = screenGui

local function updateCoordinates()
    local position = player.Character and player.Character.PrimaryPart and player.Character.PrimaryPart.Position
    if position then
        coordinatesLabel.Text = string.format("Coordenadas: X: %.2f, Y: %.2f, Z: %.2f", position.X, position.Y, position.Z)
    end
end

local function toggleCoordinates()
    coordinatesLabel.Visible = not coordinatesLabel.Visible
    if coordinatesLabel.Visible then
        updateCoordinates()
    end
end

local function teleportToPlayer()
    local teleportWindow = Instance.new("Frame")
    teleportWindow.Size = UDim2.new(0, 300, 0, 200)
    teleportWindow.Position = UDim2.new(0.5, -150, 0.5, -100)
    teleportWindow.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
    teleportWindow.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "Teleportar para o Player:"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.BackgroundTransparency = 1
    title.Parent = teleportWindow

    local playerInput = Instance.new("TextBox")
    playerInput.Size = UDim2.new(1, 0, 0, 40)
    playerInput.Position = UDim2.new(0, 0, 0, 50)
    playerInput.PlaceholderText = "Player"
    playerInput.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    playerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerInput.TextSize = 18
    playerInput.TextXAlignment = Enum.TextXAlignment.Center
    playerInput.Parent = teleportWindow

    playerInput.FocusLost:Connect(function()
        if playerInput.Text == "" then
            playerInput.PlaceholderText = "Player"
        end
    end)

    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(1, 0, 0, 40)
    teleportButton.Position = UDim2.new(0, 0, 0, 100)
    teleportButton.Text = "Teleportar"
    teleportButton.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    teleportButton.TextSize = 18
    teleportButton.Parent = teleportWindow
    teleportButton.MouseButton1Click:Connect(function()
        local targetPlayerName = playerInput.Text
        local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
        if targetPlayer then
            player.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
        else
            print("Jogador não encontrado.")
        end
        teleportWindow:Destroy()
    end)
end

local function teleportToLocation()
    local locationWindow = Instance.new("Frame")
    locationWindow.Size = UDim2.new(0, 300, 0, 250)
    locationWindow.Position = UDim2.new(0.5, -150, 0.5, -125)
    locationWindow.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
    locationWindow.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "Teleportar para o Lugar:"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.BackgroundTransparency = 1
    title.Parent = locationWindow

    local placeInput = Instance.new("TextBox")
    placeInput.Size = UDim2.new(1, 0, 0, 40)
    placeInput.Position = UDim2.new(0, 0, 0, 50)
    placeInput.PlaceholderText = "Lugar"
    placeInput.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    placeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    placeInput.TextSize = 18
    placeInput.TextXAlignment = Enum.TextXAlignment.Center
    placeInput.Parent = locationWindow

    local locations = {
        "Venda de Madeiras",
        "Deserto",
        "Lago Congelado",
        "Tree Island",
        "Ilha de Árvores",
        "Navio",
        "Ponte",
        "Loja de Ferramentas",
        "Easter Egg 1",
        "Easter Egg 2"
    }

    local locationList = Instance.new("ScrollingFrame")
    locationList.Size = UDim2.new(1, 0, 0, 150)
    locationList.Position = UDim2.new(0, 0, 0, 100)
    locationList.BackgroundTransparency = 1
    locationList.CanvasSize = UDim2.new(0, 0, 0, 200)
    locationList.Parent = locationWindow

    for _, location in pairs(locations) do
        local locationButton = Instance.new("TextButton")
        locationButton.Size = UDim2.new(1, 0, 0, 40)
        locationButton.Text = location
        locationButton.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
        locationButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        locationButton.TextSize = 18
        locationButton.Parent = locationList

        locationButton.MouseButton1Click:Connect(function()
            if location == "Venda de Madeiras" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(100, 0, 100))
            elseif location == "Deserto" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(200, 0, 200))
            elseif location == "Lago Congelado" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(300, 0, 300))
            elseif location == "Tree Island" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(400, 0, 400))
            elseif location == "Ilha de Árvores" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(500, 0, 500))
            elseif location == "Navio" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(600, 0, 600))
            elseif location == "Ponte" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(700, 0, 700))
            elseif location == "Loja de Ferramentas" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(800, 0, 800))
            elseif location == "Easter Egg 1" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(900, 0, 900))
            elseif location == "Easter Egg 2" then
                player.Character:SetPrimaryPartCFrame(CFrame.new(1000, 0, 1000))
            end
            locationWindow:Destroy()
        end)
    end
end

createButton("The_Auto_Farm", UDim2.new(0, 0, 0, 60), function() print("Auto Farm Ativado") end)
createButton("Teleporte Gigatonico", UDim2.new(0, 0, 0, 100), teleportToPlayer)
createButton("Ativar: Modo Gigatonico", UDim2.new(0, 0, 0, 140), function() print("Modo Gigatonico Ativado") end)
createButton("Definir Velocidade", UDim2.new(0, 0, 0, 180), function() print("Velocidade Alterada") end)
createButton("The_Pix", UDim2.new(0, 0, 0, 220), function() print("Pix Solicitado") end)
createButton("Comprar", UDim2.new(0, 0, 0, 260), function() print("Comprado Instantaneamente") end)
createButton("Duplicar Item", UDim2.new(0, 0, 0, 300), function() print("Item Duplicado") end)
createButton("Ver Cordenadas", UDim2.new(0, 0, 0, 340), toggleCoordinates)
