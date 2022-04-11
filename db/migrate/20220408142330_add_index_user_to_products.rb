class AddIndexUserToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :user, index: true
    add_column :products, :quantity, :integer
  end
end
