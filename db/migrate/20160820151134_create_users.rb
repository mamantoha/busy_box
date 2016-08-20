class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :online, null: false, default: false

      t.timestamps
    end
  end
end
