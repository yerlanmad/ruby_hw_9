@items = [
  {:name=>"Snickers", :code=>"A01", :quantity=>10, :price=>250},
  {:name=>"Pepsi", :code=>"A02", :quantity=>5, :price=>350},
  {:name=>"Orange Juice", :code=>"A03", :quantity=>10, :price=>400},
  {:name=>"Bon Aqua", :code=>"A04", :quantity=>7, :price=>120},
  {:name=>"Bounty", :code=>"A05", :quantity=>10, :price=>270}
]

def choose(code, money = 0)
  return puts "Товара с кодом '#{code}' не существует" unless @items.any? { |hsh| hsh[:code] == code }

  @items.each_with_index do |hsh, index|
    return puts "#{hsh[:name]}: закончился" if code == hsh[:code] && hsh[:quantity] == 0

    if code == hsh[:code] && money == hsh[:price]
      puts "#{hsh[:name]}"
      @items[index][:quantity] -= 1
    end

    if code == hsh[:code] && money > hsh[:price]
      puts "#{hsh[:name]} и ваша сдача: #{money - hsh[:price]}"
      @items[index][:quantity] -= 1
    end

    if code == hsh[:code] && money < hsh[:price]
      puts "Внесите еще #{hsh[:price] - money} за #{hsh[:name]}"
    end
  end
end

12.times { choose("A01", 250) }
7.times { choose("A02", 480) }
5.times { choose("A03", 300) }
2.times { choose("A99") }

@items.each { |v| puts v }
