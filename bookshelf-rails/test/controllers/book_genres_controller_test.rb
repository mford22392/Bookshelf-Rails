require 'test_helper'

class BookGenresControllerTest < ActionController::TestCase
  setup do
    @book_genre = book_genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_genres)
  end

  test "should create book_genre" do
    assert_difference('BookGenre.count') do
      post :create, book_genre: { book_id: @book_genre.book_id, genre_id: @book_genre.genre_id }
    end

    assert_response 201
  end

  test "should show book_genre" do
    get :show, id: @book_genre
    assert_response :success
  end

  test "should update book_genre" do
    put :update, id: @book_genre, book_genre: { book_id: @book_genre.book_id, genre_id: @book_genre.genre_id }
    assert_response 204
  end

  test "should destroy book_genre" do
    assert_difference('BookGenre.count', -1) do
      delete :destroy, id: @book_genre
    end

    assert_response 204
  end
end
