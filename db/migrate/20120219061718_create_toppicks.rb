class CreateToppicks < ActiveRecord::Migration
  def change
    create_table :toppicks do |t|
      t.string :symbol
      t.float :lasttrade
      t.date :pickeddate

      t.timestamps
    end
  end
end
