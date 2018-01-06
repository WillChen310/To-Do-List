class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.date :due_date
      t.text :description
      t.boolean :checkbox, :default => false
      t.timestamps
    end
  end
end
