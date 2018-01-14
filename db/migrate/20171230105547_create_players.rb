class CreatePlayers < ActiveRecord::Migration[5.1]
  def up
    create_table :players do |t|
        #injury score 
    	t.string :name, :null => false
    	t.string :photo
    	t.references :club, :index => true
    	t.string :position, :null => false
    	t.datetime :date_of_birth, :null => false
    	t.string :national_team, :null => false
    	t.integer :goals, :default => 0
    	t.integer :assists, :default => 0
    	t.integer :yellow_cards, :default => 0
    	t.integer :red_cards, :default => 0
    	t.integer :penalty_missed, :default => 0
    	t.integer :penalty_saved, :default => 0
    	t.integer :clean_sheets, :default => 0
      t.integer :total_minutes_played, :default => 0
      t.string :injury, :default => 0
      t.integer :total_points, :default => 0


      t.timestamps
    end
    add_foreign_key :players, :clubs
  end

  def down
      drop_table :players
  end
end
