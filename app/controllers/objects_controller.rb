class ObjectsController < ApplicationController
  def index
    # Initial GET request will not have @data
    if request.post?
      @data = params[:data]
      # Process @data as needed
    end
    # The action will render app/views/home/form_page.html.erb by default
  end

  def submit_form
    # Process the form data here
    @data = params[:data]
    # Do something with @data
    render plain: "Received: #{@data.inspect}"
  end

end
