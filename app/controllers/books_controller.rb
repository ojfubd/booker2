class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update]
  def new
    @book=book.new
  end
  def create
     @book = Book.new(book_params)#ここもエラー
     @book.user_id=current_user.id
     if @book.save
     flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book)
     else
       @books=Book.all
       @user = current_user
       render:index
     end
  end


  def index
     @books = Book.all
     @user = current_user
     @book = Book.new
  end
  def show
      @booka= Book.new
      @book = Book.find(params[:id])
      @user = @book.user
      #bookとuserが結びつく。
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
      render:edit
    end
  end
  def destroy
      book = Book.find(params[:id])  # データ（レコード）を1件取得
      book.destroy  # データ（レコード）を削除
      redirect_to books_path # 投稿一覧画面へリダイレクト
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_book
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end
end

