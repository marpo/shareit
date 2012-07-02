class TagsHinzufuegen < ActiveRecord::Migration
  def change
  	add_column :links, :tags, :string
  	add_column :code_snippets, :tags, :string
  end
end
