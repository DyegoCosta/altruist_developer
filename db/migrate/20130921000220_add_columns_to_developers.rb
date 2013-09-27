class AddColumnsToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :provider, :string
    add_column :developers, :uid, :string
  end
end
