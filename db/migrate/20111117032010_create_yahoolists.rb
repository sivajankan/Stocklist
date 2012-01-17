class CreateYahoolists < ActiveRecord::Migration
  def change
    create_table :yahoolists do |t|

      t.timestamps
    end
  end
end
