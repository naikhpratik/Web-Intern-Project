class PageController < ApplicationController

before_action :authenticate_puser!, only: [:contact]

  def home
  end

  def about
  end

  def contact
  end
end
