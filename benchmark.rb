require './lib/enigma'
require 'benchmark'
enigma = Enigma.new
p Benchmark.measure {enigma.crack('rsmjytwrzkzwpid k sirlrkyciuppxrcyh', "041118")}
