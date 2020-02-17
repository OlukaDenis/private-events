class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :attended_event
      t.references :attendee

      t.timestamps
    end
    add_index :attendances, %i[attended_event_id attendee_id], unique: true
  end
end
