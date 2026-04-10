local DeğerliMeyveler = {"Kitsune", "Leopard", "Dragon", "Dough", "T-Rex", "Mammoth"}
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- 1. ADIM: Başka bir sunucu bulma fonksiyonu
function SunucuBul()
    local sf, result = pcall(function()
        -- Oyunun sunucu listesini API üzerinden çeker (Oyuncu sayısına göre sıralar)
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
        for _, server in pairs(servers.data) do
            -- Eğer sunucu dolu değilse ve şu anki sunucu değilse oraya git
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                return server.id
            end
        end
    end)
    return result
end

-- 2. ADIM: Meyveyi tara ve ışınlan
function MeyveKontrolEt()
    local meyveBuldum = false
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Tool") or v:IsA("Model") then
            if string.find(v.name, "Fruit") then
                for _, isim in pairs(DeğerliMeyveler) do
                    if string.find(v.name, isim) then
                        print("MÜJDE! " .. v.name .. " bulundu. Işınlanılıyor...")
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        meyveBuldum = true
                        -- Meyveyi bulduğumuz için burada duruyoruz, sunucu değiştirmiyoruz.
                        return true
                    end
                end
            end
        end
    end
    return false
end

-- 3. ADIM: Ana İşlem (Sistem burada başlıyor)
task.wait(2) -- Sunucuya giriş için bekle

if not MeyveKontrolEt() then
    print("Bu sunucuda değerli meyve yok. Yeni sunucuya geçiliyor...")
    local yeniSunucuID = SunucuBul()
    if yeniSunucuID then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, yeniSunucuID)
    else
        -- Eğer özel sunucu bulunamazsa rastgele birine at
        TeleportService:Teleport(game.PlaceId)
    end
end
