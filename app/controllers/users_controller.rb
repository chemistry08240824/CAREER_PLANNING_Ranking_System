class UsersController < ApplicationController
  
  before_action :authenticate_user, {only: [:edit, :update, :mypage, :logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]
 
  def index
    @users = User.order(:money)
  end

  def show
    @mypage_flag = true if @current_user == @user
  end
  
  def logout
    session[:user_id]=nil
    redirect_to("/")
  end
  
  def mypage
  end
  
  #edit_user_path	GET	/users/:id/edit(.:format)	users#edit
  def edit
  end
  
  def update
    @user.name=params[:name]
    @user.email=params[:email]
    @user.college=params[:college]
    @user.group=params[:group]
    @user.career=params[:career]
    @user.course=params[:course]
    @user.interest_industry=params[:interest_industry]
    
    if @user.save
      redirect_to root_url
    else
      render edit_user_path @user
    end
    
  end

  def login_form
  end

  def login
    @user=User.find_by(email: params[:email])
      
      if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect_to("/users/#{@user.id}/edit")
      else
        flash[:danger]="ログイン失敗しました"
        @email = params[:email]
        @password = params[:password]
        render("users/login_form")
      end
  end

  def new
    @user=User.new
  end
  
  #users_path	POST	/users(.:format)	users#create
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id]=@user.id
      redirect_to edit_user_path @user
    else
      flash[:danger] = "ユーザーの登録に失敗しました"
      render("users/new")
    end
  end
  
  private
    def set_user
      @user = User.find_by(id: params[:id])
    end
  
    def ensure_correct_user
      if @current_user != @user
        flash[:danger] = "権限がありません"
        redirect_to root_url
      end
    end
  
end
