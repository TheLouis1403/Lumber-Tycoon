-- Criação da janela principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "[ The_Script ]"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar os botões
local function createButton(text, position, callback, parent)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Função de animação do texto no botão "Player..."
local function animatePlaceholder(playerInput)
    local textStages = {"Player.", "Player..", "Player..."}
    local index = 1

    while true do
        playerInput.PlaceholderText = textStages[index]
        index = index + 1
        if index > #textStages then
            index = 1
        end
        wait(1)
    end
end

-- Função para criar uma janela arrastável
local function createDraggableWindow(title, position, size, parent)
    local window = Instance.new("Frame")
    window.Size = size
    window.Position = position
    window.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
    window.Parent = parent

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = window

    local dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragInput:Disconnect()
                end
            end)
            dragInput = game:GetService("UserInputService").InputChanged:Connect(update)
        end
    end)

    return window
end

-- Função para exibir a janela de opções de Teleporte (Player ou Local)
local function createTeleportOptionsWindow(parent)
    local teleportOptionsWindow = createDraggableWindow("Teleportar para...", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 150), parent)

    createButton("Player", UDim2.new(0, 0, 0, 60), function()
        teleportOptionsWindow:Destroy()
        createDraggableWindow("Teleportar para o Player:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200), parent)
    end, parent)

    createButton("Local", UDim2.new(0, 0, 0, 120), function()
        teleportOptionsWindow:Destroy()
        createDraggableWindow("Teleportar para o Lugar:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200), parent)
    end, parent)
end

-- Função para o botão de coordenadas
local function toggleCoordinates(parent)
    local coordinatesLabel = Instance.new("TextLabel")
    coordinatesLabel.Text = "Coordenadas: (X: 0, Y: 0, Z: 0)"
    coordinatesLabel.Size = UDim2.new(0, 200, 0, 30)
    coordinatesLabel.Position = UDim2.new(1, -210, 0, 50)
    coordinatesLabel.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    coordinatesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    coordinatesLabel.TextSize = 18
    coordinatesLabel.Parent = parent
end

-- Função para adicionar janelas de localização "Lugar"
local function createLocationButton(text, position, parent)
    local locationButton = Instance.new("TextButton")
    locationButton.Text = text
    locationButton.Size = UDim2.new(0, 200, 0, 50)
    locationButton.Position = position
    locationButton.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    locationButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    locationButton.TextSize = 18
    locationButton.Parent = parent
end

-- Função para o botão de coordenadas
local function showCoordinates(parent)
    local coordinatesLabel = Instance.new("TextLabel")
    coordinatesLabel.Text = "Coordenadas: (X: 0, Y: 0, Z: 0)"
    coordinatesLabel.Size = UDim2.new(0, 200, 0, 30)
    coordinatesLabel.Position = UDim2.new(1, -210, 0, 50)
    coordinatesLabel.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    coordinatesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    coordinatesLabel.TextSize = 18
    coordinatesLabel.Parent = parent
end

-- Criando o GUI inicial com título
local initialGui = Instance.new("Frame")
initialGui.Size = UDim2.new(0, 400, 0, 500)
initialGui.Position = UDim2.new(0, 100, 0, 100)
initialGui.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
initialGui.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "[ The_Script ]"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = initialGui

-- Função para mostrar o GUI inicial após o clique do botão
createButton("Teleportar", UDim2.new(0, 0, 0, 60), function()
    createTeleportOptionsWindow(initialGui)
end, initialGui)

createButton("Ver Cordenadas", UDim2.new(0, 0, 0, 120), function()
    showCoordinates(initialGui)
end, initialGui)

-- Função para o botão "Player..."
local function animatePlaceholder(playerInput)
    local textStages = {"Player.", "Player..", "Player..."}
    local index = 1

    while true do
        playerInput.PlaceholderText = textStages[index]
        index = index + 1
        if index > #textStages then
            index = 1
        end
        wait(1)
    end
end

-- Criando a janela "Teleportar para o Player"
local teleportWindow = createDraggableWindow("Teleportar para o Player:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200), screenGui)

local playerInput = Instance.new("TextBox")
playerInput.Size = UDim2.new(1, 0, 0, 40)
playerInput.Position = UDim2.new(0, 0, 0, 50)
playerInput.PlaceholderText = "Player..."
playerInput.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
playerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
playerInput.TextSize = 18
playerInput.TextXAlignment = Enum.TextXAlignment.Center
playerInput.Parent = teleportWindow
spawn(function() animatePlaceholder(playerInput) end)

-- Criando a janela para selecionar lugares
local locationWindow = createDraggableWindow("Teleportar para o Lugar", UDim2.new(0, 0, 0, 250), UDim2.new(0, 400, 0, 300), screenGui)

createLocationButton("Venda de Madeiras", UDim2.new(0, 0, 0, 50), locationWindow)
createLocationButton("Deserto", UDim2.new(0, 0, 0, 100), locationWindow)
createLocationButton("Lago Congelado", UDim2.new(0, 0, 0, 150), locationWindow)
createLocationButton("Tree island", UDim2.new(0, 0, 0, 200), locationWindow)
createLocationButton("Navio", UDim2.new(0, 0, 0, 250), locationWindow)
createLocationButton("Restaurante", UDim2.new(0, 0, 0, 300), locationWindow)
