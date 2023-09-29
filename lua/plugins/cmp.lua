-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local cmp_src_menu_items = {copilot = "copilot", conjure = "conjure", nvim_lsp = "lsp", luasnip = "snippet", buffer = "buffer", emoji = "emoji", nerdfont = "nerdfont"}
local cmp_srcs = {{name = "copilot"}, {name = "nvim_lsp"}, {name = "luasnip"}, {name = "conjure"}, {name = "buffer"}, {name = "emoji"}, {name = "nerdfont"}}
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (((vim.api.nvim_buf_get_lines(0, (line - 1), line, true))[1]):sub(col, col):match("%s") == nil))
end
local function mapping(cmp, luasnip)
  return cmp.mapping.preset.insert({["<C-k>"] = cmp.mapping.select_prev_item(), ["<C-j>"] = cmp.mapping.select_next_item(), ["<C-l>"] = cmp.mapping.complete(), ["<ESC>"] = cmp.mapping.close(), ["<TAB>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true})})
end
local function opts(cmp, luasnip)
  local function _1_(entry, item)
    item.menu = (cmp_src_menu_items[entry.source.name] or "")
    return item
  end
  local function _2_(args)
    return luasnip.lsp_expand(args.body)
  end
  return {formatting = {format = _1_}, mapping = mapping(cmp), snippet = {expand = _2_}, window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}, sources = cmp_srcs}
end
local function _3_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  return cmp.setup(opts(cmp, luasnip))
end
return {{"hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-copilot", "PaterJason/cmp-conjure", "hrsh7th/cmp-emoji", "saadparwaiz1/cmp_luasnip", "chrisgrieser/cmp-nerdfont", "L3MON4D3/LuaSnip", "github/copilot.vim"}, config = _3_, version = false}}
