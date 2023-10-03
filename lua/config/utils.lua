-- [nfnl] Compiled from fnl/config/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local fun = autoload("config.fun")
local core = autoload("nfnl.core")
local vim = vim
local function _2bdocs(opts, to)
  local function _2_(desc)
    return (desc or to)
  end
  return core.update(opts, "desc", _2_)
end
local function vis_op_2b(op, args)
  local function _3_()
    return op({vim.api.nvim_buf_get_mark(0, "<"), vim.api.nvim_buf_get_mark(0, ">")}, args)
  end
  return _3_
end
local function _2bbuffer(opts, buffer)
  local function _4_(b)
    return (b or buffer)
  end
  return core.update(opts, "buffer", _4_)
end
local function bkset(modes, from, to, opts)
  local opts0
  if (type(opts) == "table") then
    opts0 = _2bbuffer(opts, 0)
  elseif (type(opts) == "number") then
    opts0 = {buffer = opts}
  elseif (type(opts) == "string") then
    opts0 = {desc = opts}
  else
    opts0 = {buffer = 0}
  end
  return vim.keymap.set(modes, from, to, _2bdocs(opts0, to))
end
local function opt(key, value)
  vim.opt[key] = value
  return nil
end
local function g(key, value)
  vim.g[key] = value
  return nil
end
local function last(xs)
  return fun.nth(fun.length(xs), xs)
end
local function colorscheme(name)
  return vim.cmd(("colorscheme " .. name))
end
local function tx(...)
  local args = {...}
  local len = fun.length(args)
  if ("table" == type(last(args))) then
    local function _6_(acc, n, v)
      acc[n] = v
      return acc
    end
    return fun.reduce(_6_, last(args), fun.zip(fun.range(1, len), fun.take((len - 1), args)))
  else
    return args
  end
end
local function keymap(mode, key, command, opts)
  return vim.api.nvim_set_keymap(mode, key, command, opts)
end
local function buf_keymap(bufnr, mode, key, command, opts)
  return vim.api.nvim_buf_set_keymap(bufnr, mode, key, command, opts)
end
local function augroup(cmd, table)
  return vim.api.nvim_create_augroup(cmd, table)
end
local function autocmd(cmd, table)
  return vim.api.nvim_create_autocmd(cmd, table)
end
local function fmt_autocmd(_8_)
  local _arg_9_ = _8_
  local language = _arg_9_["language"]
  local pattern = _arg_9_["pattern"]
  local cmd = _arg_9_["cmd"]
  local group = augroup((language .. "_formatter"), {clear = true})
  return autocmd("BufWritePost", {pattern = pattern, group = group, desc = ("Auto-format " .. language .. " files before saving"), callback = vim.cmd(("!" .. cmd .. " " .. vim.api.nvim_buf_get_name(0)))})
end
local function has(plugin)
  return (((require("lazy.core.config")).plugins)[plugin] ~= nil)
end
local function on_very_lazy(_function)
  local function _10_()
    return _function()
  end
  return autocmd("User", {pattern = "VeryLazy", callback = _10_})
end
local function on_attach(on_attach0)
  local function _11_()
    return on_attach0()
  end
  return autocmd("LspAttach", {callback = _11_})
end
local function setup(plugin, config)
  local plugin0 = require(plugin)
  return plugin0.setup(config)
end
local function shell_exec(shell)
  local process = io.popen(shell)
  local reader = process:read("*a")
  process:close(nil)
  return reader
end
local function gitpush()
  return shell_exec("~/.config/nvim/scripts/gitpush.sh")
end
local function noremap(mode, key, command, _3fdesc)
  return keymap(mode, key, command, {silent = true, noremap = true, desc = _3fdesc})
end
local function lnoremap(mode, key, command, _3fdesc)
  return noremap(mode, ("<leader>" .. key), command, _3fdesc)
end
local function llmap(mode, key, command, desc)
  return keymap(mode, ("<localleader>" .. key), command, {silent = true, desc = desc, noremap = false})
end
return {opt = opt, colorscheme = colorscheme, g = g, keymap = keymap, buf_keymap = buf_keymap, augroup = augroup, autocmd = autocmd, ["fmt-autocmd"] = fmt_autocmd, has = has, ["vis-op+"] = vis_op_2b, bkset = bkset, ["on-very-lazy"] = on_very_lazy, ["on-attach"] = on_attach, tx = tx, setup = setup, noremap = noremap, lnoremap = lnoremap, llmap = llmap, ["shell-exec"] = shell_exec, gitpush = gitpush, merge = merge}
