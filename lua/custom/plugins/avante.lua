-- Avante.nvim - AI-powered code assistance with MCPHub integration
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Use latest (set to "*" for stable releases only)
  build = 'make',
  config = function()
    require('avante').setup {
      -- Provider: "openai" | "claude" | "azure" | "gemini" | "cohere" | "copilot"
      provider = 'claude',
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-sonnet-4-20250514',
        temperature = 0,
        max_tokens = 4096,
      },

      -- MCPHub integration: inject MCP server state into system prompt
      system_prompt = function()
        local hub = require('mcphub').get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ''
      end,

      -- MCPHub custom tools for MCP server access
      custom_tools = function()
        return { require('mcphub.extensions.avante').mcp_tool() }
      end,

      -- Disable built-in tools that conflict with MCPHub's neovim server
      disabled_tools = {
        'list_files',
        'search_files',
        'read_file',
        'create_file',
        'rename_file',
        'delete_file',
        'create_dir',
        'rename_dir',
        'delete_dir',
        'bash',
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ravitemer/mcphub.nvim', -- MCPHub dependency
    -- Optional dependencies
    'nvim-telescope/telescope.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-tree/nvim-web-devicons',
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { 'markdown', 'Avante' } },
      ft = { 'markdown', 'Avante' },
    },
  },
}
