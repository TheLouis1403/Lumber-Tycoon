-- Criação da janela principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "[ The_Script ]"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar os botões
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Parent = screenGui
    button.MouseButton1Click:Connect(callback)
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
local function createDraggableWindow(title, position, size)
    local window = Instance.new("Frame")
    window.Size = size
    window.Position = position
    window.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
    window.Parent = screenGui

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
local function createTeleportOptionsWindow()
    local teleportOptionsWindow = createDraggableWindow("Teleportar para...", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 150))

    createButton("Player", UDim2.new(0, 0, 0, 60), function()
        teleportOptionsWindow:Destroy()
        createDraggableWindow("Teleportar para o Player:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200))
    end)

    createButton("Local", UDim2.new(0, 0, 0, 120), function()
        teleportOptionsWindow:Destroy()
        createDraggableWindow("Teleportar para o Lugar:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200))
    end)
end

-- Criando a janela "Teleportar"
createButton("Teleportar", UDim2.new(0, 0, 0, 50), function()
    createTeleportOptionsWindow()
end)

-- Criando a janela "Teleportar para o Player"
local teleportWindow = createDraggableWindow("Teleportar para o Player:", UDim2.new(0, 0, 0, 50), UDim2.new(0, 400, 0, 200))

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

-- Função para a janela "Teleportar para o Lugar"
local function teleportToLocation()
    -- Aqui você pode adicionar lógica para teleportar para diferentes lugares
end

-- Criando a janela para selecionar lugares
local locationWindow = createDraggableWindow("Teleportar para o Lugar", UDim2.new(0, 0, 0, 250), UDim2.new(0, 400, 0, 300))

local locationButton = Instance.new("TextButton")
locationButton.Text = "Teleportar para o Lugar"
locationButton.Size = UDim2.new(0, 200, 0, 50)
locationButton.Position = UDim2.new(0, 0, 0, 110)
locationButton.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
locationButton.TextColor3 = Color3.fromRGB(255, 255, 255)
locationButton.TextSize = 18
locationButton.Parent = teleportWindow
locationButton.MouseButton1Click:Connect(teleportToLocation)

-- Função para o botão de coordenadas
local function toggleCoordinates()
    -- Exibir coordenadas (não implementado aqui, você pode adicionar lógica para isso)
end

-- Criar os botões principais
createButton("Fazenda Automática", UDim2.new(0, 0, 0, 50), function() end)
createButton("Teleporte Gigatonico", UDim2.new(0, 0, 0, 100), function() end)
createButton("Ativar: Modo Gigatonico", UDim2.new(0, 0, 0, 150), function() end)
createButton("Definir Velocidade", UDim2.new(0, 0, 0, 200), function() end)
createButton("The_Pix", UDim2.new(0, 0, 0, 250), function() end)
createButton("Comprar", UDim2.new(0, 0, 0, 300), function() end)
createButton("Duplicar Item", UDim2.new(0, 0, 0, 350), function() end)
createButton("Ver Cordenadas", UDim2.new(0, 0, 0, 400), toggleCoordinates)

-- Função para adicionar as janelas de localização "Lugar"
local function createLocationButton(text, position)
    local locationButton = Instance.new("TextButton")
    locationButton.Text = text
    locationButton.Size = UDim2.new(0, 200, 0, 50)
    locationButton.Position = position
    locationButton.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    locationButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    locationButton.TextSize = 18
    locationButton.Parent = locationWindow
end

createLocationButton("Venda de Madeiras", UDim2.new(0, 0, 0, 50))
createLocationButton("Deserto", UDim2.new(0, 0, 0, 100))
createLocationButton("Lago Congelado", UDim2.new(0, 0, 0, 150))
createLocationButton("Tree island", UDim2.new(0, 0, 0, 200))
createLocationButton("Navio", UDim2.new(0, 0, 0, 250))
createLocationButton("Ponte", UDim2.new(0, 0, 0, 300))
createLocationButton("Caverna", UDim2.new(0, 0, 0, 350))

-- Função para o botão de coordenadas
local function showCoordinates()
    local coordinatesLabel = Instance.new("TextLabel")
    coordinatesLabel.Text = "Coordenadas: (X: 0, Y: 0, Z: 0)"
    coordinatesLabel.Size = UDim2.new(0, 200, 0, 30)
    coordinatesLabel.Position = UDim2.new(1, -210, 0, 50)
    coordinatesLabel.BackgroundColor3 = Color3.fromRGB(90, 0, 90)
    coordinatesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    coordinatesLabel.TextSize = 18
    coordinatesLabel.Parent = screenGui
end

createButton("Ver Cordenadas", UDim2.new(0, 0, 0, 450), showCoordinates)
