class ChangeBooleanToEnum < ActiveRecord::Migration[5.2]
  def change
    remove_column(:categories, :public_cat)
    add_column(:categories, :status, :integer)
  end
end
