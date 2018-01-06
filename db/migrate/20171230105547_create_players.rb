class CreatePlayers < ActiveRecord::Migration[5.1]
  def up
    create_table :players do |t|

    	t.string :name, :null => false
    	t.string :photo
    	t.integer :club_id, :null => false
    	t.string :position, :null => false
    	t.datetime :date_of_birth, :null => false
    	t.string :national_team, :null => false
    	t.integer :appearences, :default => 0
    	t.integer :wins, :default => 0
    	t.integer :losses, :default => 0
    	t.integer :draws, :default => 0
    	t.datetime :pl_debut
    	t.integer :goals, :default => 0
    	t.integer :assists, :default => 0
    	t.integer :yellow_cards, :default => 0
    	t.integer :red_cards, :default => 0
    	t.integer :penalty_conceded, :default => 0
    	t.integer :penalty_saved, :default => 0
    	t.integer :clean_sheets, :default => 0
        t.integer :previous_club, :default => 0
        t.string :previous_club_info, :null => true


      t.timestamps
    end

   add_index :players, :id
  end

  def down
      drop_table :players
  end
end
