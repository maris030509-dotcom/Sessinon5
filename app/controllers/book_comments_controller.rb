class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = Current.user.id
    @book_comment.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to book_path(@book) }
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.find(params[:id])

    if @book_comment.user_id == Current.user.id
       @book_comment.destroy
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to book_path(@book) }
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
