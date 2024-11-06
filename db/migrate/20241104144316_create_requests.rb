class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :bandid
      t.json :part
      t.json :lowtam
      t.json :pad
      t.json :key
      t.string :another
      t.text :ownpart
      t.text :monitor
      t.text :whole

      t.timestamps
    end
  end
end
