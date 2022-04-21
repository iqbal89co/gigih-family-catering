class CreateOrderMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :order_menus do |t|
      t.belongs_to :order
      t.string :name
      t.float :price
      t.integer :qty

      t.timestamps
    end
  end
end
