require 'digest'

class Block
  attr_accessor :hash
  attr_reader :data, :previous_block_hash, :nonce

  DIFFICULTY = 3

  def initialize(index, data, previous_block_hash)
    @index = index
    @timestamp = Time.now.to_s
    @data = data
    @previous_block_hash = previous_block_hash
    @nonce = 0
    @hash = find_hash
    @total_hash_attempts
  end

  # Hash with proof of work.
  def find_hash
    found_hash = false

    while !found_hash do
      match_for_difficulty = DIFFICULTY.times.map {|i| 0}.join
      test_hash = Digest::SHA256.hexdigest(@nonce.to_s + @index.to_s + @timestamp + @data.to_s + @previous_block_hash)
      if test_hash[0..(DIFFICULTY - 1)] == match_for_difficulty
        found_hash = test_hash
      else
        @nonce += 1
      end
    end
    found_hash
  end
end
