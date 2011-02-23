class CreateEggs < ActiveRecord::Migration
  def self.up
    create_table :eggs do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :eggs
  end
end
