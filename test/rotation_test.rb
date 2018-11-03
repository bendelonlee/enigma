require './test/test_helper'
require './lib/crypter'
require './lib/decrypter'

class RotationTest < Minitest::Test

  def setup
    @c = Crypter.new('thesestrings','dont','matterhere')
  end

    def test_it_rotates_a_letter
      assert_equal 'b', @c.rotate_letter('a', 1)
      assert_equal 'a', @c.rotate_letter(' ', 1)
    end

    def test_a_decrypter_rotates_a_letter_backward
      decrypter = Decrypter.new('thesestrings','donot','matterhere')
      assert_equal 'a', decrypter.rotate_letter('b', 1)
    end

    def shift_sums_index_and_amount_by_default
      assert_equal 5, @c.shift(3,2)
    end

    def test_shift_subtracts_index_and_amount_when_on_a_decrypter
      decrypter = Decrypter.new('thesestrings','donot','matterhere')
      assert_equal 1, decrypter.shift(3,2)
    end

    def test_it_rotates_a_string_by_amounts
      assert_equal 'bcad', @c.rotate_string_by_amounts('aaaa', [1, 2, 0, 3])

    end

    def test_it_rotates_a_string_by_key
      assert_equal ' i i ', @c.rotate_string_by_key('zzzzz', '010')
    end

    def test_it_rotates_a_string_by_key_and_offsets
      assert_equal 'bldkc', @c.rotate_string_by_key_and_offsets('     ', '010',[1,2,3])
    end
end
