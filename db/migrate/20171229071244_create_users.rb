class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|

      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :password, :null => false
      t.string :gender, :null => false
      t.datetime :date_of_birth, :null => false
      t.string :country, :null => false
      t.integer :club_id
      t.string :team_name
      t.decimal :budget
      t.integer :rank
      t.integer :total_score

      t.timestamps
    end
    add_index :users, :id
    add_index :users, :club_id
  end

  def down
    drop_table :users
  end

end
