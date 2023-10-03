-- [nfnl] Compiled from fnl/plugins/rest.fnl by https://github.com/Olical/nfnl, do not edit.
local opts
local function _1_(body)
  return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
end
opts = {encode_url = true, highlight = {enabled = true, timeout = 150}, result = {show_url = true, show_http_info = true, show_headers = true, formatters = {json = "jq", html = _1_}, show_curl_command = false}, env_file = ".env", custom_dynamic_variables = {}, yank_dry_run = true, result_split_horizontal = false, result_split_in_place = false, jump_to_request = false, skip_ssl_verification = false}
return {{"rest-nvim/rest.nvim", dependencies = {"nvim-lua/plenary.nvim"}, ft = {"http"}, keys = {{"<Leader>mh", "<Plug>RestNvim", desc = "Execute HTTP request"}}, opts = opts}}
