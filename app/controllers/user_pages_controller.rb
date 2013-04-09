class UserPagesController < ApplicationController
before_filter :authenticate_user!

  def home
  end

  def profile
  end
end
