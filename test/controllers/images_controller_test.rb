require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get images_path
    assert_response :success
    assert_select '#hello', 'Hello World!'
    assert_select 'a[href=?]', '/images/new'
    assert_select '#emptyImageList', 'no images'
  end

  test 'should show images' do
    img1 = Image.create!(link: 'https://www.something.com', created_at: Time.now - 1.hour)
    img2 = Image.create!(link: 'https://www.somethingelse.com', created_at: Time.now - 2.hours)
    get images_path
    arr = assert_select 'img.img-width-restrict'
    assert_equal arr[0]['src'], img1.link
    assert_equal arr[1]['src'], img2.link
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
    img1 = Image.create!(link: 'https://www.something.com', created_at: Time.now - 1.hour)
    get image_url(img1.id)
    assert_response :success
  end
end
