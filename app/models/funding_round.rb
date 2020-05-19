class FundingRound
  attr_reader :startup, :venture_capitalist, :type, :investment
  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    if investment > 0
      @investment = investment.to_f
      @startup = startup
      @venture_capitalist = venture_capitalist
      @type = type
      @@all << self
    else
      raise "Investment should be greater than zero, don't be cheap!"
    end
  end

  def self.all
    @@all
  end

end