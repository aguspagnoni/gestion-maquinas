class CreateFailures < ActiveRecord::Migration
  def change
    create_table :failures do |t|

      t.timestamps
    end
  end
end
