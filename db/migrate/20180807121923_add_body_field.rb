class AddBodyField < ActiveRecord::Migration[5.2]
  def change
  	add_column :manuals, :body, :text
  end
end
