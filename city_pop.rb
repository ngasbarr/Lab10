def get_population(state, *file)
	filename = ( file[0] ||= 'citypop.txt' )
	
	cities = {}
	pop_file = File.open(filename)
	
	pop_file.each_line do |line|
		city, st, population = line.split(/\t/)
		if state == st
			cities[city] = population.chomp
		end
	end
	
	puts "Top Cities in #{state}"
	puts "----------------------"
	cities.sort.each do |city, population|
		puts "#{city} (#{population})"
	end
end

#get_population("CA", "citypop.txt")
#puts
#get_population("PA")

class Population
	def initialize(*file)
		@filename = (file[0] ||= 'citypop.txt' )
	end
	
	def get_pop_for(state)
		get_population(state, @filename)
	end
end

test = Population.new
test.get_pop_for("TX")
puts
test.get_pop_for("CA")
puts
test2 = Population.new("citypop_1900.txt")
test2.get_pop_for("NY")