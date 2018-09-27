class AddManualIdToSteps < ActiveRecord::Migration[5.2]
  def change
	add_column :steps, :manual_id, :integer
  end
end
