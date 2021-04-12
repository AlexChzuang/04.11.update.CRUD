class MoviesController < ApplicationController
  before_action :find_movie, only: [:edit, :show, :update, :destroy, :vote]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "新增電影成功！"
    else
      render :new
    end
  end

  def edit
  end

  def update 
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "電影編輯成功"
    else
      render :edit
    end
  end

  def vote
    @movie.vote_logs.create(ip_address: request.remote_ip) if @movie
    redirect_to movies_path, notice: "投好票啦～"
  end

  def destroy
    @movie.destroy if @movie
    redirect_to movies_path, notice: "電影資料已被刪除"
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :issued, :comments)
  end

  def find_movie
    @movie = Movie.find_by(id: params[:id])
  end

end
