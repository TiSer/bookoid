class GenresController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :authenticate_admin

  layout "staff"

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])

    respond_to do |format|
      if @genre.save
        format.html { redirect_to(genres_path, :notice => '') }
        format.xml  { render :xml => @genre, :status => :created, :location => @genre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @genre.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        format.html { redirect_to(genres_path, :notice => "") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @genre.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to(genres_url, :notice => "") }
      format.xml  { head :ok }
    end
  end

end
