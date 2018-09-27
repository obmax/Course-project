class AddManualIdToUploads < ActiveRecord::Migration[5.2]
  def change
  	  add_column :uploads, :manual_id, :integer
  end
end
