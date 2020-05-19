class Startup
  attr_reader :name, :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    @name = name
    @domain = domain
  end 

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment.to_f)
  end

  def funding_rounds
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    (funding_rounds.map {|fr| fr.investment}).sum
  end

  def investors
    (funding_rounds.map {|fr| fr.venture_capitalist}).uniq
  end

  def big_investors
    investors.select {|vc| vc.total_worth}
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    self.all.collect {|startup| startup.domain}
  end

  private
  attr_writer :domain, :name
end