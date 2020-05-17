require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


my_start = Startup.new("vacation", "Steven", "domain_name")
his_start = Startup.new("retire", "Sarah", "domi")
her_start = Startup.new("cooking book", "Elliot", "nada")
their_start = Startup.new("movie", "Steven", "domain_name")
our_start = Startup.new("book", "Sarah", "nada")

mark_cuban = VentureCapitalist.new("Mark Cuban", 20000000000)
oprah = VentureCapitalist.new("Oprah", 4000000000)
new_guy = VentureCapitalist.new("Marty McFly", 10000)
new_girl = VentureCapitalist.new("Sarah Jessica Parker", 100000)

round_1 = FundingRound.new(my_start, mark_cuban, "Angel", 20000000)
round_2 = FundingRound.new(their_start, oprah, "Series A", 50000)
round_3 = FundingRound.new(her_start, new_guy, "Series B", 5000)
round_4 = FundingRound.new(their_start, oprah, "Series C", 40000)
round_5 = FundingRound.new(our_start, oprah, "Series D", 20000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line