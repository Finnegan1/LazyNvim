return {
  "robitx/gp.nvim",
  config = function ()
    local conf = {
--      openai_api_key = { "pass", "LocalEnv/OpenAI" },
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      providers = {
        openai = {
 			    disable = true,
 			    endpoint = "https://api.openai.com/v1/chat/completions",
 			    secret = os.getenv("OPENAI_API_KEY"),
 		    },
        copilot = {
          disable = false,
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
        anthropic = {
          disable = true,
          endpoint = "https://api.anthropic.com/v1/messages",
          secret = { "pass", "LocalEnv/Anthropic" },
        },
        googleai = {
          disable = true,
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
          secret = { "pass", "LocalEnv/Gemini" },
        },
        azure = {
          disable = true,
          endpoint = "https://{URL}.openai.azure.com/openai/deployments/{DEPLOYMENT}/chat/completions",
          secret = { "pass", "LocalEnv/AzureUSEast" },
        },
      }
    }
    require("gp").setup(conf)
  end
}
