require_relative './block'
require_relative './blockchain'

class ProofOfWork

  def initialize
    @blockchain = Blockchain.new
  end

  def simulate_transactions
    @blockchain.next_block('Bob paid Alice $10')
    @blockchain.next_block('Alice paid Bob $5')
    @blockchain.next_block('Peter paid Bob $5')

    @blockchain.print_transactions
  end
end
