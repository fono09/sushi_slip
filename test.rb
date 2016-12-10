class Barcode
	require 'barby'
	require 'barby/barcode/ean_13'
	require 'barby/outputter/png_outputter'

	def initialize(number)
		@barcode = Bardy::EAN13.new(number.to_s)
	end

	def to_png
		'data:image/png:base64, ' + Base64.encode64(Bardy::PngOutputter.new(@barcode).to_ping)
	end
	
end


data = {
	'chain_name': 'びとびとぱっか寿司太郎',
	'store_name': '長野西バイパス',
	'seat_number': 10,
	'num_of_people': 3,
	'tax_per_cent': 8,
	'items': [
		{'name': '120円皿',
   		'price': 120,
		'num': 5},
		{'name': '160円皿',
   		'price': 160,
		'num': 6},
		{'name': '200円皿',
   		'price': 200,
		'num': 5}
	]
}

require 'pango'

format = Cairo::FORMAT_ARGB32
width = 700
height = 300 + data[:items].length*40

def draw_text(context,layout,x,y,text)
	context.move_to(x,y)
	layout.text = text
	context.show_pango_layout(layout)
end

surface = Cairo::ImageSurface.new(format, width, height)
context = Cairo::Context.new(surface)
layout = context.create_pango_layout

current_x = 0
current_y = 0

# 背景
context.set_source_rgb(1,1,1)
context.rectangle(0,0,width,height)
context.fill

# 印字
context.set_source_rgb(0,0,0)
context.select_font_face('IPAPGothic')
layout.alignment = Pango::Layout::ALIGN_CENTER
layout.justify = true
draw_text(context,layout,0,0,data[:chain_name] + data[:store_name])

surface.write_to_png("test.png")

