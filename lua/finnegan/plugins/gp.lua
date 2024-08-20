return {
  "robitx/gp.nvim",
  config = function ()
    local conf = {
      openai_api_key = { "pass", "LocalEnv/OpenAI" },
      providers = {
        openai = {
 			    disable = false,
 			    endpoint = "https://api.openai.com/v1/chat/completions",
 			    -- secret = os.getenv("OPENAI_API_KEY"), 
 		    },
        copilot = {
          disable = true,
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
        azure = {
 			    disable = true,
 			    endpoint = "https://$URL.openai.azure.com/openai/deployments/{{model}}/chat/completions",
 			    secret = os.getenv("AZURE_API_KEY"),
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
      }
    }
    require("gp").setup(conf)
  end
}
