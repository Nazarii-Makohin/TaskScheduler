class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :priority
      t.date :due_date
      t.boolean :completed, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :goals, [:user_id, :due_date], name: "index_goals_on_user_and_due_date"
  end
end
