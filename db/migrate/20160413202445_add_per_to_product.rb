class AddPerToProduct < ActiveRecord::Migration
  def change
    add_column :products, :per, :boolean
  end
end
