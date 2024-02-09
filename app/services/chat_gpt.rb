class ChatGpt
    include HTTParty
    base_uri 'api.openai.com/v1'
  
    def self.fetch_response(prompt)
      options = {
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{Rails.application.config.x.chat_gpt.api_key}"
        },
        body: {
          prompt: prompt,
          max_tokens: 50
        }.to_json
      }
  
      response = post("/engines/davinci/completions", options)
      JSON.parse(response.body)
    end
  end
  