class HomeController < ApplicationController
  def index
    puts "signed_in?=> #{signed_in?}"
  end

  def about
  end
end
