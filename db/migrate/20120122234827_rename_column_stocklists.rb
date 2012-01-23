class RenameColumnStocklists < ActiveRecord::Migration
  def up
    rename_column :stocklists, :code, :symbol
    add_column :stocklists, :industry, :string
    add_column :stocklists, :marketcap, :string
    add_column :stocklists, :ipoyear, :date
  end

  def down
    rename_column :stocklists, :code, :symbol
    remove_column :stocklists, :industry
    remove_column :stocklists, :marketcap
    remove_column :stocklists, :ipoyear
  end
end
