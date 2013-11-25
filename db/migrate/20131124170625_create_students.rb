class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :klas
      t.string :qrcode
      t.timestamps
    end
  end
end
