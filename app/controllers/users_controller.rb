class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy]
   
  def new
    @user = User.new
  end
  
  def index
  @users = User.paginate(page: params[:page])
  end
  
  def show
    puts "params in show action is #{params}"
    @user=User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  
  end
  
  def edit
        
  end
  
  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success]="Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def find_user
    puts "params in the find user is #{params}"
    input=params[:input]
    @users = User.find(:all,:conditions =>["users.name LIKE ? OR users.email LIKE ? ", "%#{input}%","%#{input}%"])
    render :partial => "searched_users"
  end
  
   def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
 
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
