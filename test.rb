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

require 'RMagick'

width = 700
height = 300 + data[:items].length*40

image_list = Magick::ImageList.new
image = Magick::Image.new(width,height){
	self.background_color = 'white'
}
font = "ipagp.ttf"
big_pointsize = 20
small_pointsize = 15

current_y = 0

# 印字
draw = Magick::Draw.new
current_y += big_pointsize
draw.annotate(image, width, height, 0, current_y, data[:chain_name] + ' ' + data[:store_name] + ' 店') do
	self.font = font
	self.fill = 'black'
	self.stroke = 'transparent'
	self.pointsize = big_pointsize
	self.gravity = Magick::NorthGravity
end
current_y += big_ponintsize

#draw.annotate(image, width, height, 0, current_y, data[


draw = Magick::Draw.new
draw.annotate(
image.write("test.png")


def draw_text(context,layout,x,y,text)
end


# 背景

# 印字

