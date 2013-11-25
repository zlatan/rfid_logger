class CreateUnmappedstudents < ActiveRecord::Migration
  def change
    create_table :unmappedstudents do |t|
      t.string :qrcode
      t.timestamps
    end
  end
end
