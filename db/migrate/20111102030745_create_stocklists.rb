class CreateStocklists < ActiveRecord::Migration
  def change
    create_table :stocklists do |t|
      t.string :name
      t.string :code
      t.decimal :value
      t.decimal :pe
      t.decimal :eps

      t.timestamps
    end
  end
end
