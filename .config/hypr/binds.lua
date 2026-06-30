local v = require("vars")

-- 1. Базовые программы
hl.bind("SUPER + RETURN",         hl.dsp.exec_cmd(v.terminal)) -- Kitty
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(v.fileManager)) -- Thunar
hl.bind("SUPER + W",              hl.dsp.exec_cmd("firefox")) -- Firefox
hl.bind("SUPER + P",              hl.dsp.exec_cmd(v.terminal1 .. " -e btop")) -- btop

-- 2. Хоткеи оболочки
hl.bind("F11",                         hl.dsp.exec_cmd(v.ipc .. " bar-toggle")) -- Переключить панель
hl.bind("SUPER + D",                   hl.dsp.exec_cmd(v.ipc .. " panel-toggle launcher")) -- Лаунчер
hl.bind("Print",                       hl.dsp.exec_cmd(v.ipc .. " screenshot-region")) -- Скриншот
hl.bind("SUPER + CONTROL + Print",     hl.dsp.exec_cmd(v.ipc .. " plugin noctalia/screen_recorder:service all toggle")) -- Запись экрана
hl.bind("SUPER + V",                   hl.dsp.exec_cmd(v.ipc .. " panel-toggle clipboard")) -- Буфер обмена
hl.bind("SUPER + N",                   hl.dsp.exec_cmd(v.ipc .. " panel-toggle control-center notifications")) -- Уведомления
hl.bind("SUPER + SHIFT + L",           hl.dsp.exec_cmd(v.ipc .. " session lock")) -- Заблокировать
hl.bind("SUPER + SHIFT + W",           hl.dsp.exec_cmd(v.ipc .. " panel-toggle wallpaper")) -- Обои
hl.bind("SUPER + SHIFT + Shift_L",     hl.dsp.exec_cmd(v.ipc .. " panel-toggle control-center"), { release = true }) -- Панель управления 
hl.bind("SUPER + CONTROL + Control_L", hl.dsp.exec_cmd(v.ipc .. " settings-toggle"), { release = true }) -- Настройки
hl.bind("SUPER + ALT + Alt_L",         hl.dsp.exec_cmd(v.ipc .. " panel-toggle session"), { release = true }) -- Меню сеанса

-- 3. Скрипты
hl.bind("SUPER + CONTROL + U", hl.dsp.exec_cmd(v.terminal .. " --hold zsh " .. v.scripts .. "update.sh")) -- Обновление пакетов
hl.bind("SUPER + CONTROL + H", hl.dsp.exec_cmd(v.terminal .. " --hold zsh -c 'cd ".. v.hypr .. "; vim ./'")) -- Конфиг hyprland
hl.bind("SUPER + CONTROL + I", hl.dsp.exec_cmd(v.terminal .. " --hold fastfetch")) -- Fastfetch
hl.bind("SUPER + Print",       hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | satty --filename - --fullscreen --output-filename ~/Изображения/Screenshots/satty-$(date '+%Y%m%d-%H%M%S').png")) -- Скриншот satty
hl.bind("SUPER + SHIFT + D",   hl.dsp.exec_cmd("rofi -show")) -- Rofi
--hl.bind("SUPER + V",         hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p 'Буфер обмена' | cliphist decode | wl-copy")) -- Буфер обмена
--hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("cliphist wipe")) -- Очистить буфер обмена"

-- 4. Приложения
hl.bind("SUPER + T",           hl.dsp.exec_cmd("flatpak run org.telegram.desktop")) -- Telegram
hl.bind("SUPER + G",           hl.dsp.exec_cmd("steam")) -- Steam
hl.bind("SUPER + N",           hl.dsp.exec_cmd("throne")) -- Throne
hl.bind("SUPER + SHIFT + G",   hl.dsp.exec_cmd("flatpak run org.prismlauncher.PrismLauncher")) -- Prism

-- 5. Управление окнами
hl.bind("SUPER + SHIFT + Q",   hl.dsp.window.close()) -- Закрыть" 
hl.bind("SUPER + F",           hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" })) -- Развернуть 
hl.bind("SUPER + SHIFT + F",   hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" })) -- Полноэкранный режим 
hl.bind("SUPER + CONTROL + F", hl.dsp.window.float({ action = "toggle" })) -- Плавающий режим 
hl.bind("SUPER + mouse:272",   hl.dsp.window.drag(), { mouse = true }) -- Передвинуть 
hl.bind("SUPER + mouse:273",   hl.dsp.window.resize(), { mouse = true }) -- Масштабировать 
hl.bind("SUPER + R",           hl.dsp.submap("resize")) -- Режим управления оконами

-- Режим управления оконами
hl.define_submap("resize", function()
    hl.bind("left",            hl.dsp.window.move({ direction = "l" })) -- Передвинуть влево
    hl.bind("down",            hl.dsp.window.move({ direction = "d" })) -- Передвинуть вниз
    hl.bind("up",              hl.dsp.window.move({ direction = "u" })) -- Передвинуть вверх
    hl.bind("right",           hl.dsp.window.move({ direction = "r" })) -- Передвинуть вправо

    hl.bind("CONTROL + left",  hl.dsp.window.swap({ direction = "l" })) -- Поменять с левым
    hl.bind("CONTROL + down",  hl.dsp.window.swap({ direction = "d" })) -- Поменять с нижним
    hl.bind("CONTROL + up",    hl.dsp.window.swap({ direction = "u" })) -- Поменять с верхним
    hl.bind("CONTROL + right", hl.dsp.window.swap({ direction = "r" })) -- Поменять с правым

    hl.bind("SHIFT + left",    hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true }) -- Расширить влево
    hl.bind("SHIFT + down",    hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true }) -- Расширить вверх
    hl.bind("SHIFT + up",      hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true }) -- Расширить вниз
    hl.bind("SHIFT + right",   hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true }) -- Расширить вправо

    hl.bind("SUPER + left",    hl.dsp.focus({ direction = "l" }), { repeating = true }) -- Влево
    hl.bind("SUPER + down",    hl.dsp.focus({ direction = "d" }), { repeating = true }) -- Вниз
    hl.bind("SUPER + up",      hl.dsp.focus({ direction = "u" }), { repeating = true }) -- Вверх
    hl.bind("SUPER + right",   hl.dsp.focus({ direction = "r" }), { repeating = true }) -- Вправо

    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- 6. Hypr ecosystem
