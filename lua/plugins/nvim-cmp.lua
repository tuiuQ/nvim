local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}


local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return {{"hrsh7th/cmp-nvim-lsp"},{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "SirVer/ultisnips",
      dependencies = {
        "honza/vim-snippets"
      },
      config = function()
        vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
        vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
        vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
        vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/Ultisnips" }
      end
    },
    "quangnguyen30192/cmp-nvim-ultisnips"
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand= function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      },
      mapping = {
        ["<Tab>"] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
              cmp.complete()
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
              vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
        ["<S-Tab>"] = cmp.mapping({
          c = function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
              cmp.complete()
            end
          end,
          i = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end,
          s = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
              return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
              fallback()
            end
          end
        }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<CR>'] = cmp.mapping({
          i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          c = function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true})
            else
              fallback()
            end
          end
        }),
      },
      formatting = {
        fields = {
          "kind", "abbr", "menu"
        },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            ultisnips = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]"
          })[entry.source.name]
          return vim_item
        end
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" }
      }, {
          { name = "buffer" },
          { name = "path" }
        })
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = "cmp_git" }
      }, {
          { name = "buffer" }
        })
    })

    cmp.setup.cmdline("/", {
      completion = {
        autocomplete = false
      },
      sources = {
        { name = "buffer" }
      }
    })

    cmp.setup.cmdline(":", {
      completion = {
        autocomplete = false
      },
      sources = cmp.config.sources({
        { name = "path" }
      }, {
          { name = "cmdline" }
        })
    })
  end
}}
