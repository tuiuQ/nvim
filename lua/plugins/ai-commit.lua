return {
  "vernette/ai-commit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "AICommit",          -- 按需加载，用到 :AICommit 时才加载
  keys = {
    { "<leader>ac", "<cmd>AICommit<cr>", desc = "AI 生成提交信息" },
  },
  opts = {
    -- 1) 直接写 key（不推荐，会进 git）
    -- openrouter_api_key = "sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxxxxxx",

    -- 2) 建议把 key 放到环境变量 OPENROUTER_API_KEY，这里留空即可
    openrouter_api_key = nil,

    -- 选用免费模型；也可换成付费模型或 Claude / GPT 系列
    model = "qwen/qwen-2.5-72b-instruct:free",

    -- 提交后是否自动 git push
    auto_push = false,
  },
}
