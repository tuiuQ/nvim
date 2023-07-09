local M = {};
local map = vim.keymap.set

-- gsplit: iterate over substrings in a string separated by a pattern
-- 
-- Parameters:
-- text (string)    - the string to iterate over
-- pattern (string) - the separator pattern
-- plain (boolean)  - if true (or truthy), pattern is interpreted as a plain
--                    string, not a Lua pattern
-- 
-- Returns: iterator
--
-- Usage:
-- for substr in gsplit(text, pattern, plain) do
--   doSomething(substr)
-- end
local function gsplit(text, pattern, plain)
  local splitStart, length = 1, #text
  return function ()
    if splitStart then
      local sepStart, sepEnd = string.find(text, pattern, splitStart, plain)
      local ret
      if not sepStart then
        ret = string.sub(text, splitStart)
        splitStart = nil
      elseif sepEnd < sepStart then
        -- Empty separator!
        ret = string.sub(text, splitStart, sepStart)
        if sepStart < length then
          splitStart = sepStart + 1
        else
          splitStart = nil
        end
      else
        ret = sepStart > splitStart and string.sub(text, splitStart, sepStart - 1) or ''
        splitStart = sepEnd + 1
      end
      return ret
    end
  end
end

-- split: split a string into substrings separated by a pattern.
-- 
-- Parameters:
-- text (string)    - the string to iterate over
-- pattern (string) - the separator pattern
-- plain (boolean)  - if true (or truthy), pattern is interpreted as a plain
--                    string, not a Lua pattern
-- 
-- Returns: table (a sequence table containing the substrings)
M.split = function (text, pattern, plain)
  local ret = {}
  for match in gsplit(text, pattern, plain) do
    table.insert(ret, match)
  end
  return ret
end

M.load_config = function(modules)
  if modules == '' then
    return {}
  end

  local opts = M.split(modules, "/")
  local configName = "";
  local moduleName = "";
  local pluginName = "";
  local module = {};

  if #opts >= 1 then
    configName = opts[1];
    module = require("configs." .. configName)
  end

  if #opts >= 2 then
    moduleName = opts[2];
  end

  if #opts >= 3 then
    pluginName = opts[3];
  end

  if not (pluginName == "") then
    return module[moduleName][pluginName]
  end

  if not (moduleName == "") then
    return module[moduleName]
  end

  if not (configName == "") then
    return module
  end

  return {}
end

M.load_keymaps = function ()
  local basic = M.load_config "mappings/basic"
  local default_options = {
    silent = true,
    desc = ""
  }

  for mode, keymaps in pairs(basic) do
    for key, opts in pairs(keymaps) do
      local actions = opts[1];
      default_options.desc = opts[2];
      map(mode, key, actions, default_options);
    end
  end
end

M.load_options = function ()
  local basic = M.load_config "options/basic"

  for mode, options in pairs(basic) do
    for key, value in pairs(options) do
      vim[mode][key] = value;
    end
  end
end

return M;
