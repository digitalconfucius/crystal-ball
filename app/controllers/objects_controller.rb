class ObjectsController < ApplicationController
  
  def index

    @query = params[:query] if params[:query].present?
    @key = params[:key] if params[:key].present?
    @word = params[:word] if params[:word].present?

    if request.post?

      puts "puts: @query is: #{@query.inspect}"
      puts "attempting to fetch response"
      
      @response = ChatGpt.fetch_response("Your prompt here")

      puts "puts: @response is: #{@response.inspect}"

    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end

  end

end
