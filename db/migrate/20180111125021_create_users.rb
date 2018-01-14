class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      #gameweek joined  cards(4)
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :gender, :null => false
      t.datetime :date_of_birth, :null => false
      t.string :country, :null => false
      t.references :club, :index => true
      t.string :team_name
      t.decimal :budget, :default => 100.0
      t.integer :rank
      t.integer :total_score ,:default => 0
      t.integer :free_transfer, :default => 1
      t.integer :gameweek_joined
      t.string :wildcard, :default => 1
      t.string :triple_captian, :default => 1
      t.string :bench_boost, :default => 1
      t.string :free_hit, :default => 1

      t.timestamps
    end
    add_foreign_key :users, :clubs
  end

  def down
    drop_table :users
  end
end
