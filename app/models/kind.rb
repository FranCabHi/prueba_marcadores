class Kind < ApplicationRecord
    has_many :bookmarks

    def self.chart
        kinds = Kind.all
        hash = {}
        kinds.each do |kind|
            hash[kind.kind_name] = kind.bookmarks.count                
        end
        hash
    end

end
