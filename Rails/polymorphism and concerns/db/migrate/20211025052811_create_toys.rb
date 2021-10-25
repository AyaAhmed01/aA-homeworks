class CreateToys < ActiveRecord::Migration[6.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false 
      t.index :name, unique: true 
      t.references :toyable, polymorphic: true, index: true 
      t.index [:name, :toyable_id, :toyable_type], unique: true  # one cat/corgi can have only one toy of certain name
      t.timestamps
    end
  end
end
