hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 1,
    },
  
    decoration = {
        rounding = 14,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
        enabled = false,
        },
        blur = {
        enabled = true,
        size = 3,
        passes = 4,
        vibrancy = 0.15,
        vibrancy_darkness = 2.5,
        -- noise = 0.008,
        -- contrast = 0.9,
        brightness = 0.9,
        popups = true,
        popups_ignorealpha = 0.3,
        },
    },

    animations = {
        enabled = true,
    }
})
