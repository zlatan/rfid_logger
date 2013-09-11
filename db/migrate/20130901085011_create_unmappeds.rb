class CreateUnmappeds < ActiveRecord::Migration
  def change
    create_table :unmappeds do |t|
      t.string :rfid
      t.timestamps
    end
  end
end
