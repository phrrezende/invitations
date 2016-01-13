class CreateConvites < ActiveRecord::Migration
  def change
    create_table :convites do |t|
      t.datetime :data_entrega
      t.integer :convidado_id

      t.timestamps null: false
    end
  end
end
