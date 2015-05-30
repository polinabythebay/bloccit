class CreateSummaries < ActiveRecord::Migration
  def change
    drop_table :summaries
    create_table :summaries do |t|
      t.text :body

      t.timestamps
    end
  end
end
