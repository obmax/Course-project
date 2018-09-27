class AddPaperclipToManual < ActiveRecord::Migration[5.2]
  def change
  	add_attachment :manuals, :image
  end
end
