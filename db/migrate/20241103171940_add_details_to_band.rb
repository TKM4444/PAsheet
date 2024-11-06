class AddDetailsToBand < ActiveRecord::Migration[7.0]
  def change
    add_column :bands, :bandname, :string
    add_column :bands, :bandid, :integer
  end
end
