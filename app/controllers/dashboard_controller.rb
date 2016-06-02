class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @users = User.all.sort_by {|user| -user.battles_won.count}
    battles = Battle.order(created_at: :desc).to_a
    @current_battle = battles.shift
    @other_battles = battles
  end
end
