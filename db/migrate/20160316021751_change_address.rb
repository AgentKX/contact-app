class ChangeAddress < ActiveRecord::Migration
    def change
    change_table :contacts do |t|
    t.integer :longitude
    t.integer :latitude
    end
  end
end
