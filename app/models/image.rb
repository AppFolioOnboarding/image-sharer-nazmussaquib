class Image < ApplicationRecord
  acts_as_taggable_on :tags
  validates :link, presence: true, format: URI.regexp(%w[http https])
  validates :tag_list, presence: true
end
