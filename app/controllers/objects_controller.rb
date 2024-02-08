class ObjectsController < ApplicationController
  
  def index

    if request.post?

      puts "request is post"

      @key = params[:key]
      @word = params[:word]
      @query = params[:query]
    end 

    puts "puts: @query is: #{@query.inspect}"

  end

end
