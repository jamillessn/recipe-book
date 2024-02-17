class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }
end
