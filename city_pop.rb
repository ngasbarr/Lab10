

#get_population("CA", "citypop.txt")
#puts
#get_population("PA")

class Population
	def initialize(*file)
		@filename = (file[0] ||= 'citypop.txt' )
		@file_lines = Array.new
	end
	
	def read_file
		if @file_lines.empty?
			@file = File.open(@filename)
			@file_lines = @file.readlines()
		end
	end
	
	def filename(new_file)
		@filename = new_file
		@file_lines = Array.new
	end
	
	def get_pop_for(state)
		read_file()
		cities = {}
		
		@file_lines.each do |line|
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
end

test = Population.new
test.get_pop_for("TX")
puts
test.get_pop_for("CA")
puts "TEST 2"
test2 = Population.new("citypop_1900.txt")
test2.get_pop_for("NY")