class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
