class AddCollumnUsuarioIdToConvite < ActiveRecord::Migration
  def change
    add_column :convites, :usuario_id, :integer
  end
end
