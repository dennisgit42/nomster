class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_comments = @user.comments.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
  end
end
