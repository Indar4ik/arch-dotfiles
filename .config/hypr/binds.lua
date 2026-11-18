local v = require("vars")
local windows = require("functions.windows")
local decorations = require("functions.decorations")
local layouts = require("functions.layouts")

-- 1. Базовые программы
hl.bind("SUPER + RETURN",           hl.dsp.exec_cmd(v.terminal))                -- Kitty
hl.bind("SUPER + SHIFT + RETURN",   hl.dsp.exec_cmd(v.terminal1))               -- Alacritty
hl.bind("SUPER + CONTROL + RETURN", hl.dsp.exec_cmd(v.fileManager))             -- Thunar
hl.bind("SUPER + W",                hl.dsp.exec_cmd("firefox"))                 -- Firefox

-- 2. Хоткеи оболочки
hl.bind("SUPER + F1",               hl.dsp.exec_cmd("pgrep --quiet noctalia && killall noctalia || noctalia"))      -- Переключить noctalia
hl.bind("F11",                      hl.dsp.exec_cmd(v.ipc .. "bar-toggle"))                                         -- Переключить панель
hl.bind("SUPER + D",                hl.dsp.exec_cmd(v.ipc .. "panel-toggle launcher"))                              -- Лаунчер
hl.bind("Print",                    hl.dsp.exec_cmd(v.ipc .. "screenshot-region"))                                  -- Скриншот
hl.bind("SUPER + CONTROL + Print",  hl.dsp.exec_cmd(v.ipc .. "plugin noctalia/screen_recorder:service all toggle")) -- Запись экрана
hl.bind("SUPER + V",                hl.dsp.exec_cmd(v.ipc .. "panel-toggle clipboard"))                             -- Буфер обмена
hl.bind("SUPER + SHIFT +  V",       hl.dsp.exec_cmd(v.ipc .. "clipboard-clear"))                                    -- Очистить буфер обмена
hl.bind("SUPER + E",                hl.dsp.exec_cmd(v.ipc .. "panel-toggle control-center notifications"))          -- Уведомления
hl.bind("SUPER + SHIFT + E",        hl.dsp.exec_cmd(v.ipc .. "notification-clear-history"))                         -- Очистить уведомления
--hl.bind("SUPER + ALT + L",        hl.dsp.exec_cmd(v.ipc .. "session lock"))                                       -- Заблокировать
hl.bind("SUPER + SHIFT + W",        hl.dsp.exec_cmd(v.ipc .. "panel-toggle wallpaper"))                             -- Обои
hl.bind("SUPER + Q",                hl.dsp.exec_cmd(v.ipc .. "panel-toggle control-center"))                        -- Панель управления 
hl.bind("Super + C",                hl.dsp.exec_cmd(v.ipc .. "settings-toggle"))                                    -- Настройки
hl.bind("Super_L + Alt_L",          hl.dsp.exec_cmd(v.ipc .. "panel-toggle session"), {release = true})             -- Меню сеанса
hl.bind("ALT + TAB",                hl.dsp.exec_cmd(v.ipc .. "window-switcher"))                                    -- Переключатель окон

