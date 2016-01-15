class Convidado < ActiveRecord::Base
	has_one :convite


	def self.busca_total
		Convidado.count()
	end
end
