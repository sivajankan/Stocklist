class AddSectorToStocklists < ActiveRecord::Migration
  def change
    add_column :stocklists, :sector, :string
  end
end
