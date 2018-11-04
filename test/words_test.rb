require './test/test_helper'
require './lib/words'

class WordsTest < Minitest::Test

  def test_it_knows_common_words
    assert Words.common?('who')
    assert Words.common?('am')
    assert Words.common?('this')
    assert Words.common?('world')
    assert Words.common?('hello')
  end

  def test_it_knows_common_gibberish_isnt_a_word
    refute Words.common?('sdfsdf')
  end

end
