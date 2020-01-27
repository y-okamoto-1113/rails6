class Article < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true
end
# (1..10).each_with_index do |i|
#   Article.create(title: "title title title 0#{i}", body: "test test test est test etste test etste teest test 0#{i}")
# end