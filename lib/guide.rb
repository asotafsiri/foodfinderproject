require_relative "restaurant"
class Guide
	class Config
		@@actions=['list','find','add','quit']
		def self.actions; @@actions; end
	end
	def initialize(path=nil)
		#locate the resturant text file at path
		Restaurant.filepath=path
		#or create a new file
		#exit if create fails
		if Restaurant.file_usable?
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
		result=nil
		until result== :quit
		#wahat do you want to do? (list,find,add,quit)
		action=get_action
		#	do that action
		result=do_action(action)
		#repeat until user quits
	    end
		conclusion
	end
	def get_action
		action=nil
		#keep asking for user input  until we get a valid action
		until Guide::Config.actions.include?(action)
		 puts "Actions: "+Guide::Config.actions.join(", ") if action
		 print "> "
	     user_response=gets.chomp
	     action=user_response.downcase.strip
		end
      
	  return action
	end
	def do_action(action)
		case action
		when 'list'
			puts "Listing....."
        when 'find'
			puts "Finding....."
		when 'add'
			add
		when 'quit'
			return :quit
		else 
			puts "\n I dont underestand that command.\n"
		end
	end
	def add
		puts "\n Add a Restaurant \n\n".upcase
		
		restaurant=Restaurant.build_using_questions
         
		if restaurant.save
			puts "\nRestaurant Added.\n\n"
		else 
			puts "\n Save Error: Restaurant not added.\n\n"
		end
	end
	def introduction
		puts "\n\n<<< Welcome to the Food Finder >>> \n\n"
		puts "this is an interactive guide to help you find the food you crave. \n\n"
	end
	def conclusion
		puts "\n<<< Goodby and Bon Appetit ! >>> \n\n\n"
	end

end