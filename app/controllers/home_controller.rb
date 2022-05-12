# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  def index
    redirect_to articles_path if logged_in?
  end

  def about; end
end
