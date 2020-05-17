p "*" * 25
p "running 'startup.rb'"

class Startup
 
    attr_reader :name, :founder_name, :domain

    @@all = []

    def initialize(name, founder_name, domain)
        @name = name 
        @founder_name = founder_name 
        @domain = domain 
        @@all << self
    end 

    def pivot(name, domain)
        @name = name 
        @domain = domain 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_founder(founder_name)
        self.all.find do |startup| 
            startup.founder_name == founder_name 
        end 
    end
    
    def self.domains 
        self.all.map do |startup|
            startup.domain 
        end 
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def num_funding_rounds 
        my_funding_rounds = FundingRound.all.select do |funding_round| 
            funding_round.startup == self 
        end 
        my_funding_rounds.count 
    end 

    def total_funds 
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.startup == self 
        end 
        my_investments = my_funding_rounds.map do |funding_round| 
            funding_round.investment 
        end 
        my_investments.reduce(0) do |sum, num|
            sum + num 
        end 
    end 

    def investors 
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.startup == self 
        end 
        my_investors = my_funding_rounds.map do |funding_round|
            funding_round.venture_capitalist 
        end 
        my_investors.uniq
    end 

    def big_investors 
        investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end 
    end 

end
