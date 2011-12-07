class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :title
      t.string :author
      t.date   :year
      t.integer :genre_id, :null => false
      t.text :description
      
      t.timestamps 
    end
  end

  def down
    drop_table :books
  end
end
