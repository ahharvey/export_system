class CreateProtocols < ActiveRecord::Migration
  def change
    create_table :protocols do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
