class Api::V1::BookGenresController < ApplicationController
  before_action :set_book_genre, only: [:show, :update, :destroy]

  # GET /book_genres
  # GET /book_genres.json
  def index
    @book_genres = BookGenre.all

    render json: @book_genres
  end

  # GET /book_genres/1
  # GET /book_genres/1.json
  def show
    render json: @book_genre
  end

  # POST /book_genres
  # POST /book_genres.json
  def create
    @book_genre = BookGenre.new(book_genre_params)

    if @book_genre.save
      render json: @book_genre, status: :created, location: @book_genre
    else
      render json: @book_genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_genres/1
  # PATCH/PUT /book_genres/1.json
  def update
    @book_genre = BookGenre.find(params[:id])

    if @book_genre.update(book_genre_params)
      head :no_content
    else
      render json: @book_genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_genres/1
  # DELETE /book_genres/1.json
  def destroy
    @book_genre.destroy

    head :no_content
  end

  private

    def set_book_genre
      @book_genre = BookGenre.find(params[:id])
    end

    def book_genre_params
      params.require(:book_genre).permit(:book_id, :genre_id)
    end
end
