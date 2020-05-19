require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# ********* STARTUP INSTANCES ************
twitter = Startup.new("Twitter", "Jack Dorsey", "Social Media")
instagram = Startup.new("Instagram", "Kevin Systrom", "Social Media")
evernote = Startup.new("Evernote", "Bill Gates", "Note Taking")

# ********* VENTURE CAPITALIST INSTANCES ************
ray = VentureCapitalist.new("Ray Dalio", 5000000000)
warren = VentureCapitalist.new("Warren Buffett", 10000000000)
tim = VentureCapitalist.new("Tim Ferris", 50000000)

# ********* FOUNDING ROUND INSTANCES ************
FundingRound.new(twitter, ray, "Type A", 50000)
FundingRound.new(twitter, warren, "Type A", 25000)

FundingRound.new(instagram, tim, "Type A", 30000)
FundingRound.new(instagram, ray, "Type A", 45000)

FundingRound.new(evernote, tim, "Type A", 30000)
FundingRound.new(evernote, warren, "Type A", 45000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line