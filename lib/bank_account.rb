class BankAccount

	@@all = []

	attr_reader :name
	attr_accessor :status, :balance

	def initialize(name)
		@name = name
		@balance = 1000
		@status = 'open'
		@@all << self
	end

	def deposit(deposit)
		@balance += deposit
	end

	def display_balance
		return "Your balance is $#{@balance}."
	end

	def valid?
		return (@status == 'open' && @balance > 0)
	end

	def close_account
		@status='closed'
	end

end
