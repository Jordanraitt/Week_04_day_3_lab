require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

# this is our index route
get('/pizza-orders') do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

#new route
get('/pizza-orders/new')do
  erb(:new)
end

# show route
get('/pizza-orders/:id') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  erb(:show)
end

#create route
post('/pizza-orders') do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

post('/pizza-orders/:id/delete') do
  id = params[:id].to_i()
  @pizza = PizzaOrder.find(id)
  @pizza.delete()
  erb(:destroy)
end
