class UsersController < ApplicationController    

	before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    puts("here")

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save

      redirect_to login_url
    else
     
      render :action => :new
    end

  end

  def show
    if (params[:id])
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])

      redirect_to account_url
    else
      render :action => :edit
    end
  end

end