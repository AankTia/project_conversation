class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :project, null: false, foreign_key: true
      t.string :activity_type
      t.text :content
      t.string :status_change
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
