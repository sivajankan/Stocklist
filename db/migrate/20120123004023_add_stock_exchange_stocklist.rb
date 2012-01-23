class AddStockExchangeStocklist < ActiveRecord::Migration
  def up
    add_column :stocklists, :stockexchange, :string
  end

  def down
    remove_column :stocklists, :stockexchange
  end
end
