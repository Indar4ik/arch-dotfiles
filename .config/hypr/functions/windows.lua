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

function windows.changeLayout(step)
--  local layouts   = { "dwindle", "scrolling", "master", "monocle" }
    local layouts   = { "dwindle", "scrolling", "master" }
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + step
            next_layout = layouts[next_layout_idx]
            break
        end
    end

    hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
end

function windows.closeAll()
    local windows = hl.get_windows()

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

function windows.closeAllCurrentWorkspace()
    local cws = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        cws = hl.get_active_special_workspace()
    end
    local windows = hl.get_windows({ workspace = cws })

    for _,w in pairs(windows) do
        hl.dispatch(hl.dsp.window.close({ window = w }))
    end
end

return windows
