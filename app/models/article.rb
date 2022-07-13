class Article < ApplicationRecord
    validates :title, presense: true, length: {minimum: 4, maximum: 50}
    validates :description, presense: true, length: {minimum: 10, maximum: 500}
end
