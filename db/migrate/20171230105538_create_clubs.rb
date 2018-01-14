class CreateClubs < ActiveRecord::Migration[5.1]
  def up
    create_table :clubs do |t|

    	t.string :name, :null => false
    	t.string :manager_name, :null => false
    	t.string :logo
    	t.string :stadium_name, :null => false


      t.timestamps
    end
  end

  def down
  	drop_table :clubs
  end

end
