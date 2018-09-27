class AddFieldsToStep < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :title, :string
    add_column :steps, :body, :text
  end
end
