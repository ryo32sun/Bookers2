class SearchesController < ApplicationController
  
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
    
    if @range == "Tag"
      @tags = Book.looks(params[:search], params[:word])
    end
  end
  
end
