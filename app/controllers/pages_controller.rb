class PagesController < ApplicationController
  def dashboard
    authorize! :read, :dashboard
    @users = User.all
  end
end
