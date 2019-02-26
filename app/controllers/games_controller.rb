class GamesController < ApplicationController

  def new
  	@letters = []
  	10.times{@letters << ("A".."Z").to_a.sample }
  end

  def score
  	@letters = params[:letters]
  	@word = params[:word]
  	# puts @letters -> Ouput (sample) : O V H U J E B W D L (use hidden field :letters in order to safe)
  	# puts @word -> written answer (=name) test
  end

end

class

# Read all
def index 
	@Restaurants = Restaurant.all
end 
# rails routes -> /restaurants

# Read one
 def show
   @restaurant = Restaurant.find(params[:id]) # call to DB -> id 1 using the params -> used in order to get data from URL
 end
# -> go to restaurants/1 (noting yet) -> RAILS C: Restaurant.new(name: 'First', stars: 5).save
# you request data from the databse 

# Create -> requires two actions: 2 requests -> new (to display form) and create (to create form)
 def new
   @restaurant = Restaurant.new
 end

 def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    # Will raise ActiveModel::ForbiddenAttributesError
 end

# UPDATE = similar to create, you first need to display (edit) and 
 def edit
   @restaurant = Restaurant.find(params[:id])
 end
 # to display, same as other rows. NOT DRY
 def update
   @restaurant = Restaurant.find(params[:id])
   @restaurant.update(params[:restaurant])
   # different aciton than show! despite the fact that it starts the same way
 end

# DELETE
 def destroy
   @restaurant = Restaurant.find(params[:id])
   @restaurant.destroy
 end

# we can get data from the URL or the form

VIEW
index-file
<h1>Restaurant all<h1>

show-file
<h1>Show <% @restaurant.name %></h1>



ROUTE 
# verb + path + to + controller/
get "restaurants", to: "restaurants#index"
get "restaurants/:id", to: "restaurants#show"
# ROUTES HAVE TO DIFFER, VERB CAN ALSO DO THIS!
get "restaurants/new", to: "restaurants#new" # to display
post "restaurants", to: "restaurants#create" # to create
get "restaurants/:id/edit", to: "restaurants#edit"
patch "restaurants/:id", to: "restaurants#update"
delete "restaurants/:id", to: "restaurants#destroy"
# name it destroy instead of delete (the verb)
# resources: restaurants (only ...)


