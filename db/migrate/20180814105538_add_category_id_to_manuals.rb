class AddCategoryIdToManuals < ActiveRecord::Migration[5.2]
  def change
    add_column :manuals, :category_id, :integer
    add_index :manuals, :category_id
  end
end
