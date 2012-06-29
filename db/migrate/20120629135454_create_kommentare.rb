class CreateKommentare < ActiveRecord::Migration
  def change
    create_table :kommentare do |t|
      t.string :autor
      t.text :derkommentar

      t.timestamps
    end
  end
end
