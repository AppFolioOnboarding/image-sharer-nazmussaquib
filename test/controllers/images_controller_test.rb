require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { link: 'https://www.google.com' } }
    end

    assert_redirected_to image_url(Image.last)
  end

  test 'should show image' do
    get image_url(@image)
    assert_response :success
  end
end
