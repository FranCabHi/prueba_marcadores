class CreateBkmtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bkmtypes do |t|
      t.string :name
      t.belongs_to :bookmark, index: true
      t.belongs_to :type, index: true

      t.timestamps
    end
  end
end
