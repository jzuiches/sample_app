class TrainingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
  end

  def destroy
  end

  def show
  end

end
