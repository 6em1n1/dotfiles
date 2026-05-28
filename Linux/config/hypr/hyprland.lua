-- 6em1n1's hyprland.lua

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local terminalAI  = "warp-terminal"
local taskManager = "kitty -e htop"
local fileManager = "thunar"
local codeEditor  = "code"
local browser     = "firefox"
local menu        = "rofi -show drun -run-command 'uwsm app -- {cmd}'"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
   hl.exec_cmd("uwsm app -- ashell")
   hl.exec_cmd("uwsm app -- protonvpn-app")
end)


-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 2.5,
        gaps_out = { top = 0, right = 5, bottom = 5, left = 5 },
        float_gaps = 5,
        border_size = 2,

        col = {
            active_border   = { colors = {"rgb(7aa2f7)", "rgb(bb9af7)", "rgb(7dcfff)"}, angle = 45 },
            inactive_border = "rgba(1a1f4acc)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 0.97,
        inactive_opacity = 0.92,
        fullscreen_opacity = 1,

        shadow = {
            enabled      = true,
            range        = 18,
            render_power = 3,
            color        = "rgba(05082180)",
            color_inactive = "rgba(05082155)",
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 3,
            popups     = true,
            new_optimizations = true,
            ignore_opacity = true,
            xray = true,
            contrast = 1.05,
            brightness = 0.95,
            noise = 0.02,
            vibrancy  = 0.25,
            vibrancy_darkness = 0.4,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOut",   { type = "bezier", points = { {0.16, 1},    {0.30, 1}    } })
hl.curve("easeInOut", { type = "bezier", points = { {0.45, 0},    {0.55, 1}    } })
hl.curve("liner",     { type = "bezier", points = { {0,    0},    {1,    1}    } })
hl.curve("overshoot", { type = "bezier", points = { {0.05, 0.9},  {0.1,  1.05} } })
hl.curve("bouncy",    { type = "bezier", points = { {0.34, 1.56}, {0.64, 1}    } })
hl.curve("md3_decel", { type = "bezier", points = { {0.05, 0.7},  {0.1,  1}    } })
hl.curve("md3_accel", { type = "bezier", points = { {0.3,  0},    {0.8,  0.15} } })
hl.curve("smooth",    { type = "bezier", points = { {0.25, 0.46}, {0.45, 0.94} } })
hl.curve("snap",      { type = "bezier", points = { {0.15, 0},    {0.1,  1}    } })
hl.curve("throwOut",  { type = "bezier", points = { {0.7,  0},    {0.84, 0}    } })

hl.animation({ leaf = "global",              enabled = true,  speed = 7,   bezier = "default"    })
hl.animation({ leaf = "border",              enabled = true,  speed = 8,   bezier = "easeOut"    })
hl.animation({ leaf = "borderangle",         enabled = true,  speed = 100, bezier = "liner",     style = "loop"              })

hl.animation({ leaf = "windows",             enabled = true,  speed = 5,   bezier = "overshoot", style = "slide"             })
hl.animation({ leaf = "windowsIn",           enabled = true,  speed = 4,   bezier = "smooth",    style = "slide"             })
hl.animation({ leaf = "windowsOut",          enabled = true,  speed = 4,   bezier = "smooth",    style = "slide"             })
hl.animation({ leaf = "windowsMove",         enabled = true,  speed = 4,   bezier = "smooth"                                 })

hl.animation({ leaf = "fade",                enabled = true,  speed = 5,   bezier = "smooth"                                 })
hl.animation({ leaf = "fadeIn",              enabled = true,  speed = 4,   bezier = "smooth"                                 })
hl.animation({ leaf = "fadeOut",             enabled = true,  speed = 4,   bezier = "smooth"                                 })
hl.animation({ leaf = "fadeSwitch",          enabled = true,  speed = 4,   bezier = "md3_decel"                              })
hl.animation({ leaf = "fadeShadow",          enabled = true,  speed = 4,   bezier = "smooth"                                 })
hl.animation({ leaf = "fadeDim",             enabled = true,  speed = 4,   bezier = "smooth"                                 })

hl.animation({ leaf = "layers",              enabled = true,  speed = 5,   bezier = "easeOut",   style = "slide"             })
hl.animation({ leaf = "layersIn",            enabled = true,  speed = 5,   bezier = "overshoot", style = "fade"              })
hl.animation({ leaf = "layersOut",           enabled = true,  speed = 3,   bezier = "md3_accel", style = "fade"              })
hl.animation({ leaf = "fadeLayersIn",        enabled = true,  speed = 4,   bezier = "md3_decel"                              })
hl.animation({ leaf = "fadeLayersOut",       enabled = true,  speed = 3,   bezier = "md3_accel"                              })

hl.animation({ leaf = "workspaces",          enabled = true,  speed = 4,   bezier = "smooth",    style = "slide"             })
hl.animation({ leaf = "workspacesIn",        enabled = true,  speed = 4,   bezier = "smooth",    style = "slide"             })
hl.animation({ leaf = "workspacesOut",       enabled = true,  speed = 4,   bezier = "smooth",    style = "slide"             })
hl.animation({ leaf = "specialWorkspace",    enabled = true,  speed = 5,   bezier = "overshoot", style = "slidefadevert 15%" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true,  speed = 5,   bezier = "overshoot", style = "slidefadevert 15%" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true,  speed = 4,   bezier = "md3_accel", style = "slidefadevert 15%" })

hl.animation({ leaf = "zoomFactor",          enabled = true,  speed = 6,   bezier = "easeOut"                                })

hl.config({
    dwindle = {
        preserve_split = true,
        force_split = 2,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
    },
})

hl.config({
    ecosystem = {
        no_donation_nag = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "es",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            tap_to_click = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.config({
    cursor = {
        inactive_timeout  = 5,
        hide_on_key_press = true,
        default_monitor   = "eDP-1",
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd("uwsm app -- " .. terminalAI))
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("uwsm app -- " .. menu))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd("uwsm app -- " .. taskManager))
hl.bind(mainMod .. " + F",      hl.dsp.exec_cmd("uwsm app -- " .. fileManager))
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd("uwsm app -- " .. codeEditor))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd("uwsm app -- " .. browser))
hl.bind(mainMod .. " + N",      hl.dsp.exec_cmd("uwsm app -- " .. browser .. " --private-window"))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("uwsm app -- pidof hyprlock || hyprlock"))
hl.bind(mainMod .. " + K",      hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J",   hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + PRINT",         hl.dsp.exec_cmd("uwsm app -- hyprshot -m window"))
hl.bind("PRINT",                        hl.dsp.exec_cmd("uwsm app -- hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
