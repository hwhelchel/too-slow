class CreateKarmaPoints < ActiveRecord::Migration
  def change
    create_table :karma_points do |t|
      t.references :user, null: false
      t.integer :value,   null: false
      t.string  :label,   null: false

      t.timestamps
    end
  end
end
