class Convite < ActiveRecord::Base
	belongs_to :user
	belongs_to :convidado
	
end
