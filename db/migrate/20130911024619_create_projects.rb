class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :repository_url
      t.string :status, null: false, default: :unstarted
      t.belongs_to :organization, index: true

      t.timestamps
    end

    create_table :teams do |t|
      t.belongs_to :project, null: false
      t.belongs_to :developer, null: false
      t.boolean :leader, default: false
    end
  end
end
