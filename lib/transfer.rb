require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
 
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
 
  def valid? 
    @sender.valid? && @receiver.valid?
  end 
 
  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance - @amount > 0
      @sender.balance ||-= @amount
      @receiver.balance ||+= @amount
      @status = "complete"
    else  
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
 
  def reverse_transfer
     

  end
 
end
