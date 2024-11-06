class AddPartnumberToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :partnumber, :integer
  end
end
