class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :admin_users do |t|

    	t.string :username, :null => false
    	t.string :password, :null => false

      t.timestamps
    end

    AdminUser.create :username => "deepak24chopra", :password => "deepak783"
   end

  def down
  	drop_table("admin_users")
  end
end
