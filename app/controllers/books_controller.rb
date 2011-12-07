class BooksController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]
  before_filter :prepare

  autocomplete :book, :title, :full => true

  def index
    @books = Book.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
    @book = Book.new
  end

  def user_books
    @books = current_user.books.paginate(:per_page => 3, :page => params[:page])
  end

  def add_book
    Reader.create(:book_id => params[:id], :user_id => current_user.id)
    redirect_to :back
  end

  def drop_book
    @drop_book = Reader.find_by_user_and_book(params[:id], current_user.id).last
    @drop_book.destroy
    redirect_to :back
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.users << current_user

    respond_to do |format|
      if @book.save
        Reader.create(:book_id => @book.id, :user_id => current_user.id)
        format.html { redirect_to(books_path, :notice => '') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(books_path, :notice => "") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url, :notice => "") }
      format.xml  { head :ok }
      format.js   {          }
    end
  end

  private # -------------------------------------------------------------------------

  def prepare
    @genres = Genre.dropdown
  end

end
