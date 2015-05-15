class CreateLogin < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    User.reset_column_information
    User.all.each do |t|
    	t.login = t.last_name.downcase
    	t.save
    end
  end
end