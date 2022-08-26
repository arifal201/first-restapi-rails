require 'test_helper'

class EbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ebook = ebooks(:one)
  end

  test "should get index" do
    get ebooks_url, as: :json
    assert_response :success
  end

  test "should create ebook" do
    assert_difference('Ebook.count') do
      post ebooks_url, params: { ebook: { name: @ebook.name, title: @ebook.title } }, as: :json
    end

    assert_response 201
  end

  test "should show ebook" do
    get ebook_url(@ebook), as: :json
    assert_response :success
  end

  test "should update ebook" do
    patch ebook_url(@ebook), params: { ebook: { name: @ebook.name, title: @ebook.title } }, as: :json
    assert_response 200
  end

  test "should destroy ebook" do
    assert_difference('Ebook.count', -1) do
      delete ebook_url(@ebook), as: :json
    end

    assert_response 204
  end
end
