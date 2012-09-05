  #!/usr/bin/ruby
  require 'rubygems'
  require 'rgl/adjacency'
  require 'rgl/implicit'
  require 'rgl/traversal'
  require 'rgl/dot'
  require 'rgl/graphxml'
  require 'rgl/rdot'
  #require 'lib/codegraph'

  puts "Give me an odd number of types to create a custom rock paper scissors"
  types = 5
  types = gets.chomp
  types = Integer(types)

#Need an empty Directed Graph
dg=RGL::DirectedAdjacencyGraph[]
i = 1

#Limit is the number of Odd numbers, not the maximal count
odd_limit = (types/2)

#Creates empty odd list
out_array=[]
odds_array =[]

puts "odd limit: #{odd_limit}"
odds = 1
while odds <= odd_limit
	if i%2 == 1
		odds_array=odds_array<<i
		#puts odds_array
		odds += 1
	end
	i+=1
end
i = 1
puts odds_array


#Generates the connections of the graph (which ones are linked)
for one in 1..types
	for odd in odds_array
		var1 = one
		var2 = (one+odd)%(types)
		if var2 == 0
			var2 = types
		end

		out_array=out_array<<var1
		out_array=out_array<<var2

		dg.add_edge(var1,var2)	
	end
end

#TODO later, was trying to get the name to print out Ntypes
#example: lets say I had 13 nodes. I want the name to be "13 types".
types = types.to_s

outputname = "Ntypes"
dg.write_to_graphic_file('jpg', outputname)



