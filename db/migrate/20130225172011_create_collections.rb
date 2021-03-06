class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string  :name
      t.text    :description
      t.text    :citation
      t.boolean :primary

      t.timestamps
    end
  end
end
