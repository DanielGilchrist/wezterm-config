require("commands").register_commands()

local wezterm = require("wezterm")
local os_utils = require("utils.os")
local key_utils = require("utils.key")
local table_utils = require("utils.table")

local command = key_utils.command_key()

local misc = {
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",
  max_fps = 120,
  native_macos_fullscreen_mode = true,
  automatically_reload_config = false,
  window_close_confirmation = "AlwaysPrompt",
  notification_handling = "AlwaysShow",
  exit_behavior = "Close",
  enable_scroll_bar = true, -- per pane scrollbar 👀  - https://github.com/wez/wezterm/pull/1886
  scrollback_lines = 25000,
  window_padding = {
    left = 0,
    right = 10, -- controls the width of the scrollbar
    top = 4,
    bottom = 0,
  },
  color_scheme = "tokyonight_night",
  font = wezterm.font_with_fallback({
    {
      family = "JetBrains Mono",
      harfbuzz_features = { "liga=1" },
    },
    {
      family = "MesloLGS NF",
    },
  }),
  font_size = os_utils.system() == "macos" and 14 or 12,
  initial_cols = 150,
  initial_rows = 50,

  mouse_bindings = {
    -- CMD + click links
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = command,
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}

return table_utils.merge_all(misc, require("key_bindings"), {})
