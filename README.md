# lualine-so-fancy.nvim

![code size](https://img.shields.io/github/languages/code-size/meuter/lualine-so-fancy.nvim?style=flat-square)
![license](https://img.shields.io/github/license/meuter/lualine-so-fancy.nvim?style=flat-square)

Small collection of _fancy_ components for the [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
plugin. The main purpose of this plugin is to simplify my personal lualine configuration. But if someone finds
this helpful or useful at all... _sharing is caring_ as they say.

![Fancy!](/fancy.png?raw=true "Oh So Fancy")

## Installation

For [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "meuter/lualine-so-fancy.nvim",
    },
    opts = {
        options = {
            theme = "seoul256",
            component_separators = { left = "│", right = "│" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
            refresh = {
                statusline = 100,
            },
        },
        sections = {
            lualine_a = {
                { "fancy_mode", width = 3 }
            },
            lualine_b = {
                { "fancy_branch" },
                { "fancy_diff" },
            },
            lualine_c = {
                { "fancy_cwd", substitute_home = true }
            },
            lualine_x = {
                { "fancy_macro" },
                { "fancy_diagnostics" },
                { "fancy_searchcount" },
                { "location" },
            },
            lualine_y = {
                { "filetype" },
            },
            lualine_z = {
                { "fancy_lsp_servers" }
            },
        }
    },
}
```
## Components

- `fancy_branch`: same as `branch` but with different default icon.
- `fancy_cwd`: displays the current working directory. By default, the `$HOME` directory is substituted with `~`. 
  The default behaviour can be changed using `substitute_home=false`.
- `fancy_diagnostics`: same as `diagnostics` but with different default symbols.
- `fancy_diff`: same as `diff` but with different default synbols.
- `fancy_lsp_servers`: display the list of currently connected LSP servers and [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) tools.
- `fancy_macro`: displays the currently recording macros if any (useful if one uses `cmdheight=0`).
- `fancy_mode`: same as `mode` but within a fixed-width section to avoid other components changing places when
  switching to/from certain modes (`len("NORMAL") != len("TERMINAL")`). Use the `width` option to configure the 
  width of the section (default is `3`). If `width` is smaller than the length of the mode, the mode is truncated,
  otherwise the mode is centered within the section.
- `fancy_searchcount`: same as `searchcount` but with a different default icon and without the brackets `[]`.

All components can be customized similarly to the ones provided by lualine (`icon`, `color`, etc.).

# Contributing

If anyone would like to contribute with some fixes, improvements, extra components, pull-requests are welcome. 
Just keep in mind that I have a day-job, and may not be able get to them immediately, but I'll do my best 😅.
