class CreateEntryTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :entry_times do |t|
      t.string :recordEntry

      t.timestamps
    end
  end
end
