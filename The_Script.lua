-- Função para criar janelas arrastáveis
function makeDraggable(window)
    local dragInput, dragStart, startPos
    window.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragStart = nil
                end
            end)
        end
    end)

    window.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragStart then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            -- Move todos os filhos da janela com ela
            for _, child in pairs(window:GetChildren()) do
                if child:IsA("GuiObject") then
                    child.Position = child.Position + UDim2.new(0, delta.X, 0, delta.Y)
                end
            end
        end
    end)
end

-- Função para criar botões
function createButton(name, position, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(75, 0, 130)  -- Cor roxa
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent
    return button
end

-- Função para criar a janela de Teleporte para Player ou Local
function createTeleportWindow()
    local window = Instance.new("Frame")
    window.Size = UDim2.new(0, 300, 0, 200)
    window.Position = UDim2.new(0.5, -150, 0.5, -100)
    window.BackgroundColor3 = Color3.fromRGB(75, 0, 130)  -- Cor roxa
    window.Parent = script.Parent

    makeDraggable(window)  -- Tornar a janela arrastável

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "Teleportar para..."
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Parent = window

    local playerButton = createButton("Player", UDim2.new(0, 0, 0, 60), window)
    playerButton.MouseButton1Click:Connect(function()
        -- Lógica para teleportar para o player
        print("Teleportando para o Player...")
    end)

    local locationButton = createButton("Local", UDim2.new(0, 0, 0, 120), window)
    locationButton.MouseButton1Click:Connect(function()
        -- Lógica para teleportar para o local
        print("Teleportando para o Local...")
    end)

    return window
end

-- Função para criar o GUI inicial
function createInitialGUI()
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(75, 0, 130)  -- Cor roxa
    mainFrame.Parent = gui

    makeDraggable(mainFrame)  -- Tornar a janela arrastável

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Text = "[ The_Script ]"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Parent = mainFrame

    -- Botões do GUI
    local teleportButton = createButton("Teleportar", UDim2.new(0, 0, 0, 60), mainFrame)
    teleportButton.MouseButton1Click:Connect(function()
        createTeleportWindow()  -- Criar a janela de teleportar
    end)

    local autoFarmButton = createButton("The_Auto_Farm", UDim2.new(0, 0, 0, 120), mainFrame)
    local teleportGigatonicoButton = createButton("Teleporte Gigatonico", UDim2.new(0, 0, 0, 180), mainFrame)
    local godModeButton = createButton("Ativar: Modo Gigatonico", UDim2.new(0, 0, 0, 240), mainFrame)
    local speedHackButton = createButton("Definir Velocidade", UDim2.new(0, 0, 0, 300), mainFrame)
    local infiniteMoneyButton = createButton("The_Pix", UDim2.new(0, 0, 0, 360), mainFrame)

    -- Lógica dos botões
    teleportGigatonicoButton.MouseButton1Click:Connect(function()
        print("Teleportando para o Gigatonico...")
    end)
    godModeButton.MouseButton1Click:Connect(function()
        print("Ativando o Modo Gigatonico...")
    end)
    speedHackButton.MouseButton1Click:Connect(function()
        print("Definindo Velocidade...")
    end)
    infiniteMoneyButton.MouseButton1Click:Connect(function()
        print("Solicitando Pix...")
    end)

    return gui
end

-- Criar o GUI inicial
createInitialGUI()
