#CLI Controller 

require_relative "../config/environment.rb"

class Coffee_cli
    attr_accessor :scraper, :blend
    attr_reader :name
    
    def call
        puts "Welcome to the Coffee CLI App. Please wait while the app is loading..."
        # scrape_for_coffee
        # initialize
        # scrape_for_coffee
        # titleize
        display_coffee_blends
        display_coffee
        display_description
    end    
    
    def initialize
        
        self.scrape_for_coffee
        # @call = []
    end 

    def scrape_for_coffee
        puts ""
        @scraper = Scraper.new
        @scraper.get_coffee
        # @scraper.get_coffee_blends 
    end

    def display_coffee_blends      #call for  coffee_blends class
        puts "Here are all of Philz Coffee available blends:"
        puts ""
    
        CoffeeBlends.all.each_with_index do |blend, index|      #this will place an interger and a dot in front of each blend
            puts "  #{index+1}. #{blend.name}"
            
        end  
    end
 

    def display_coffee     #call for class coffee
        puts ""
        puts "Please enter the name of the coffee blend that you're interested in:" 
        puts "For example, enter 'Darker Blends' if you want to see the coffees available for that blend"
        input = gets.chomp
        blend = input.split.map(&:capitalize).join(' ')

        # blend_name = titleize(blend)
        # puts blend_name

        blend_coffees = Coffee.all_coffees_in(blend)
        

        if blend_coffees.length > 0 
       
            puts "Here are all of our products for #{blend}: "
            blend_coffees.each_with_index do |coffee, index|
                puts "#{index+1}. #{coffee.name}"
            end 
         
        else
            puts "Sorry that doesn't appear to be a valid blend..."
            display_coffee_blends
        
        end 
    end 

    def display_coffee_info(coffee_name)
        coffee = Coffee.find_by_name(coffee_name)
            puts " "
            puts "Here are the details for our #{coffee.name} coffee"
            puts coffee.description

    end 

    def display_description
        puts ""
        puts "What type of coffee would you like to learn about?"
            input = gets
            description = input.split.map(&:capitalize).join(' ')
            # coffee = Coffee.all.find{|coffee| coffee.name == description}     #match user type to string
            coffee = Coffee.find_by_name(description)
            #puts coffee_name.description
            if coffee != nil 
                # info_for_one_coffee(coffee.name)
                @scraper.get_this_coffee_description(coffee.name)
                display_coffee_info(coffee.name)
            else 
                puts " "
                puts "Bummer! It looks like that isn't a valid coffee name."
                puts " "
            end     
    
        #$coffee_description = Coffee.check_for_coffee_description(coffee_name)
       
        # if coffee.length > 0 

            # puts "#{coffee}"
            # cofffee.each_with_index do |description, index|
            #     puts "#{index+1}. #{description.name}"
            # end 
            
    end 
        
    

end 
     



