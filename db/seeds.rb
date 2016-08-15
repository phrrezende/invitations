# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

convidados = Convidado.all()

for convidado in convidados
	con = Convidado.find_by(id: convidado.id)
	con.nome_no_convite= "#{con.nome} e Família"
	con.save
end
