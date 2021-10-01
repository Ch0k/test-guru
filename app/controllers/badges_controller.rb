class BadgesController < ApplicationController

  # GET /badges or /badges.json
  def index
    @badges = current_user.badges
  end

end
