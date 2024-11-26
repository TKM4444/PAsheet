class AddColumnToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :sename, :string
    add_column :requests, :seartist, :string
    add_column :requests, :url, :string
  end
end
