#!/usr/bin/env ruby

def bubble_sort(numbers)

  loop do
    still_sorting = false
    index = 0
    index.upto(numbers.count-1) do 
      if numbers[index+1] < numbers[index]
        higher_number = numbers[index]
        numbers[index] = numbers[index+1]
        numbers[index+1] = higher_number
        still_sorting = true
      end
    end

    if ! still_sorting
      break
    end
  end
  return numbers
end

p array_to_sort = Array.new(10) {rand(0..50)}
p bubble_sort(array_to_sort)
p array_to_sort = Array.new(10) {rand(0..50)}
p bubble_sort(array_to_sort)
p array_to_sort = Array.new(10) {rand(0..50)}
p bubble_sort(array_to_sort)
