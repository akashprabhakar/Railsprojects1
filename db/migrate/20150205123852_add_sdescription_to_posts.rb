class AddSdescriptionToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :sdesc, :text
  end
end
