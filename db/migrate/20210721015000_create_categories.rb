class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :cat_name
      t.references :parent_category, foreign_key: { to_table: :category }
      t.boolean :public_cat, default: true

      t.timestamps
    end
  end
end
