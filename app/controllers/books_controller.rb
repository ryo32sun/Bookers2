class BooksController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  def index
    # @books = Book.all
    @books = Book.order("#{sort_column} #{sort_direction}")
    @user = current_user
    @book = Book.new
    @tag_lists = Tag.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    tag_list = params[:book][:name].split(',')
    if @book.save
      @book.save_tag(tag_list)
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      @tag_lists = Tag.all
      render :index
    end
  end
  
  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @books = @tag.books.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
    @tag_list = @book.tags.pluck(:name).join(',')
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    tag_list = @book.tags.pluck(:name).join(',')
    if @book.update(book_params)
      @book.save_tag(tag_list)
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def search_book
    @book = Book.new
    @books = Book.search(params[:keyword])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :category)
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
  
  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end
  
  
end

