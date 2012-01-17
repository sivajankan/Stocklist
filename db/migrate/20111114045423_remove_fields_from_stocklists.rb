class RemoveFieldsFromStocklists < ActiveRecord::Migration
  def up
    remove_column :stocklists, :value
    remove_column :stocklists, :pe
    remove_column :stocklists, :eps
  end

  def down
    add_column :stocklists, :eps, :decimal
    add_column :stocklists, :pe, :decimal
    add_column :stocklists, :value, :decimal
  end
end
