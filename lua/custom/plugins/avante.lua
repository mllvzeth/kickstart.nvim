-- Avante.nvim - AI-powered code assistance
return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Use latest (set to "*" for stable releases only)
  build = 'make',
  opts = {
    -- Provider: "openai" | "claude" | "azure" | "gemini" | "cohere" | "copilot"
    provider = 'claude',
    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-sonnet-4-20250514',
      temperature = 0,
      max_tokens = 4096,
    },
    -- Uncomment to use OpenAI instead:
    -- provider = "openai",
    -- openai = {
    --   endpoint = "https://api.openai.com/v1",
    --   model = "gpt-4o",
    --   temperature = 0,
    --   max_tokens = 4096,
    -- },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
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
