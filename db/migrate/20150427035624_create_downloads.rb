class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :link

      t.timestamps null: false
    end
  end
end
