class AddManualAndUserIdsToComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :user_id, :integer
  	add_column :comments, :manual_id, :integer
  end
end
