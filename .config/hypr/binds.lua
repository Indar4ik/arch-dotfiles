local v = require("vars")

-- 1. Базовые программы
hl.bind(v.mainMod .. " + RETURN", hl.dsp.exec_cmd(v.terminal)) -- Kitty
hl.bind(v.mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(v.fileManager)) -- Thunar
hl.bind(v.mainMod .. " + W", hl.dsp.exec_cmd("firefox")) -- Firefox
hl.bind(v.mainMod .. " + P", hl.dsp.exec_cmd(v.terminal1 .. " -e btop")) -- btop

-- 2. Хоткеи оболочки
hl.bind(v.mainMod .. " + D", hl.dsp.exec_cmd(v.ipc .. " panel-toggle launcher")) -- Лаунчер
hl.bind("Print", hl.dsp.exec_cmd(v.ipc .. " screenshot-region")) -- Скриншот
hl.bind(v.mainMod .. " + CONTROL + Print", hl.dsp.exec_cmd(v.ipc .. " scripted-widget screen_recorder all toggle")) -- Запись экрана
hl.bind(v.mainMod .. " + V", hl.dsp.exec_cmd(v.ipc .. " panel-toggle clipboard")) -- Буфер обмена
hl.bind(v.mainMod .. " + A", hl.dsp.exec_cmd(v.ipc .. " panel-toggle control-center notifications")) -- Буфер обмена
hl.bind(v.mainMod .. " + L", hl.dsp.exec_cmd(v.ipc .. " session lock")) -- Заблокировать
hl.bind(v.mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(v.ipc .. " panel-toggle wallpaper")) -- Обои
hl.bind(v.mainMod .. " + SHIFT + Shift_L", hl.dsp.exec_cmd(v.ipc .. " panel-toggle control-center"), { release = true }) -- Панель управления 
hl.bind(v.mainMod .. " + CONTROL + Control_L", hl.dsp.exec_cmd(v.ipc .. " settings-toggle"), { release = true }) -- Настройки
hl.bind(v.mainMod .. " + ALT + Alt_L", hl.dsp.exec_cmd(v.ipc .. " panel-toggle session"), { release = true }) -- Меню сеанса

-- 3. Скрипты
hl.bind(v.mainMod .. " + CONTROL + U", hl.dsp.exec_cmd(v.terminal .. " --hold zsh " .. v.scripts .. "update.sh")) -- Обновление пакетов
hl.bind(v.mainMod .. " + CONTROL + H", hl.dsp.exec_cmd(v.terminal .. " --hold zsh -c 'cd ".. v.hypr .. "; vim ./'")) -- Конфиг hyprland
hl.bind(v.mainMod .. " + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | satty --filename - --fullscreen --output-filename ~/Изображения/Screenshots/satty-$(date '+%Y%m%d-%H%M%S').png")) -- Скриншот satty
-- hl.bind(v.mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p 'Буфер обмена' | cliphist decode | wl-copy")) -- Буфер обмена
-- hl.bind(v.mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist wipe")) -- Очистить буфер обмена"

-- 4. Приложения
hl.bind(v.mainMod .. " + T", hl.dsp.exec_cmd("flatpak run org.telegram.desktop")) -- Telegram
hl.bind(v.mainMod .. " + G", hl.dsp.exec_cmd("steam")) -- Steam
hl.bind(v.mainMod .. " + N", hl.dsp.exec_cmd("throne")) -- Throne
hl.bind(v.mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("flatpak run org.prismlauncher.PrismLauncher")) -- Prism

-- 5. Управление окнами
hl.bind(v.mainMod .. " + SHIFT + Q", hl.dsp.window.close()) -- Закрыть" 
hl.bind(v.mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" })) -- Развернуть 
hl.bind(v.mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" })) -- Полноэкранный режим 
hl.bind(v.mainMod .. " + CONTROL + F", hl.dsp.window.float({ action = "toggle" })) -- Плавающий режим 
hl.bind(v.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- Передвинуть 
hl.bind(v.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Масштабировать 
hl.bind(v.mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" })) -- Передвинуть влево
hl.bind(v.mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" })) -- Передвинуть вниз
hl.bind(v.mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" })) -- Передвинуть вверх
hl.bind(v.mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" })) -- Передвинуть вправо
hl.bind(v.mainMod .. " + CONTROL + left", hl.dsp.window.swap({ direction = "l" })) -- Поменять с левым
hl.bind(v.mainMod .. " + CONTROL + down", hl.dsp.window.swap({ direction = "d" })) -- Поменять с нижним
hl.bind(v.mainMod .. " + CONTROL + up", hl.dsp.window.swap({ direction = "u" })) -- Поменять с верхним
hl.bind(v.mainMod .. " + CONTROL + right", hl.dsp.window.swap({ direction = "r" })) -- Поменять с правым

-- 6. Управление Hyprland
hl.bind(v.mainMod .. " + CONTROL + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- Выйти из WM

-- 7. Перемещение фокуса
hl.bind(v.mainMod .. " + left", hl.dsp.focus({ direction = "l" })) -- Влево
hl.bind(v.mainMod .. " + down", hl.dsp.focus({ direction = "d" })) -- Вниз
hl.bind(v.mainMod .. " + up", hl.dsp.focus({ direction = "u" })) -- Вверх
hl.bind(v.mainMod .. " + right", hl.dsp.focus({ direction = "r" })) -- Вправо
hl.bind(v.mainMod .. " + TAB", hl.dsp.window.cycle_next()) -- Следующее

-- 8. Перемещение по столам
for i = 1, 10 do
    local key = i % 10
    hl.bind(v.mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i})) -- i
    hl.bind(v.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i })) -- Окно на i
end

hl.bind(v.mainMod .. " + S", hl.dsp.workspace.toggle_special("special")) -- Скрытый
hl.bind(v.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:special" })) -- Окно на скрытый

hl.bind(v.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(v.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))
