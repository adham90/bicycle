class AddViewCountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cout, :integer
  end
end
