class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :mail
      t.integer :selected_for
      t.string :curul
      t.string :alternate
      t.belongs_to :group
      t.belongs_to :district
      
      t.timestamps
    end
  end
end
