#!/usr/bin/env ruby

def ceasar_cipher(phrase, shift)
    upper_bounds = *('A'.ord..'Z'.ord)
    lower_bounds = *('a'.ord..'z'.ord)

    cipher = ""
    phrase.each_char do |letter|
        if upper_bounds.include?(letter.ord)
            new_letter = letter.ord-shift
            if new_letter < upper_bounds[0]
                new_letter = upper_bounds[-1]-(upper_bounts[0]-new_letter)
            end
        elsif lower_bounds.include?(letter.ord)
            new_letter = letter.ord-shift
            if new_letter < lower_bounds[0]
                new_letter = lower_bounds[-1]-(lower_bounds[0]-new_letter)
            end
        else 
            new_letter = letter
        end
        cipher += new_letter.chr
    end
    cipher
end

puts ceasar_cipher("This job is mine!", 8)
puts ceasar_cipher("Supercalifragilisticexpialidocious!", 5)
