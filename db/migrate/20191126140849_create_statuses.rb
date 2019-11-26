class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.datetime :date
      t.integer :status
      t.belongs_to :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
