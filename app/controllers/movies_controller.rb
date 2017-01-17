class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html {}
      format.json { render json: @movies}
    end
  end

  def create
    @movie = Movie.new(strong_movie_params)
    if @movie.save
      respond_to do |format|
        format.html { redirect_to movies_path }
        format.json { render json: @movie }
      end
    else
      respond_to do |format|
        format.json { render nothing: true,
                      status: 400 }
        format.html { render :index }
      end
    end
  end

  private

    def strong_movie_params
      params.require(:movie).permit(:title)
    end
end
