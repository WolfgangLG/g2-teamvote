class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string  "name"
      t.string  "image_url"
      t.integer "g2employee_id", null: false
      t.string  "title"
      t.string  "bio"

      t.timestamps null: false
    end
  end
end
