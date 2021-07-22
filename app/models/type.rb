class Type < ApplicationRecord
    has_many :bkmtypes
    has_many :bookmarks, through: :bkmtypes

    has_many :bookmarks
end
