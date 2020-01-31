require 'pry'

class Transfer
  # your code here
  @@all = []

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender=nil, receiver=nil, amount=nil)
  @sender = sender
  @receiver = receiver
  @status = 'pending'
  @amount = amount
  @@all << self
  end

  def valid?
  	@sender.valid? && @receiver.valid?

  end

  def execute_transaction
  	if self.valid?

  			if @sender.balance > amount && @status == 'pending'
  				@sender.deposit(-@amount)
  				@receiver.deposit(@amount)
  				@status = 'complete'
  				else
  				self.fail
  			end

  		else 
  			self.fail
  	 end
   end

   def fail
   	   @status = 'rejected'
  		return 'Transaction rejected. Please check your account balance.'
   end

  def reverse_transfer
  	  	if self.valid?

  			if @sender.balance > amount && @status == 'complete'
  				@receiver.deposit(-@amount)
  				@sender.deposit(@amount)
  				@status = 'reversed'
  				else
  				self.fail
  			end

  		else 
  			self.fail
  	 end

  end

end
