require "./src/Price"
require "./src/PriceInfo"

#出力のためにデータを作成する
priceobj = Price.new
info = priceobj.doProcess()

#出力部
puts "【帳票分類】#{info.statistics_name}"
puts "【帳票名】#{info.title}"
puts "【調査周期】：#{info.cycle}"
puts "【最終更新日】：#{info.updated_date}"
puts "【調査品目】：#{info.class_obj[1]['CLASS']['@name']}"
puts "【対象地域】：#{info.class_obj[2]['CLASS']['@name']}"
puts "【データ】↓↓"

info.value.each do |n|
  puts "    #{n['@time'][0..3]}年#{n['@time'][6..7]}月：#{n['$']}円"
end

puts "以上です。"
