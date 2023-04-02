require "test_helper"

class ProdutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produt = produts(:one)
  end

  test "should get index" do
    get produts_url
    assert_response :success
  end

  test "should get new" do
    get new_produt_url
    assert_response :success
  end

  test "should create produt" do
    assert_difference("Produt.count") do
      post produts_url, params: { produt: { categorie: @produt.categorie, price: @produt.price, product: @produt.product } }
    end

    assert_redirected_to produt_url(Produt.last)
  end

  test "should show produt" do
    get produt_url(@produt)
    assert_response :success
  end

  test "should get edit" do
    get edit_produt_url(@produt)
    assert_response :success
  end

  test "should update produt" do
    patch produt_url(@produt), params: { produt: { categorie: @produt.categorie, price: @produt.price, product: @produt.product } }
    assert_redirected_to produt_url(@produt)
  end

  test "should destroy produt" do
    assert_difference("Produt.count", -1) do
      delete produt_url(@produt)
    end

    assert_redirected_to produts_url
  end
end
