require './lib/enigma'
require 'benchmark'
require "yaml"
require "set"


# enigma = Enigma.new
# p Benchmark.measure {enigma.crack('rsmjytwrzkzwpid k sirlrkyciuppxrcyh', "041118")}

word_list = YAML.load_file('./data/words.yml')
p Benchmark.measure {word_list.include?('the')}
p Benchmark.measure {word_list.include?('harvested')}
word_list = word_list.to_set
p Benchmark.measure {word_list.include?('the')}
p Benchmark.measure {word_list.include?('harvested')}
