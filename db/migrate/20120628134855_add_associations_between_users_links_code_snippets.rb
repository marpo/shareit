class AddAssociationsBetweenUsersLinksCodeSnippets < ActiveRecord::Migration
def change
	add_column :code_snippets, :user_id, :integer
	add_column :links, :user_id, :integer
end
end
