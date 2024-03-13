return function(_, opts)
  local cmp = require("cmp")
  local compare = require("cmp.config.compare")
  local luasnip = require("luasnip")

  opts.mapping = vim.tbl_extend("force", opts.mapping, {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
  })

  -- -- In case netive snippets are enabled
  -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --   ["<Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
  --     elseif vim.snippet.jumpable(1) then
  --       vim.snippet.jump(1)
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),
  --   ["<S-Tab>"] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.confirm({ select = true })
  --     elseif vim.snippet.jumpable(-1) then
  --       vim.snippet.jump(-1)
  --     else
  --       fallback()
  --     end
  --   end, { "i", "s" }),
  --   ["<CR>"] = cmp.config.disable,
  -- })

  opts.sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 5 },
    { name = "luasnip", priority = 4, keyword_length = 2 },
    { name = "buffer", priority = 4 },
    { name = "copilot", priority = 4, keyword_pattern = [[\%(\w\+\)]], keyword_length = 4 }, -- Make copilot not trigger on special characters
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
    { name = "cmdline" },
  })

  opts.sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.kind,
      compare.length,
      compare.order,
    },
  }

  opts.window = {
    completion = {
      col_offset = 0,
      side_padding = 1,
    },
    documentation = {
      winhighlight = "Normal:CmpDocumentationCustom,FloatBorder:CmpDocumentationCustom",
    },
  }

  opts.formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, item)
      local icons = require("lazyvim.config").icons.kinds
      if icons[item.kind] then
        item.menu = " " .. item.kind .. ""
        item.menu_hl_group = "Identifier"
        item.kind = icons[item.kind]
      end

      return item
    end,
  }
end
