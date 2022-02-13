# frozen_string_literal: true

# Users controller for sign up and stuff
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create; end
end