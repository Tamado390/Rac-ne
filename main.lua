local Players = game:GetService("Players")

-- Thời gian chờ (5 phút)
local waitTime = 300

-- Lặp qua tất cả nhân vật trong game
for _,player in pairs(Players:GetPlayers()) do
    -- Gắn một biến để đếm thời gian
    local timer = 0

    -- Thiết lập một luồng chạy song song để tính thời gian đứng im
    spawn(function()
        while true do
            wait(1) -- Đợi 1 giây

            -- Kiểm tra trạng thái của nhân vật
            if player and player.Character and player.Character.Humanoid and player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                -- Reset thời gian nếu nhân vật đang nhảy
                timer = 0
            else
                -- Tăng thời gian lên 1 giây
                timer = timer + 1

                -- Kiểm tra nếu thời gian đứng im vượt quá 5 phút
                if timer >= waitTime then
                    -- Kick nhân vật
                    player:Kick("Bạn đã đứng im quá lâu.")
                    
                    -- Dừng vòng lặp
                    break
                end
            end
        end
    end)
end