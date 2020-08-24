#!/usr/bin/env ruby

def stock_picker(prices)
  lowest = prices.min
  highest = prices.max
  return [prices.index(lowest), prices.index(highest)]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
stocks = Array.new(12) {rand(1..50)}
p stocks
p stock_picker(stocks)
stocks = Array.new(12) {rand(1..50)}
p stocks
p stock_picker(stocks)