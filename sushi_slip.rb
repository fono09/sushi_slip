require 'sinatra'

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

get '/' do
	'某寿司チェーン風伝票メーカー 使い方は https://github.com/fono09/sushi_slip まで'
end

post '/' do

end
