class AddUserIdToManuals < ActiveRecord::Migration[5.2]
  def change
  	add_column :manuals, :user_id, :integer
  end
end
