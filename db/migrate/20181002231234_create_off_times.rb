class CreateOffTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :off_times do |t|
      t.string :recordOff
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
