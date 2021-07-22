class AmendTypeReferencestoKind < ActiveRecord::Migration[5.2]
  def change
    remove_column(:bookmarks, :type_id)
    remove_column(:bkmtypes, :type_id)
  end
end
