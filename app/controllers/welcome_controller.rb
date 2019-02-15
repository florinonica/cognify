class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def temp_index
  end

  def temp
  end

end
