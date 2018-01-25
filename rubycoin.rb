require_relative './block'
require_relative './blockchain'

class Rubycoin
  def initialize
    @blockchain = Blockchain.new
  end

  def simulate_transations
    @blockchain.next_block('Bob paid Alice $10')
    @blockchain.next_block('Alice paid Bob $5')
    @blockchain.next_block('Peter paid Bob $5')

    @blockchain.print_transactions
  end
end

# transactions
# transactions with proof of work (POW)
# transactions with proof of stake (POS)
# transactions, POW, many nodes
# transactions, POW, many nodes, with attacker
