class CreateProvider < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    remove_column :parts, :provider
  end
end
