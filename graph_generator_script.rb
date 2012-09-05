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


  dg=RGL::DirectedAdjacencyGraph[1,2 ,2,3 ,3,1]
  # Use DOT to visualize this graph:
  require 'rgl/dot'
  dg.write_to_graphic_file('jpg','3types')

  #dg=RGL::DirectedAdjacencyGraph[1,2, 1,4, 2,3, 2,5, 3,4, 3,1, 4,5, 4,2, 5,1, 5,3]
  dg=RGL::DirectedAdjacencyGraph[1,2,1,4,2,3,2,5,3,4,3,1,4,5,4,2,5,1,5,3]
  dg.write_to_graphic_file('jpg','5types')
  #system("dot -Tps graph.dot -o output.ps")
  #system("dot -Tsvg graph.dot >output.svg")


dg=RGL::DirectedAdjacencyGraph[]
i = 1
odd_limit = (types/2)
#a=[]   this initializes the array
#a<<5   this appends
#a<<6   this also appends
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

#
#loop over all
	#loop over odds
		#append current number, append + current odd

#odd_limit.each { |odd|

for one in 1..types
	for odd in odds_array
		#for odd in 1..odd_limit
		#var1
		var1 = one
		var2 = (one+odd)%(types)
		if var2 == 0
			var2 = types
		end

		out_array=out_array<<var1
		out_array=out_array<<var2

		dg.add_edge(var1,var2)
		#add to empty graph (var1, var2)
	
	end
end
out_array

out_array
types = types.to_s
outputname = "#{types} types"
dg.write_to_graphic_file('jpg', outputname)



