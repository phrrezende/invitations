class CreateConvidados < ActiveRecord::Migration
  def change
    create_table :convidados do |t|
      t.string :nome
      t.string :conjuge
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :descricao

      t.timestamps null: false
    end
  end
end
