class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_offcanvas_menu
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :full_name])
  end

  private

  def setup_offcanvas_menu
    #TODO: Refactor @menu_scores to be more performant. Calling User.all.sort_by is not scalable.
    @menu_scores            = User.all
                                  .sort_by{|a,b| a.battles_won.count <=> b.battles_won.count if [a,b].all?}
                                  .first(5)
    @menu_battles           = Battle.order(:created_at)
                                    .last(5)
    @menu_commented_battles = Battle.joins(:comments)
                                    .group("comments.battle_id")
                                    .order("count(comments.battle_id) desc")
                                    .limit(5)
  end
end