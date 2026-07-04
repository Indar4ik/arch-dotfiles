hl.layer_rule({
    name = "noctalia",
    match = { namespace = "^noctalia-(bar-.+|attached-.+|notification|dock|panel)$" },
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true
})

hl.workspace_rule({ workspace = "9", layout = "scrolling" })
hl.workspace_rule({ workspace = "name:coding", no_rounding = true, decorate = false, gaps_in = 0, gaps_out = 0, border_size = 1 })
hl.workspace_rule({ workspace = "special:coding", no_rounding = true, decorate = false, gaps_in = 0, gaps_out = 0, border_size = 1 })

hl.window_rule({ match = { class = "Alacritty" }, rounding = 0, no_blur = true, opacity = "1.0 1.0 override"})
hl.window_rule({ match = { class = "mpv" }, fullscreen = true, rounding = 0, no_blur = true, opacity = "1.0 1.0 override"})
hl.window_rule({ match = { class = "balls-in-circle" }, fullscreen = true, rounding = 0, no_blur = true, opacity = "1.0 1.0 override"})
