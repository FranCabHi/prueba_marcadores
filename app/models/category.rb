class Category < ApplicationRecord
    has_many :subcategories, :class_name => "Category", :foreign_key => "parent_category_id", :dependent => :destroy
    belongs_to :parent_category, :class_name => "Category", :optional => true

    has_many :bookmarks

    enum status: [:Private, :Public]

    def children(parent)
        Category.where(parent_category_id: parent.id)
    end
end
