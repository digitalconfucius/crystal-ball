class ChatGpt
    include HTTParty
    base_uri 'api.openai.com/v1'
  
    def self.fetch_response(api_key, password, prompt)

      if prompt == nil || prompt == " " || prompt == ""
        return "Invalid prompt \"#{prompt}\". Request not sent."
      end

      if api_key.blank? && password != ENV['CHAT_GPT_PASSWORD']
        return "Invalid password \"#{password}\". Request not sent."
      end
      
      localApiKey = api_key
      
      if api_key.blank? && password == ENV['CHAT_GPT_PASSWORD'] 
        localApiKey = ENV['CHAT_GPT_API_KEY']
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
        timeout: 69)

      puts "Full Response: #{JSON.parse(response.body)}"

      if response.code == 200
       return response['choices'][0]['message']['content']
      else 
        return "Error #{response.code}: #{response['error']['message']}"
      end
      
    end
  end
  