class Convidado < ActiveRecord::Base
	has_one :convite


	def self.busca_total
		Convidado.where("convidados.id not in (select convidado_id from convites)").count()
	end

	def self.sem_convite
		Convidado.where("convidados.id not in (select convidado_id from convites)")
	end
end
