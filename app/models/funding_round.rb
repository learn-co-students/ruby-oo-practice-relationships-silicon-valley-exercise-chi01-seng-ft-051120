p "*" * 25
p "running 'funding_round.rb'"

class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment 

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        if investment < 0 
            return "ERROR!"
        end 
        @startup = startup 
        @venture_capitalist = venture_capitalist
        @type = type 
        @investment = investment.to_f 
        @@all << self
    end 

    def self.all 
        @@all
    end  

end
