class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :repository_url
      t.string :status
      t.belongs_to :organization, index: true

      t.timestamps
    end

    create_table :projects_developers do |t|
      t.belongs_to :project
      t.belongs_to :developer
      t.boolean :leader
    end
  end
end
