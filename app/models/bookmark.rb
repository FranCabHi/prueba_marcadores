class Bookmark < ApplicationRecord
    has_many :bkmtypes
    has_many :kinds, through: :bkmtypes

    belongs_to :kind
end
