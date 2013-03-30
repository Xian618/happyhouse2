require 'test_helper'

class NestoriaQueriesControllerTest < ActionController::TestCase
  setup do
    @nestoria_query = nestoria_queries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nestoria_queries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nestoria_query" do
    assert_difference('NestoriaQuery.count') do
      post :create, nestoria_query: { bedroom_max: @nestoria_query.bedroom_max, bedroom_min: @nestoria_query.bedroom_min, encoding: @nestoria_query.encoding, has_photo: @nestoria_query.has_photo, listing_type: @nestoria_query.listing_type, number_of_results: @nestoria_query.number_of_results, page: @nestoria_query.page, place_name: @nestoria_query.place_name, price_max: @nestoria_query.price_max, price_min: @nestoria_query.price_min }
    end

    assert_redirected_to nestoria_query_path(assigns(:nestoria_query))
  end

  test "should show nestoria_query" do
    get :show, id: @nestoria_query
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nestoria_query
    assert_response :success
  end

  test "should update nestoria_query" do
    put :update, id: @nestoria_query, nestoria_query: { bedroom_max: @nestoria_query.bedroom_max, bedroom_min: @nestoria_query.bedroom_min, encoding: @nestoria_query.encoding, has_photo: @nestoria_query.has_photo, listing_type: @nestoria_query.listing_type, number_of_results: @nestoria_query.number_of_results, page: @nestoria_query.page, place_name: @nestoria_query.place_name, price_max: @nestoria_query.price_max, price_min: @nestoria_query.price_min }
    assert_redirected_to nestoria_query_path(assigns(:nestoria_query))
  end

  test "should destroy nestoria_query" do
    assert_difference('NestoriaQuery.count', -1) do
      delete :destroy, id: @nestoria_query
    end

    assert_redirected_to nestoria_queries_path
  end
end
