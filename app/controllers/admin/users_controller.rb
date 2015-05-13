class Admin::UsersController < AdminController
  before_filter 


  def index
    @users=User.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy  
  end

end