hl.bind("SUPER + CONTROL + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- Выйти из Hyrpland
hl.bind("SUPER + CONTROL + W", hl.dsp.exec_cmd("systemctl --user is-active --quiet hyprpaper.service && systemctl --user stop hyprpaper.service || systemctl --user start hyprpaper.service")) -- Переключить Hyprpaper
hl.bind("SUPER + L",           hl.dsp.exec_cmd("hyprlock")) -- Hyprlock

-- 7. Перемещение фокуса
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }), { repeating = true }) -- Влево
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }), { repeating = true }) -- Вниз
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }), { repeating = true }) -- Вверх
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }), { repeating = true }) -- Вправо
hl.bind("SUPER + TAB",   hl.dsp.window.cycle_next(), { repeating = true }) -- Следующее

-- 8. Перемещение по столам
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }), { submap_universal = true }) -- i
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { submap_universal = true }) -- Окно на i
end

hl.bind("SUPER + grave",               hl.dsp.focus({ workspace = "name:coding" }), { submap_universal = true }) -- Кодинг
hl.bind("SUPER + SHIFT + grave",       hl.dsp.window.move({ workspace = "name:coding" }), { submap_universal = true }) -- Окно на кодинг

hl.bind("SUPER + S",                   hl.dsp.workspace.toggle_special("special"), { submap_universal = true }) -- Скрытый
hl.bind("SUPER + SHIFT + S",           hl.dsp.window.move({ workspace = "special:special" }), { submap_universal = true }) -- Окно на скрытый
hl.bind("SUPER + A",                   hl.dsp.workspace.toggle_special("coding"), { submap_universal = true }) -- Скрытый кодинг
hl.bind("SUPER + SHIFT + A",           hl.dsp.window.move({ workspace = "special:coding" }), { submap_universal = true }) -- Окно на скрытый кодинг

hl.bind("SUPER + mouse_down",          hl.dsp.focus({ workspace = "-1" }), { submap_universal = true}) -- Предыдущий
hl.bind("SUPER + mouse_up",            hl.dsp.focus({ workspace = "+1" }), { submap_universal = true}) -- Следующий
hl.bind("SUPER + SHIFT + mouse_down",  hl.dsp.window.move({ workspace = "-1" }), { submap_universal = true}) -- Окно на предыдущий
hl.bind("SUPER + SHIFT + mouse_up",    hl.dsp.window.move({ workspace = "+1" }), { submap_universal = true}) -- Окно на следующий
