class AddFileToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :file, :string
  end
end
