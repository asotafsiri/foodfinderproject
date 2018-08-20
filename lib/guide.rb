require_relative "restaurant"
class Guide
	def initialize(path=nil)
		#locate the resturant text file at path
		Restaurant.filepath=path
		#or create a new file
		#exit if create fails
		if Restaurant.file_exists?
			puts "Found restaurant file. "
		elsif Restaurant.create_file
			puts "Created restaurant file. "
		else
			puts "Exiting...\n\n"
			exit!
		end
				
		
	end
	def launch!
		introduction
		#action loop
		#wahat do you want to do? (list,find,add,quit)
		#	do that action
		#		repeat until user quits
				conclusion
	end
	def introduction
		puts "\n\n<<< Welcome to the Food Finder >>> \n\n"
		puts "this is an interactive guide to help you find the food you crave. \n\n"
	end
	def conclusion
		puts "\n<<< Goodby and Bon Appetit ! >>> \n\n\n"
	end

end