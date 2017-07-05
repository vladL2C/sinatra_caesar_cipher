require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do 
erb :index, :locals => {:message => ""}
end

post '/' do 
string = params['string']
shift = params['shift'].to_i
message = caesar_cipher(string,shift)
erb :index, :locals => {:message => message}
end  

def caesar_cipher(string, shift)
	caesar_string = ""
	string.scan(/./) do |letter|
		if ("a".."z").include? (letter.downcase) 
			shift.times {letter = letter.next}
		end
		caesar_string << letter[-1]
	end
	return caesar_string 

end