class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.string  :phoneable_type
      t.integer :phoneable_id
      t.string  :number
      t.string  :extension
      t.timestamps
    end
    add_index :phone_numbers, [:phoneable_type, :phoneable_id]
  end

  def self.down
    drop_table :phone_numbers
  end
end
