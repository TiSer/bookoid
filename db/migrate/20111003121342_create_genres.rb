class CreateGenres < ActiveRecord::Migration
  def up
    create_table :genres, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :title
    end      
  end

  def down
    drop_table :genres
  end
end
