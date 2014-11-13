class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :started_at
      t.integer :duration
      t.boolean :billed
      t.string :notes
      t.references :task, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
