class Convidado < ActiveRecord::Base
	has_one :convite


	def self.busca_total
		Convidado.where("convidados.id not in (select convidado_id from convites)").count()
	end

	def self.sem_convite
		Convidado.where("convidados.id not in (select convidado_id from convites)")
	end

	def self.busca_bairro (bairro)
		Convidado.where("bairro like '%#{bairro}%' and convidados.id not in (select convidado_id from convites)")
	end
end
