class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description
      t.float :price
      t.belongs_to :category

      t.timestamps
    end
  end
end
