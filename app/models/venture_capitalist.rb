p "*" * 25
p "running 'venture_capitalist.rb'"

class VentureCapitalist

    attr_reader :name, :total_worth 

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth 
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def self.tres_commas_club 
        self.all.select do |name|
            name.total_worth >= 1000000000
        end 
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self 
        end 
    end 

    def portfolio 
        my_startups = funding_rounds.map do |funding_round|
            funding_round.startup 
        end
        my_startups.uniq 
    end 

    def biggest_investment 
        my_investments = funding_rounds.map do |funding_round|
            funding_round.investment 
        end 
        my_investments.max_by do |investment|
            investment 
        end 
    end 

    def invested(domain)
        in_this_domain = FundingRound.all.select do |funding_round|
            funding_round.startup.domain == domain 
        end 
        money_domain = in_this_domain.map do |funding_round|
            funding_round.investment 
        end 
        money_domain.reduce(0) do |sum, num|
            sum + num 
        end 
    end 
end
