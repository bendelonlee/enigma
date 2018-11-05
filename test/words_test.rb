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

  def test_it_knows_gibberish_isnt_a_word
    refute Words.common?('sdfsdf')
  end

  def test_it_can_count_words
    assert_equal 2, Words.word_count('hello world')

  end

end
