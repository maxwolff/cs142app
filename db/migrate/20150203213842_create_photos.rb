class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.belongs_to :user
    	t.datetime :date_time
    	t.string :file_name
      t.timestamps
    end
  end
end
