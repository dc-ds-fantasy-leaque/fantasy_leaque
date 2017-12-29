class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|

      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :gender
      t.datetime :date_of_birth
      t.string :country
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
