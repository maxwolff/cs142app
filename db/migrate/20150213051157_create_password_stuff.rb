class CreatePasswordStuff < ActiveRecord::Migration
  def change
    add_column :users, :salt, :integer
    add_column :users, :digest, :string
    User.reset_column_information
    User.all.each do |u| 
    	u.password = u.login
    end
  end
end
