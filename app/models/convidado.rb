class Convidado < ActiveRecord::Base
	has_one :convite
	validates :nome, presence: true, uniqueness: true, length: {maximum: 50}
	validates :bairro, presence: true

	def self.busca_total
		Convidado.where("convidados.id not in (select convidado_id from convites)").count()
	end

	def self.sem_convite
		Convidado.where("convidados.id not in (select convidado_id from convites)")
	end

	def self.busca_com_filtro (filtro, valor)
		Convidado.where("#{filtro} like '#{valor}' and convidados.id not in (select convidado_id from convites)")
	end

	def self.descricao
		Convidado.sem_convite.select(:descricao).distinct.order(:descricao)
	end

	def self.cidade
		Convidado.sem_convite.select(:cidade).distinct.order(:cidade)
	end

	def self.bairro
		Convidado.sem_convite.select(:bairro).distinct.order(:bairro)
	end

	
end
