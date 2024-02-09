class ObjectsController < ApplicationController
  
  def index

    @query = params[:query] if params[:query].present?
    @key = params[:key] if params[:key].present?
    @word = params[:word] if params[:word].present?

    respond_to do |format|
      format.html
      format.turbo_stream
    end

  end

end
