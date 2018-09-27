class AddUserIdToSteps < ActiveRecord::Migration[5.2]
  def change
  	add_column :steps, :user_id, :integer
  end
end
