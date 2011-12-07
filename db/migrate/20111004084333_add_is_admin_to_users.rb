class AddIsAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean, :default => false
    User.create(:email => "resurrec@rambler.ru", :password => "123123", :is_admin => 1)
  end

  def self.down
    remove_column :users, :is_admin
    User.first.destroy
  end
end
