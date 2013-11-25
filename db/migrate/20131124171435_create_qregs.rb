class CreateQregs < ActiveRecord::Migration
  def change
    create_table :qregs do |t|
      t.belongs_to :student
      t.timestamps :created_at
    end

  end
end
