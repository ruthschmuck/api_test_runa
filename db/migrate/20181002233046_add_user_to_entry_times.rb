class AddUserToEntryTimes < ActiveRecord::Migration[5.1]
  def change
    add_reference :entry_times, :user, foreign_key: true
  end
end
