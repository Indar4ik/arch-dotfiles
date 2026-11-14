local layouts = {}

function layouts.change(step)
    return function ()
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
end

function layouts.bind(bind_table)
    return function ()
        local workspace = hl.get_active_special_workspace() or
                          hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

return layouts
