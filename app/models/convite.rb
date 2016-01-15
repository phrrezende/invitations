class Convite < ActiveRecord::Base
	belongs_to :user
	belongs_to :convidado

	def self.busca_total
		Convite.count()
	end
	
end
