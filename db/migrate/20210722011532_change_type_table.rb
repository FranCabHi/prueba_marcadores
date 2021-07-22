class ChangeTypeTable < ActiveRecord::Migration[5.2]
  def change
    rename_table "types", "kinds"
    rename_column(:kinds, :type_name, :kind_name)
    remove_column(:bkmtypes, :name)
  end
end
