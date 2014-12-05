class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :num
      t.string :head
      t.belongs_to :entity

      t.timestamps
    end
  end
end
