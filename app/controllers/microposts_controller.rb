class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  
  def index
    
  end
  
  def create
  @micropost = current_user.microposts.build(params[:microposts])
  if @micropost.save
    flash[:success]="Microposts successfully created"
    redirect_to root_url
  else
    render 'static_pages/home'
  end
  end

  def destroy
  
  end
end