class HomeController < ApplicationController
  def index
    @profile = Profile.find_by(params[:user_id])
  end
end
