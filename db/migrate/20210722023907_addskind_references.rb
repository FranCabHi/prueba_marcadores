class AddskindReferences < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to(:bkmtypes, :kind, index: true)
    add_reference :bookmarks, :kind, foreign_key: true
  end
end
