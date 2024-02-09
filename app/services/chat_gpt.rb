class ChatGpt
    include HTTParty
    base_uri 'api.openai.com/v1'
  
    def self.fetch_response(api_key, password, prompt)

      if password != Rails.application.config.x.chat_gpt.password
        return "Invalid password \"#{password}\". Request not sent."
      end
      
      if prompt == nil || prompt == " " || prompt == ""
        return "Invalid prompt \"#{prompt}\". Request not sent."
      end

      localApiKey = api_key
      
      if api_key == nil or api_key == ""
        localApiKey = Rails.application.config.x.chat_gpt.api_key
      end

      options = {
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{localApiKey}"
        },
        body: {
          model: "gpt-3.5-turbo",
          messages: [{ role: 'user', content: prompt }],
        }.to_json
      }
  
      response = HTTParty.post('https://api.openai.com/v1/chat/completions',
        body: options[:body],
        headers: options[:headers],
        timeout: 30)

      puts "Full Response: #{JSON.parse(response.body)}"

      if response.code == 200
       return response['choices'][0]['message']['content']
      else 
        return "Error #{response.code}: #{response['error']['message']}"
      end
      
    end
  end
  