-- 3. Скрипты
hl.bind("SUPER + P",                hl.dsp.exec_cmd(v.terminal1 .. " -e btop"))                                     -- btop
hl.bind("SUPER + CONTROL + U",      hl.dsp.exec_cmd(v.terminal .. " --hold zsh " .. v.scripts .. "update.sh"))      -- Обновление пакетов
hl.bind("SUPER + CONTROL + H",      hl.dsp.exec_cmd(v.terminal .. " --hold zsh -c 'cd ".. v.hypr .. "; vim ./'"))   -- Конфиг hyprland
hl.bind("SUPER + CONTROL + I",      hl.dsp.exec_cmd(v.terminal .. " --hold fastfetch"))                             -- Fastfetch
hl.bind("SUPER + Print",            hl.dsp.exec_cmd("grim -g \"$(slurp -d -b 000000b0 -c 76946a -B 1f1f28)\" - | satty --filename - --fullscreen --output-filename ~/Изображения/Screenshots/satty-$(date '+%Y%m%d-%H%M%S').png")) -- Скриншот satty
hl.bind("SUPER + ALT + V",          hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p 'Буфер обмена' | cliphist decode | wl-copy")) -- Буфер обмена
hl.bind("SUPER + ALT + SHIFT + V",  hl.dsp.exec_cmd("cliphist wipe"))                                               -- Очистить буфер обмена

-- 4. Приложения
hl.bind("SUPER + SHIFT + D",        hl.dsp.exec_cmd(v.launcher .. "type-1/style-5.rasi")) -- Rofi
hl.bind("SUPER + T",                hl.dsp.exec_cmd("Telegram"))                          -- Telegram
hl.bind("SUPER + G",                hl.dsp.exec_cmd("steam"))                             -- Steam
hl.bind("SUPER + N",                hl.dsp.exec_cmd("throne"))                            -- Throne
hl.bind("SUPER + SHIFT +  N",       hl.dsp.exec_cmd("killall Throne"))                    -- Закрыть Throne
hl.bind("SUPER + SHIFT + G",        hl.dsp.exec_cmd("prismlauncher"))                     -- Prism

-- 5. Управление окнами
hl.bind("SUPER + SHIFT + Q",        hl.dsp.window.close())                                                -- Закрыть 
hl.bind("SUPER + F",                hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))  -- Развернуть 
hl.bind("SUPER + SHIFT + F",        hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" })) -- Полноэкранный режим 
hl.bind("SUPER + CONTROL + F",      hl.dsp.window.float({ action = "toggle" }))                           -- Плавающий режим 
hl.bind("SUPER + mouse:272",        hl.dsp.window.drag(), { mouse = true })                               -- Передвинуть 
hl.bind("SUPER + mouse:273",        hl.dsp.window.resize(), { mouse = true })                             -- Масштабировать 

for key, dir in pairs({ H = "left", L = "right", K = "up", J = "down" }) do
    hl.bind("SUPER + " .. key, layouts.bind({
        dwindle   = hl.dsp.focus({ direction = dir }),
        scrolling = hl.dsp.layout("focus " .. dir)
    }),
    {
        repeating = true,
        submap_universal = true 
    }) -- Перемещение фокуса
    hl.bind("SUPER + SHIFT + " .. key, layouts.bind({
        dwindle   = hl.dsp.window.move({ direction = dir }),
        scrolling = hl.dsp.window.move({ direction = dir }),
    }),
    {
        repeating = true,
        submap_universal = true 
    }) -- Перемещение окон
end

hl.bind("SUPER + TAB", layouts.change(1))                       -- Циклическая смена лайаута на воркспейсе
hl.bind("SUPER + SHIFT + TAB", layouts.change(-1))              -- Циклическая смена лайаута на воркспейсе в обратом порядке
hl.bind("SUPER + BackSpace", windows.closeAllCurrentWorkspace)  -- Закрыть все окна на воркспейсе
hl.bind("SUPER + Delete", windows.closeAll)                     -- Закрыть все окна

hl.bind("SUPER + R", hl.dsp.submap("resize")) -- Режим управления оконами
hl.define_submap("resize", function()
    local moves = {
        {key = "H", x = -10, y = 0},
        {key = "J", x = 0,   y = -10},
        {key = "K", x = 0,   y = 10},
        {key = "L", x = 10,  y = 0}
    }

    for _,m in ipairs(moves) do
        hl.bind(m.key, hl.dsp.window.resize({ x = m.x, y = m.y, relative = true}), { repeating = true }) -- Расширить
    end

    hl.bind("CONTROL + C",     hl.dsp.submap("reset")) -- Выход
    hl.bind("escape",          hl.dsp.submap("reset")) -- Выход
end)

-- 6. Hypr ecosystem
hl.bind("SUPER + CONTROL + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- Выйти из Hyrpland
hl.bind("SUPER + CONTROL + W", hl.dsp.exec_cmd(v.scripts .. "toggle.sh")) -- Переключить Hyprpaper
hl.bind("SUPER + ALT + L",     hl.dsp.exec_cmd("hyprlock"))               -- Hyprlock

-- 7. Перемещение по столам
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }), { submap_universal = true })                       -- i
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { submap_universal = true })                 -- Окно на i
end

hl.bind("SUPER + grave",               hl.dsp.focus({ workspace = "name:coding" }), { submap_universal = true })           -- Кодинг
hl.bind("SUPER + SHIFT + grave",       hl.dsp.window.move({ workspace = "name:coding" }), { submap_universal = true })     -- Окно на кодинг

hl.bind("SUPER + S",                   hl.dsp.workspace.toggle_special("special"), { submap_universal = true })            -- Скрытый
hl.bind("SUPER + SHIFT + S",           hl.dsp.window.move({ workspace = "special:special" }), { submap_universal = true }) -- Окно на скрытый
hl.bind("SUPER + A",                   hl.dsp.workspace.toggle_special("coding"), { submap_universal = true })             -- Скрытый кодинг
hl.bind("SUPER + SHIFT + A",           hl.dsp.window.move({ workspace = "special:coding" }), { submap_universal = true })  -- Окно на скрытый кодинг

hl.bind("SUPER + mouse_down",          hl.dsp.focus({ workspace = "-1" }), { submap_universal = true})                     -- Предыдущий
hl.bind("SUPER + mouse_up",            hl.dsp.focus({ workspace = "+1" }), { submap_universal = true})                     -- Следующий
hl.bind("SUPER + SHIFT + mouse_down",  hl.dsp.window.move({ workspace = "-1" }), { submap_universal = true})               -- Окно на предыдущий
hl.bind("SUPER + SHIFT + mouse_up",    hl.dsp.window.move({ workspace = "+1" }), { submap_universal = true})               -- Окно на следующий
hl.bind("SUPER + SHIFT + left",        hl.dsp.window.move({ workspace = "-1" }), { submap_universal = true})               -- Окно на предыдущий
hl.bind("SUPER + SHIFT + right",       hl.dsp.window.move({ workspace = "+1" }), { submap_universal = true})               -- Окно на следующий

hl.bind("SUPER + F2", decorations.toggle)
