class NochEineUserId < ActiveRecord::Migration
  def change
	add_column :kommentare, :user_id, :integer
  end
end
