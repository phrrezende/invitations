class AddDescricaoToConvite < ActiveRecord::Migration
  def change
  	add_column :convidados, :nome_no_convite, :string
  end
end
