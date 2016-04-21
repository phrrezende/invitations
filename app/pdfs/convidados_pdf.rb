class ConvidadosPdf < Prawn::Document

	def initialize(convidados, total)
		super(top_margin: 70, page_layout: :landscape)
		@convidados=convidados
		@total= total
		title
		line_itens		
	end

	def title
		move_down 10 
		text "Lista de Convidados - Mônica e Paulo ", size: 18, style: :bold, align: :center
		image "#{Rails.root}/app/assets/images/valenticons-22-64.png", vposition: :top, scale: 0.7
	end

	def line_itens
		table line_itens_row do
			row(0).size= 12
			row(0).font_style= :bold
			columns(1..4).align= :left
			column(4).width= 150
			self.row_colors= ["DDDDDD", "FFFFFF"]
			self.header= true	
		end

		move_down 10 
		text "Total de Convidados - #{@total}", size: 16, style: :bold, align: :right
	end

	def line_itens_row
		[['Nome', 'Conjuge', 'Bairro',  'Descricao', "Observação"]] +
		@convidados.map do |item|
			[item.nome, item.conjuge, item.bairro, item.descricao, ""]
		end
	end



end