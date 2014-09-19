class HomeController < ApplicationController

  def index
  end

  def invite
    AmMailer.invite_director('Giorgio', 'gecsper@hotmail.com', 'Dimac').deliver
    render 'index'
  end

end
