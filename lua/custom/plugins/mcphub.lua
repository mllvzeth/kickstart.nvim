-- MCPHub.nvim - MCP client for Neovim
-- Integrates MCP servers into your workflow with avante.nvim
return {
  'ravitemer/mcphub.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  build = 'bundled_build.lua',
  config = function()
    require('mcphub').setup {
      use_bundled_binary = true,
      extensions = {
        avante = {
          make_slash_commands = true, -- MCP prompts as /mcp:server:prompt
        },
      },
    }
  end,
}
