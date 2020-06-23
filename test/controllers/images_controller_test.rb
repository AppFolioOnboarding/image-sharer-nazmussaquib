require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get images_path
    assert_response :success
    assert_select '#hello', 'Hello World!'
    assert_select 'a[href=?]', '/images/new'
    assert_select '#emptyImageList', 'no images'
  end

  test 'should show no images when searched with garbage tag' do
    get images_path(filters: 'asd')
    assert_response :ok
    assert_select '#emptyImageList', 'no images'
  end

  test 'should get filtered images in index' do
    imgs = [
      Image.create!(link: 'https://www.something.com', tag_list: 'asd, bnf', created_at: Time.now - 1.hour),
      Image.create!(link: 'https://www.somethingelse.com',
                    tag_list: 'asd, bnf', created_at: Time.now - 2.hours),
      Image.create!(link: 'https://www.somethingelseagain.com', tag_list: 'bnf', created_at: Time.now - 3.hours)
    ]
    get images_path(filters: 'asd')
    assert_response :ok
    assert_select '.image-container' do |images|
      assert_equal 2, images.size
      images.each_with_index do |image, idx|
        assert_select image, ".img-width-restrict[src='#{imgs[idx].link}']"
        assert_select image, '.image-tags', text: 'asd'
      end
    end
  end

  test 'should show images' do
    img1 = Image.create!(link: 'https://www.something.com', created_at: Time.now - 1.hour)
    img2 = Image.create!(link: 'https://www.somethingelse.com', created_at: Time.now - 2.hours)
    get images_path
    arr = assert_select '.img-width-restrict'
    assert_equal arr[0]['src'], img1.link
    assert_equal arr[1]['src'], img2.link
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
    assert_select 'input[name=?]', 'image[link]'
    assert_select 'input[name=?]', 'image[tag_list]'
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: { link: 'https://www.google.com', tag_list: 'asd, bnf' } }
    end

    assert_redirected_to image_url(Image.last)
    assert_equal %w[asd bnf], Image.last.tags.map(&:name)
  end

  test 'should show image' do
    img1 = Image.create!(link: 'https://www.something.com', tag_list: 'asd, ghj', created_at: Time.now - 1.hour)
    get image_url(img1.id)
    assert_response :success
    assert_select '.image-tags', text: 'asd'
    assert_select '.image-tags', text: 'ghj'
  end

  test 'should destroy successfully' do
    img = Image.create!(link: 'https://www.something.com', tag_list: 'asd, ghj', created_at: Time.now - 1.hour)
    assert_difference 'Image.count', -1 do
      delete image_url(img.id)
    end
    assert_redirected_to images_path
    assert_equal 'You have successfully deleted the image.', flash['notice']
  end
end
