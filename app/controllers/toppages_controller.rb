class ToppagesController < ApplicationController
  skip_before_action :require_user_logged_in
  def index
    @articles= Article.all
  end
end
