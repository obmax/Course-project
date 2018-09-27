class AddPaperclipToStep < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :steps, :image
  end
end
