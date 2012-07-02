class LinkIdHinzufuegen < ActiveRecord::Migration
  def change
	add_column :kommentare, :link_id, :integer
  end
end
