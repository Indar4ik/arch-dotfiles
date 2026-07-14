hl.on("hyprland.start", function()
--  hl.exec_cmd("noctalia")
    hl.exec_cmd("systemctl --user start sye.service")
end)
