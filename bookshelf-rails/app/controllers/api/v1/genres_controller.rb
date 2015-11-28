class Api::V1::GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]

  # GET /genres
  # GET /genres.json
  def index
    @genres = Genre.all

    render json: @genres
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
    render json: @genre
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      head :no_content
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy

    head :no_content
  end

  private

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
