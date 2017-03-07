class AddProjectnameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :projectname, :string
  end
end
