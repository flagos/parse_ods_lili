#!/usr/bin/ruby1.9.1

require "roo"


oo = Openoffice.new("fid.ods")
oo.default_sheet = oo.sheets.first
2.upto(29) do |line|
  name        = oo.cell(line,'A')
  birthday    = oo.cell(line,'B')
  mail        = oo.cell(line,'C')
  panier = Array.new

  panier_idx = ["E", "F", "G", "H", "I", "J", "K", "L", "M", "N"]
  panier_idx.each do |idx|
    one_buy = oo.cell(line, idx)
    if (!one_buy.nil?)
      puts "#{one_buy} @#{idx}"
      date, price = one_buy.split
      panier << { "date"  => date,
                  "price" => price}
    end
  end
 if name
   puts name
   puts birthday
   puts mail
   puts panier.inspect
 end
end
