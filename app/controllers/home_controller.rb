class HomeController < ApplicationController

  def index
    greetings = ["Hello", "Welcome back", "Hi", "Hey"]
    number = DateTime.now.to_time.to_i
    index = Random.new(number).rand(greetings.size)
    @greeting = greetings[index]
  end

end
