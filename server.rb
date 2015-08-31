require 'pry'
require 'sinatra'
require 'Nokogiri'

def location
  page = "http://freegeoip.net/json/"
  doc = Nokogiri::HTML(open(page, 'User-Agent' => 'ruby'))
  loc = /(latitude)(\":)(\d+.\d+)(,\"longitude\":)(-\d+.\d+)/.match(doc.text)
  @lat = loc[3]
  @lon = loc[5]
  return [lat,lon]
end


get "/" do
  erb :index
end


post '/go' do
    @lat = params[:lat]
    @lon = params[:lon]
    erb :index

end
