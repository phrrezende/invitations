class Convite < ActiveRecord::Base
	belongs_to :user
	belongs_to :convidado

	def self.busca_total
		Convite.count()
	end
	

	def self.busca(nome_da_busca)
		
		#@convites=Convite.where('nome like ?', 'paulo').where_values_hash
		Convite.joins(:convidado).where("convidados.nome like '%#{nome_da_busca}%'")
		#@convites=Convite.where(convidado_id: "1")
	end
end
