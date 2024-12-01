-- Criar GUI para controlar a sorte
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local LuckInput = Instance.new("TextBox")
local ApplyButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

-- Configuração da GUI
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "Controle de Sorte"
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

LuckInput.Parent = Frame
LuckInput.PlaceholderText = "Insira o valor da sorte"
LuckInput.Size = UDim2.new(0.6, 0, 0.3, 0)
LuckInput.Position = UDim2.new(0.2, 0, 0.3, 0)
LuckInput.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LuckInput.TextColor3 = Color3.new(1, 1, 1)
LuckInput.Font = Enum.Font.SourceSans
LuckInput.TextSize = 16

ApplyButton.Parent = Frame
ApplyButton.Text = "Aplicar"
ApplyButton.Size = UDim2.new(0.4, 0, 0.2, 0)
ApplyButton.Position = UDim2.new(0.3, 0, 0.65, 0)
ApplyButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
ApplyButton.TextColor3 = Color3.new(1, 1, 1)
ApplyButton.Font = Enum.Font.SourceSansBold
ApplyButton.TextSize = 16

CloseButton.Parent = Frame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0.1, 0, 0.2, 0)
CloseButton.Position = UDim2.new(0.9, -5, 0, 5)
CloseButton.BackgroundColor3 = Color3.new(0.8, 0, 0)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 16

MinimizeButton.Parent = Frame
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0.1, 0, 0.2, 0)
MinimizeButton.Position = UDim2.new(0.8, -5, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0)
MinimizeButton.TextColor3 = Color3.new(0, 0, 0)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 16

-- Funções para o menu
local function applyLuck()
    local value = tonumber(LuckInput.Text)
    if value then
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("NumberValue") or obj:IsA("IntValue") then
                if string.find(obj.Name, "Chance") or string.find(obj.Name, "Luck") then
                    obj.Value = value
                    print("Valor de sorte definido como:", value)
                end
            end
        end
    else
        warn("Insira um número válido!")
    end
end

local isMinimized = false

local function minimizeMenu()
    isMinimized = not isMinimized
    if isMinimized then
        Frame.Size = UDim2.new(0, 300, 0, 50)
        LuckInput.Visible = false
        ApplyButton.Visible = false
    else
        Frame.Size = UDim2.new(0, 300, 0, 150)
        LuckInput.Visible = true
        ApplyButton.Visible = true
    end
end

local function closeMenu()
    ScreenGui:Destroy()
end

-- Conectar botões
ApplyButton.MouseButton1Click:Connect(applyLuck)
MinimizeButton.MouseButton1Click:Connect(minimizeMenu)
CloseButton.MouseButton1Click:Connect(closeMenu)

print("Menu de sorte carregado com sucesso!")
