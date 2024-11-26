class RemoveFileFromRequest < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :file, :string
  end
end
