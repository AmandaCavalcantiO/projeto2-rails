class AddUsernameToUSers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true
    remove_column :users, :name
    remove_column :users, :age
  end
end
