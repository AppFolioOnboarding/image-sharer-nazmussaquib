require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'link is valid' do
    img = Image.new
    refute_predicate img, :valid?

    img.link = 'something'
    refute_predicate img, :valid?

    img.link = 'https://www.someplace.com'
    assert_predicate img, :valid?
  end

  test 'tag is included' do
    img = Image.create!(link: 'https://something.com', tag_list: 'asd, bnf')
    assert_equal %w[asd bnf], img.tags.map(&:name)
  end
end
