class BooksController < ApplicationController
  
  before_action :check_user, {only: [:edit,:update,:destroy]}
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books=Book.all
    
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book)
      
    else
      flash[:notice] = ' errors prohibited this obj from being saved:'
      render :index
      
    end
    
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    
    else
      flash[:notice]= ' errors prohibited this obj from being saved:'
      render "edit"
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def check_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end
end
