class RemovendoColunaProduto < ActiveRecord::Migration
  def change
    remove_column :products, :image_name
  end
end
