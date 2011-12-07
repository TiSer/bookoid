class CreateReaders < ActiveRecord::Migration
  def up
    create_table :readers, do |t|
      t.column :book_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
  end

  def down
    drop_table :readers
  end
end
