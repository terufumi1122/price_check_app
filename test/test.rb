require "./src/Price"
require "./src/PriceInfo"

#出力のためにデータを作成する
priceobj = Price.new
info = priceobj.doProcess()

#出力部
puts "【帳票分類】   #{info.statistics_name}"
puts "【帳票名】     #{info.title}"
puts "【調査周期】   #{info.cycle}"
puts "【最終更新日】 #{info.updated_date}"
puts "【調査品目】   #{info.class_obj[1]['CLASS']['@name']}"
puts "【対象地域】   #{info.class_obj[2]['CLASS']['@name']}"
puts ""

price_array = info.value.map{|h| h['$'].to_i}

p price_array

price_max = price_array.max
price_min = price_array.min
price_average = (price_max + price_min)/2
price_median = price_array.sort[price_array.size / 2]
price_width = price_max.to_r - price_min.to_r
price_split = (price_width / 19)

puts "【最高価格】   #{price_max}円"
puts "【最低価格】   #{price_min}円"
puts "【平均価格】   #{price_average}円"
puts "【中央値】     #{price_median}円"
puts "【変動幅】     #{price_width.to_i}円"
puts "【時系列データ】"
info.value.each do |n|
  year = n['@time'][0..3]
  month = n['@time'][6..7]
  price = n['$'].to_i
  graph_value = ((price - price_min) / price_split).to_i

  puts "#{year}年#{month}月 #{":" * (graph_value + 1)}#{" " * (20 - graph_value)}#{price}円"
end



puts "以上です。"
