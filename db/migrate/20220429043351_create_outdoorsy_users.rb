class CreateOutdoorsyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :outdoorsy_users do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :vehicle_type
      t.string :vehicle_name
      t.numeric :vehicle_length
      t.timestamps
    end
  end
end
