class CreateTeaServices < ActiveRecord::Migration[6.1]
  def change
    create_table :tea_services do |t|
      t.references :tea, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
