class RenameCollumnUsuarioIdToConvite < ActiveRecord::Migration
  def change
  	rename_column :convites, :usuario_id, :user_id
  end
end
