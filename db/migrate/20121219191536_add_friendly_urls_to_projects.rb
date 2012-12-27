class AddFriendlyUrlsToProjects < ActiveRecord::Migration
  def change
    add_column :refinery_projects, :slug, :string
    add_index :refinery_projects, :slug
  end
end
