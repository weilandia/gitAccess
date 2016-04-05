class UsersController < ApplicationController
  def show
    @user = current_user
    require "pry"; binding.pry
  end
end
