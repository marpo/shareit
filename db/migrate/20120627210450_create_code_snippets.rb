class CreateCodeSnippets < ActiveRecord::Migration
  def change
    create_table :code_snippets do |t|
      t.string :titel
      t.string :sprache
      t.text :beschreibung
      t.text :code


      t.timestamps
    end
  end
end
