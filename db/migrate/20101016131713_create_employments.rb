class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.integer :company_id
      t.integer :person_id
      t.date    :start_date
      t.date    :end_date
      t.timestamps
    end
    add_index :employments, :company_id
    add_index :employments, :person_id
  end

  def self.down
    drop_table :employments
  end
end
