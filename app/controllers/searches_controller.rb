class SearchesController < ApplicationController
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model  == "user"
      @users = User.search_for(@content, @method)
    else
      @users = Book.search_for(@content, @method)
    end
  end
end
