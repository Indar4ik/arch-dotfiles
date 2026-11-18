local windows = {}

function windows.minimize()
    if hl.get_workspace("special:minimized") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    else
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
    end
end

function windows.closeAll()
    local windows = hl.get_windows()

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

function windows.closeAllCurrentWorkspace()
    local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
    local windows = hl.get_windows({ workspace = workspace })

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

function windows.resize()
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
end

return windows
